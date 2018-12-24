{-# LANGUAGE DeriveGeneric #-}

module Prototype.User (
    User,
    Users,
    allUsers) where

import Data.Aeson (
    FromJSON, 
    ToJSON)
import GHC.Generics

type Users = [User]
data User = User {
    userId   :: Int,
    userName :: String
} deriving (Generic)

instance ToJSON User
instance FromJSON User

type Strings = [String]
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
