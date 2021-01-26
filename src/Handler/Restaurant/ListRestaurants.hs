{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}

{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE OverloadedStrings     #-}
{-# LANGUAGE QuasiQuotes           #-}
{-# LANGUAGE TemplateHaskell       #-}
{-# LANGUAGE TypeFamilies          #-}
module Handler.Restaurant.ListRestaurants where

import Foundation
import Yesod.Core
import Yesod
import Control.Applicative
import Data.Text (Text)

getListRestaurantsR :: Handler Html
getListRestaurantsR = do
    restaurantsEntity <- runDB $ selectList [] [Desc RestaurantRating] 
    defaultLayout 
        [whamlet|
            $forall (Entity restaurantId restaurant) <- restaurantsEntity
               <p> 
                    #{show $ restaurantName restaurant}
                    <a href=@{RestaurantR restaurantId }>
                        Detailed data         

        |]
