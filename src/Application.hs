{-# LANGUAGE OverloadedStrings    #-}
{-# LANGUAGE TemplateHaskell      #-}
{-# LANGUAGE ViewPatterns         #-}

{-# OPTIONS_GHC -fno-warn-orphans #-}
module Application where

import Foundation
import Yesod.Core

import Add
import Home
import Videos
import Contato

import Handler.Restaurant.Restaurant
import Handler.Restaurant.CreateRestaurant
import Handler.Restaurant.ListRestaurants

mkYesodDispatch "App" resourcesApp
