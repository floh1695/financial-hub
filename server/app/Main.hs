{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}

module Main where

import qualified Data.Text.Lazy as L

import Data.Aeson (
    FromJSON, 
    ToJSON)
import GHC.Generics
import Web.Scotty

type Strings = [String]

type Users = [User]
data User = User {
    userId   :: Int,
    userName :: String
} deriving (Generic)

instance ToJSON User
instance FromJSON User

names :: Strings
names = [
    "Charlie",
    "Alexander",
    "Miles",
    "Brian",
    "Mechele", 
    "Hannah", 
    "Eric",
    "Zack",
    "Nicholas", 
    "John",
    "Shenole",
    "Jeremy" ]

allUsers :: Users
allUsers = 
    let pairs                   = zip [1..] names
        userFromPair (id, name) = User {
            userId   = id,
            userName = name
        }
    in  map userFromPair pairs

main :: IO ()
main = do
    putStrLn "Starting finance hub server"
    scotty 3000 $ do
        get "/test" $ text "Main page"
        get "/test/params/:name/:age" $ do
            name <- param "name"
            age <- param "age"
            let message = name ++ " is age " ++ age
            (text . L.pack) message
        get "/test/users" $ json allUsers
