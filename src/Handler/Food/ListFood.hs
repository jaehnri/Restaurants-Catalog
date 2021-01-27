{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}

{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE OverloadedStrings     #-}
{-# LANGUAGE QuasiQuotes           #-}
{-# LANGUAGE TemplateHaskell       #-}
{-# LANGUAGE TypeFamilies          #-}
module Handler.Food.ListFood where

import Foundation
import Yesod.Core
import Yesod
import Control.Applicative
import Data.Text (Text)
import Widgets

getListFoodR :: RestaurantId -> Handler Html
getListFoodR restaurantId = do
    foodsEntity <- runDB $ selectList [FoodRestaurantId ==. restaurantId] [Desc FoodPrice]
    restaurant <- runDB $ get404 restaurantId 
    defaultLayout $ do
        widgetHead
        widgetCss
        widgetHeader
        [whamlet|
        <div .main>
            <h2>Comidas de #{show $ restaurantName restaurant}
                    
            $forall (Entity foodId food) <- foodsEntity
               <p> 
                    #{show $ foodName food}
                    <a href=@{FoodR foodId }>
                        Detailed data         
            <a href=@{RlistR}>Voltar
        |]
        widgetFooter