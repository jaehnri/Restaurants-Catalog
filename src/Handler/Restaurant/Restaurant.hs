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
                Nome: #{show $ restaurantName restaurant}
                <br>
                Endereço: #{show $ restaurantAddress restaurant}
                <br>
                Nota: #{show $ restaurantRating restaurant}
                <br>
                ID: #{show $ restaurantId}
            <a href=@{RlistR}>Voltar

            <a href=@{UpdateRestaurantR restaurantId}>Atualizar

            <a href=@{RemoveRestaurantR restaurantId}>Remover
        |]
        widgetFooter

postRestaurantR :: RestaurantId -> Handler Html
postRestaurantR restaurantId = error ""
