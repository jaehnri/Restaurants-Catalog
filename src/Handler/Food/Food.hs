{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module Handler.Food.Food where

import Foundation
import Yesod.Core
import Yesod
import Widgets

getFoodR :: FoodId -> Handler Html
getFoodR foodId = do
    food <- runDB $ get404 foodId
    defaultLayout $ do
        widgetHead
        widgetCss
        widgetHeader
        [whamlet|
        <div .main>
            <h2>Foods
            <p>
                Nome: #{show $ foodName food}
                <br>
                Categoria: #{show $ foodCategory food}
                <br>
                Preco: #{show $ foodPrice food}
                <br>
                ID: #{show $ foodId}

            <a href=@{RemoveFoodR foodId}>Remover
            <br>
            <a href=@{RlistR}>Voltar
        |]
        widgetFooter

postFoodR :: FoodId -> Handler Html
postFoodR foodId = error ""
