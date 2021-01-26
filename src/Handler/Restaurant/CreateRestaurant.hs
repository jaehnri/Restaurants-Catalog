{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}

{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE OverloadedStrings     #-}
{-# LANGUAGE QuasiQuotes           #-}
{-# LANGUAGE TemplateHaskell       #-}
{-# LANGUAGE TypeFamilies          #-}
module Handler.Restaurant.CreateRestaurant where

import Foundation
import Yesod.Core
import Yesod
import Control.Applicative
import Data.Text (Text)
import Widgets

getCreateRestaurantR :: Handler Html
getCreateRestaurantR = defaultLayout $ do
    setTitle "Restaurantes"
    widgetHead
    widgetCss
    [whamlet|
        <body>
            ^{widgetHeader}
            <div .main>
                <h2>Restaurantes
                <form action=@{CreateRestaurantR} method=post>
                    <p>
                        Name
                        <input type=text name=name>
                        <br><br>
                        Address
                        <input type=text name=address>
                        <br><br>
                        Rating
                        <input type=text name=rating>
                        <br><br>
                        <input type=submit value="Create">
            <br>
            ^{widgetFooter}
    |]

postCreateRestaurantR :: Handler Html
postCreateRestaurantR = do
    restaurant <- runInputPost $ Restaurant
                <$> ireq textField "name"
                <*> ireq textField "address"
                <*> ireq intField "rating"
                
    restaurantId <- runDB $ insert restaurant
    defaultLayout $ do
        setTitle "Restaurantes"
        widgetHead
        widgetCss
        [whamlet|
            ^{widgetHeader}
            <body>
                <div .main>
                    <h2>Restaurente Criado
                    <p>
                        Nome: #{show $ restaurantName restaurant}
                        <br>
                        Endereço: #{show $ restaurantAddress restaurant}
                        <br>
                        Nota: #{show $ restaurantRating restaurant}
                        <br>
                        ID: #{show restaurantId}
                        <br>
                    <a href=@{RlistR}>Voltar
            ^{widgetFooter}
        |]