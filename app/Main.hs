import Application () -- for YesodDispatch instance
import Foundation
import Yesod.Core

import System.Environment (getEnv)

main :: IO ()
main = do
    port <- getEnv "PORT" 
    let portInt = read port
    warp portInt App
