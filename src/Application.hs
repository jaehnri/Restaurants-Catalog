{-# LANGUAGE OverloadedStrings    #-}
{-# LANGUAGE TemplateHaskell      #-}
{-# LANGUAGE ViewPatterns         #-}

{-# OPTIONS_GHC -fno-warn-orphans #-}
module Application where

import Foundation
import Yesod.Core
import Yesod.Auth

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

import Handler.Food.Food
import Handler.Food.CreateFood
import Handler.Food.ListFood
import Handler.Food.RemoveFood

mkYesodDispatch "App" resourcesApp
