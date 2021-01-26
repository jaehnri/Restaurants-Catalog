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
        <p>
            <a href=@{HomeAuthR}>
                Retornar à página HOME.
    |]