{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module Rlist where

import Foundation
import Yesod.Core
import Widgets

getRlistR :: Handler Html
getRlistR = 
    defaultLayout $ do
        setTitle "Restaurantes - Projeto Yesod"

        widgetHead
        widgetCss

        [whamlet|
            <body>
                ^{widgetHeader}
                <div .main>
                    <h2>Restaurantes
                    <a href=@{CreateRestaurantR}> Criar Restaurante
                    <br>
                    <a href=@{ListRestaurantsR}> Ver Lista
                ^{widgetFooter}
        |]
