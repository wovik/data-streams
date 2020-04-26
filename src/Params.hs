module Params
    ( bits,
      hashFunc,
      size
    ) where

import qualified Crypto.Hash as H

size = 2^bits+1

bits = 32 :: Int

hashFunc n = H.hash n :: H.Digest H.SHA3_256
-- hashFunc n = H.hash n :: H.Digest H.Whirlpool
-- hashFunc n = H.hash n :: H.Digest H.MD2
