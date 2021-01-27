{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}

module Admin where

import Foundation
import Yesod.Core

getAdminR :: Handler Html
getAdminR = defaultLayout
    [whamlet|
        <p>
            Você é Admin!

            <a href=@{HomeAuthR}>Voltar
            <a href=@{SessaoR}>Ver sessões
    |]