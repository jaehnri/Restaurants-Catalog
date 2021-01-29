{-# LANGUAGE OverloadedStrings #-}

import Application () -- for YesodDispatch instance
import Foundation
import Yesod.Core
import Yesod.Static

import Database.Persist.Postgresql
import Control.Monad.Logger (runStdoutLoggingT)
import Control.Monad.IO.Class (liftIO)

import System.Environment (getEnv)

connStr = "dbname=d5k9mme9taqrgt host=ec2-54-211-55-24.compute-1.amazonaws.com user=ipqkcffecnagxd password=bb42589a617a498cda56175d71d4d7b7bfa948c2e6a196425812fcc7b23484a9 port=5432"

main::IO    ()
main = runStdoutLoggingT $ withPostgresqlPool connStr 10 $ \pool -> liftIO $ do
       liftIO $ putStrLn "teste"
       flip runSqlPersistMPool pool $ do
           runMigration migrateAll
           let restaurantId = (toSqlKey 2 :: Key Restaurant)
           restaurant <- get restaurantId
           liftIO $ print restaurant
       static@(Static settings) <- static "static"
       port <- getEnv "PORT"
       let portInt = read port
       warp portInt (App pool static)
       --warp 3000 (App pool static)
