module Utils (hashNumber, hashString) where

import Data.ByteString.Char8
import Crypto.Number.Serialize.LE
import Params

hashNumber :: Integer -> Integer
hashNumber = hexHash . toByteString

hashString :: String -> Integer
hashString = hexHash . pack

toByteString :: Integer -> ByteString
toByteString = pack . show

hexHash :: ByteString -> Integer
hexHash n = (`mod` size) $ os2ip $ hashFunc n
