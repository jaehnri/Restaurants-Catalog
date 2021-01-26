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
                    <h5>25 de Janeiro, 2020
                    <video controls>
                        <source src=@{StaticR videoteste_mp4} type="video/mp4">
                ^{widgetFooter}
        |]
