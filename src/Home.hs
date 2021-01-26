{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module Home where

import Foundation
import Yesod.Core
import Widgets

getHomeR :: Handler Html
getHomeR = 
    defaultLayout $ do
        setTitle "Home - Projeto Yesod"

        widgetHead
        widgetCss

        [whamlet|
            <body>
                ^{widgetHeader}                
                <div .main>
                    <h2>Título da Postagem
                    <h5>25 de Janeiro, 2021
                    <img .img1 src=@{StaticR img2_jpeg}>
                    <p>Texto aqui..
                        <div .caixatexto>
                            <p .texto>Lorem ipsum dolor sit amet, consectetur adipiscing elitProin magna velit.
                            
                    <br>
                    <h2>Título da Postagem
                    <h5>25 de Janeiro, 2021
                    <img .img2 src=@{StaticR img1_jpeg}>
                    <p>Texto aqui..
                        <div .caixatexto>
                            <p .texto>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                ^{widgetFooter}
        |]
