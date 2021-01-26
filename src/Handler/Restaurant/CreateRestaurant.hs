{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}

{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE OverloadedStrings     #-}
{-# LANGUAGE QuasiQuotes           #-}
{-# LANGUAGE TemplateHaskell       #-}
{-# LANGUAGE TypeFamilies          #-}
module Handler.Restaurant.CreateRestaurant where

import Foundation
import Yesod.Core
import Yesod
import Control.Applicative
import Data.Text (Text)

getCreateRestaurantR :: Handler Html
getCreateRestaurantR = defaultLayout
    [whamlet|
        <form action=@{CreateRestaurantR} method=post>
            <p>
                Name
                <input type=text name=name>
                <br>
                Address
                <input type=text name=address>
                <br>
                Rating
                <input type=text name=rating>
                <br>
                <input type=submit value="Create">
    |]

postCreateRestaurantR :: Handler Html
postCreateRestaurantR = do
    restaurant <- runInputPost $ Restaurant
                <$> ireq textField "name"
                <*> ireq textField "address"
                <*> ireq intField "rating"
                
    restaurantId <- runDB $ insert restaurant
    defaultLayout 
        [whamlet|
            <p>
                #{show restaurant}
            <p>
                The ID of the new Restaurant is #{show restaurantId}
        |]