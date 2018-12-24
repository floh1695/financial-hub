{-# LANGUAGE OverloadedStrings #-}

module Main where

import qualified Data.Text.Lazy as L

import Web.Scotty
import Prototype.User (allUsers)

main :: IO ()
main = do
    putStrLn "Starting finance hub server"
    scotty 3110 $ do
        get "/test" $ text "Main page"
        get "/test/params/:name/:age" $ do
            name <- param "name"
            age <- param "age"
            let message = name ++ " is age " ++ age
            (text . L.pack) message
        get "/test/users" $ json allUsers
