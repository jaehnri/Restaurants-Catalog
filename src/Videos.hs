{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module Videos where

import Foundation
import Yesod.Core
import Widgets

getVideosR :: Handler Html
getVideosR = 
    defaultLayout $ do
        setTitle "Videos - Projeto Yesod"

        widgetHead
        widgetCss

        [whamlet|
            <body>
                ^{widgetHeader}              
                <div .main>
                    <h2>Vídeo de teste
                    <h5>9 de Junho, 2020
                    <video controls>
                        <source src="" type="video/mp4">
                ^{widgetFooter}
        |]
