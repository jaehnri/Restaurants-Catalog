{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}

{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE OverloadedStrings     #-}
{-# LANGUAGE QuasiQuotes           #-}
{-# LANGUAGE TemplateHaskell       #-}
{-# LANGUAGE TypeFamilies          #-}
{-# LANGUAGE FlexibleContexts #-}

module Handler.Restaurant.UpdateRestaurant where

import Foundation
import Yesod.Core
import Yesod
import Control.Applicative
import Data.Text (Text)
import Widgets


getUpdateRestaurantR :: RestaurantId -> Handler Html
getUpdateRestaurantR restaurantId = do 
    restaurant <- runDB $ get404 restaurantId
    let name = (restaurantName restaurant)
        address = (restaurantAddress restaurant)
        rating = (restaurantRating restaurant)
        
    defaultLayout $ do
        setTitle "Restaurantes"
        widgetHead
        widgetCss
        [whamlet|
        <body>
            ^{widgetHeader}
            <div .main>
                <h2>Restaurantes
                <form action=@{UpdateRestaurantR restaurantId} method=post>
                    <p>
                        Name
                        <input type=text name=name value=#{name}>
                        <br><br>
                        Address
                        <input type=text name=address value=#{address}>
                        <br><br>
                        Rating
                        <input type=number name=rating value=#{rating}>
                        <br><br>
                        <input type=submit value=Update>
            <br>
            ^{widgetFooter}
    |]

postUpdateRestaurantR :: RestaurantId -> Handler Html
postUpdateRestaurantR restaurantId =
    (runInputPost $ Restaurant 
                <$> ireq textField "name" 
                <*> ireq textField "address" 
                <*> ireq intField "rating")                  >>= \ restaurantForm ->
    --primeira computacao: extrair dados do formulario e passar o resultado...(injetando a funcao)
    (runDB $ get404 restaurantId)                                    >>= \ restaurantOldData ->
    --segunda computacao: acesso ao banco de dados para extrair os dados do restaurante antes da atualizacao
    (runDB $ update restaurantId 
        [RestaurantName =. (restaurantName restaurantForm),
         RestaurantAddress =. (restaurantAddress restaurantForm), 
         RestaurantRating =. restaurantRating restaurantForm ] )          >> 
    -- terceira computacao: acesso ao banco de dados para atualizar os dados do restaurante  
    (defaultLayout $ do
        setTitle "Restaurantes"
        widgetHead
        widgetCss
        [whamlet|
            ^{widgetHeader}
            <body>
            <div .main>
                <p>
                    Antes: #{show restaurantOldData}
                <p>
                    Depois: #{show restaurantForm}
                <p>
                    <a href=@{RlistR}>Voltar
            ^{widgetFooter}
        |])
    -- ultima computacao: retorno do tipo Html (return)