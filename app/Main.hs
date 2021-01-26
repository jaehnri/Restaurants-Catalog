{-# LANGUAGE OverloadedStrings #-}

import Application () -- for YesodDispatch instance
import Foundation
import Yesod.Core
import Yesod.Static

import Database.Persist.Postgresql
import Control.Monad.Logger (runStdoutLoggingT)
import Control.Monad.IO.Class (liftIO)

import System.Environment (getEnv)

connStr = "dbname=da2vcje9kn8d3k host=ec2-54-205-248-255.compute-1.amazonaws.com user=fpappocyxjdfru password=d8a2dc271c49c6abec494c60bb1ea0116423f0bfc609e4491e13944c97bc847c port=5432"
main::IO    ()
main = runStdoutLoggingT $ withPostgresqlPool connStr 10 $ \pool -> liftIO $ do
       liftIO $ putStrLn "teste"
       flip runSqlPersistMPool pool $ do
           runMigration migrateAll
           let restaurantId = (toSqlKey 2 :: Key Restaurant)
           restaurant <- get restaurantId
           liftIO $ print restaurant
       static@(Static settings) <- static "static"
       --port <- getEnv "PORT"
       --let portInt = read port
       --warp portInt (App pool static)
       warp 3000 (App pool static)