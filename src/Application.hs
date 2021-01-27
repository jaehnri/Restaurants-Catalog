{-# LANGUAGE OverloadedStrings    #-}
{-# LANGUAGE TemplateHaskell      #-}
{-# LANGUAGE ViewPatterns         #-}

{-# OPTIONS_GHC -fno-warn-orphans #-}
module Application where

import Foundation
import Yesod.Core
import Yesod.Auth

import Add
import Home
import Videos
import Rlist
import Sessao
import HomeAuth
import Admin

import Handler.Restaurant.Restaurant
import Handler.Restaurant.CreateRestaurant
import Handler.Restaurant.ListRestaurants
import Handler.Restaurant.RemoveRestaurant
import Handler.Restaurant.UpdateRestaurant


mkYesodDispatch "App" resourcesApp
