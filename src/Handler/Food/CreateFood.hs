{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}

{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE OverloadedStrings     #-}
{-# LANGUAGE QuasiQuotes           #-}
{-# LANGUAGE TemplateHaskell       #-}
{-# LANGUAGE TypeFamilies          #-}
module Handler.Food.CreateFood where

import Foundation
import Yesod.Core
import Yesod
import Control.Applicative
import Data.Text (Text)
import Widgets

getCreateFoodR :: RestaurantId -> Handler Html
getCreateFoodR restaurantId = defaultLayout $ do
    setTitle "Comidas"
    widgetHead
    widgetCss
    [whamlet|
        <body>
            ^{widgetHeader}
            <div .main>
                <h2>Comidas
                <form action=@{CreateFoodR restaurantId} method=post>
                    <p>
                        Name
                        <input type=text name=name>
                        <br><br>
                        Category
                        <input type=text name=category>
                        <br><br>
                        Price
                        <input type=text name=price>
                        <br><br>
                        <input type=submit value="Create">
            <br>
            ^{widgetFooter}
    |]

postCreateFoodR :: RestaurantId -> Handler Html
postCreateFoodR restaurantId = do
    food <- runInputPost $ Food
                restaurantId
                <$> ireq textField "name"
                <*> ireq textField "category"
                <*> ireq intField "price"
                
    foodId <- runDB $ insert food
    defaultLayout $ do
        setTitle "Food"
        widgetHead
        widgetCss
        [whamlet|
            ^{widgetHeader}
            <body>
                <div .main>
                    <h2>Comida Criada
                    <p>
                        Nome: #{show $ foodName food}
                        <br>
                        Categoria: #{show $ foodCategory food}
                        <br>
                        Preco: #{show $ foodPrice food}
                        <br>
                        ID: #{show foodId}
                        <br>
                    <a href=@{RlistR}>Voltar
            ^{widgetFooter}
        |]