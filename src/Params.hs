module Params
    ( bytes,
      hashFunc,
      size
    ) where

import qualified Crypto.Hash as H

size = 2^(bytes*8)+1


bytes = 8
hashFunc n = H.hash n :: H.Digest H.SHA3_256
