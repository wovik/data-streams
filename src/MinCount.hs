module MinCount
    ( minCount,
      ratio
    ) where

import Params
import Data.MultiSet (MultiSet)
import qualified Data.MultiSet as MultiSet
import Data.Ratio
import Utils

getEstimation :: Int -> MultiSet Integer -> Double
getEstimation k set = fromRational $ (s*k1) % h
    where
        h = MultiSet.findMax set
        s = size
        k1 = fromIntegral (k-1)

ratio :: Double -> Int -> Double
ratio n n1 = n / fromIntegral n1

minCount :: Int -> [Integer] -> Double
minCount k ns = case defs of 0 -> getEstimation k set
                             _ -> fromIntegral (k-defs)
    where set = minCountImpl ns $ MultiSet.insertMany size k MultiSet.empty
          defs = MultiSet.occur size set

minCountImpl :: [Integer] -> MultiSet Integer -> MultiSet Integer
minCountImpl [] set = set
minCountImpl (n:ns) set = minCountImpl ns updatedSet
    where
        h = hashNumber n
        updatedSet = MultiSet.deleteMax $ MultiSet.insert h set
