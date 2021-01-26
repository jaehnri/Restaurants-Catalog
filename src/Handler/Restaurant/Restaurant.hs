{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module Handler.Restaurant.Restaurant where

import Foundation
import Yesod.Core
import Yesod
import Widgets

getRestaurantR :: RestaurantId -> Handler Html
getRestaurantR restaurantId = do
    restaurant <- runDB $ get404 restaurantId
    defaultLayout $ do
        widgetHead
        widgetCss
        widgetHeader
        [whamlet|
        <div .main>
            <h2>Restaurantes
            <p>
                #{show restaurant}
            <a href=@{RlistR}>Voltar
        |]
        widgetFooter

postRestaurantR :: RestaurantId -> Handler Html
postRestaurantR restaurantId = error ""
