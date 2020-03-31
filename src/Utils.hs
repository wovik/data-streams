module Utils (hashNumber) where

import Crypto.Hash
import Data.ByteString.Char8
import Crypto.Number.Serialize.LE
import Params

hashNumber :: Integer -> Integer
hashNumber = hexHash . toByteString

toByteString :: Integer -> ByteString
toByteString = pack . show

hexHash :: ByteString -> Integer
hexHash n = (`mod` size) $ os2ip $ hashFunc n
