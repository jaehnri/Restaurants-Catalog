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
import Rlist
import Sessao

import Handler.Restaurant.Restaurant
import Handler.Restaurant.CreateRestaurant
import Handler.Restaurant.ListRestaurants

mkYesodDispatch "App" resourcesApp
