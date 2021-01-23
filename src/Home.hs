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
                    <h5>9 de Junho, 2020
                    <img src="about:blank">
                    <p>Texto aqui..
                        <div .caixatexto>
                            <p .texto>Lorem ipsum dolor sit amet, consectetur adipiscing elitProin magna velit.
                            
                    <br>
                    <h2>Título da Postagem
                    <h5>1 de Junho, 2020
                    <img src="about:blank">
                    <p>Texto aqui..
                        <div .caixatexto>
                            <p .texto>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                ^{widgetFooter}
        |]
