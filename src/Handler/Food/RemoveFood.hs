{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}

{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE OverloadedStrings     #-}
{-# LANGUAGE QuasiQuotes           #-}
{-# LANGUAGE TemplateHaskell       #-}
{-# LANGUAGE TypeFamilies          #-}
module Handler.Food.RemoveFood where

import Foundation
import Yesod.Core
import Yesod
import Control.Applicative
import Data.Text (Text)
import Widgets

getRemoveFoodR :: FoodId -> Handler Html
getRemoveFoodR foodId = do
    food <- runDB $ get404 foodId
    runDB $ delete foodId
    defaultLayout $ do
        widgetHead
        widgetCss
        [whamlet|
            ^{widgetHeader}
            <body>
            <div .main>
                <p>
                    Comida removida com sucesso.
                <p>
                    <a href=@{RlistR}>Voltar
            ^{widgetFooter}
        |]

postRemoveFoodR :: FoodId -> Handler Html
postRemoveFoodR = undefined