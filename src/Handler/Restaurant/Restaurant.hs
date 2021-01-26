{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module Handler.Restaurant.Restaurant where

import Foundation
import Yesod.Core
import Yesod

getRestaurantR :: RestaurantId -> Handler Html
getRestaurantR restaurantId = do
    restaurant <- runDB $ get404 restaurantId
    defaultLayout 
        [whamlet| 
            <p>
                #{show restaurant}
        |]

postRestaurantR :: RestaurantId -> Handler Html
postRestaurantR restaurantId = error ""
