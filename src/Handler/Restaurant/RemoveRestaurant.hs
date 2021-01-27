{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}

{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE OverloadedStrings     #-}
{-# LANGUAGE QuasiQuotes           #-}
{-# LANGUAGE TemplateHaskell       #-}
{-# LANGUAGE TypeFamilies          #-}
module Handler.Restaurant.RemoveRestaurant where

import Foundation
import Yesod.Core
import Yesod
import Control.Applicative
import Data.Text (Text)
import Widgets

getRemoveRestaurantR :: RestaurantId -> Handler Html
getRemoveRestaurantR rid = do
    pessoa <- runDB $ get404 rid
    runDB $ delete rid
    defaultLayout $ do
        widgetHead
        widgetCss
        [whamlet|
            ^{widgetHeader}
            <body>
            <div .main>
                <p>
                    Restaurante removido com sucesso.
                <p>
                    <a href=@{RlistR}>Voltar
            ^{widgetFooter}
        |]

postRemoveRestaurantR :: RestaurantId -> Handler Html
postRemoveRestaurantR = undefined