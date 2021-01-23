{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module Contato where

import Foundation
import Yesod.Core
import Widgets

getContatoR :: Handler Html
getContatoR = 
    defaultLayout $ do
        setTitle "Contato - Projeto Yesod"

        widgetHead
        widgetCss

        [whamlet|
            <body>
                ^{widgetHeader}              
                <div .formdecontato>
                    <h2>Ainda por fazer
                ^{widgetFooter}
        |]
