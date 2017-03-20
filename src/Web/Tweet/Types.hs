{-# LANGUAGE DeriveGeneric   #-}
{-# LANGUAGE DeriveAnyClass  #-}
{-# LANGUAGE TemplateHaskell #-}

-- | Exports the `Tweet` type, a datatype for building tweets easily
module Web.Tweet.Types where

import GHC.Generics
import Control.Lens
import Data.Default

-- | Default value for Bool for trim_user (`True` in our case)
instance Default Bool where
    def = True

-- | Data type for our request: consists of the status text, whether to trium user information in the response, the handles to mention, and optionally the id of the status to reply to.
data Tweet = Tweet
    { _status   :: String
    , _trimUser :: Bool
    , _handles  :: [String]
    , _replyID  :: Maybe Int
    } deriving (Generic, Default)

-- | Data type for tweets as they are returned
data TweetEntity = TweetEntity
    { _text :: String
    , _name :: String
    , _screenName :: Maybe String
    , _tweetId :: Int
    , _isQuoteStatus :: Bool
    , _retweets :: Int
    , _favorites :: Int
    } deriving (Generic, Default)

-- | Stores data like (name, text, favoriteCount, retweetCount)
type Timeline = [(String, String, String, String)]

makeLenses ''Tweet

makeLenses ''TweetEntity
