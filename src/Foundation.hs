{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell   #-}
{-# LANGUAGE TypeFamilies      #-}
{-# LANGUAGE ViewPatterns      #-}

{-# LANGUAGE OverloadedStrings, TypeFamilies, QuasiQuotes,
             TemplateHaskell, GADTs, FlexibleInstances,
             MultiParamTypeClasses, DeriveDataTypeable,
             GeneralizedNewtypeDeriving, ViewPatterns, EmptyDataDecls#-}


{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE StandaloneDeriving #-}
{-# LANGUAGE UndecidableInstances #-}  

module Foundation where

import Yesod.Core
import Yesod
import Data.Text
import Database.Persist.Postgresql
import Yesod.Static
import Yesod.Auth
import Yesod.Auth.Dummy -- just for testing, don't use in real life!!!

staticFiles "static"

share [mkPersist sqlSettings, mkMigrate "migrateAll"] [persistLowerCase|
Restaurant
    name Text      
    address Text
    rating Int
    deriving Show
Food
    restaurantId RestaurantId
    name Text
    category Text
    price Int
    deriving Show
|]

data App = App {connPool :: ConnectionPool, getStatic :: Static}

mkYesodData "App" $(parseRoutesFile "routes.yesodroutes")

instance Yesod App where
    makeSessionBackend _ = do
        backend <- defaultClientSessionBackend 1 "keyfile.aes"
        return $ Just backend
    authRoute _ = Just $ AuthR LoginR
        
    -- route name, then a boolean indicating if it's a write request
    isAuthorized HomeAuthR True = isAdmin
    isAuthorized AdminR _ = isAdmin
    isAuthorized ListRestaurantsR _ = isUser 
    -- qualquer um pode acessar outras páginas
    isAuthorized _ _ = return Authorized

isAdmin = do
    mu <- maybeAuthId
    return $ case mu of
        Nothing -> AuthenticationRequired
        Just "admin" -> Authorized
        Just _ -> Unauthorized "Você deve ser um admin."

isUser = do
    mu <- maybeAuthId
    return $ case mu of
        Nothing -> AuthenticationRequired
        Just "user" -> Authorized
        Just _ -> Unauthorized "Você deve ser um usuário."

-- sinonimo para o tipo do applicative form
type Form a = Html -> MForm Handler (FormResult a, Widget)

instance YesodAuth App where
    type AuthId App = Text
    authenticate = return . Authenticated . credsIdent

    loginDest _ = HomeAuthR
    logoutDest _ = HomeR

    authPlugins _ = [authDummy]

    maybeAuthId = lookupSession "_ID"

instance RenderMessage App FormMessage where
    renderMessage _ _ = defaultFormMessage

instance YesodPersist App where
   type YesodPersistBackend App = SqlBackend
   runDB f = do
       master <- getYesod
       let pool = connPool master
       runSqlPool f pool
