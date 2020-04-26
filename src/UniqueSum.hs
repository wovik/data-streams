module UniqueSum where

import Utils
import Params
import Data.Ratio

uniqueSum :: Int -> [(Integer, Integer)] -> Double
uniqueSum m ns = uniqueSum' m ns (replicate m (1/0))

uniqueSum' :: Int -> [(Integer, Integer)] -> [Double] -> Double
uniqueSum' m (n:ns) ms = uniqueSum' m ns (updateHashes n m ms)
uniqueSum' m _ ms = m1/dists
    where
        dists = sum ms
        m1 = fromIntegral (m-1)

updateHashes :: (Integer, Integer) -> Int -> [Double] -> [Double]
updateHashes (i, value) k (m:ms) = (min m dist):(updateHashes (i, value) (k-1) ms)
    where
        h = fromRational $ hashString (show i ++ "00000000000000" ++ show k) % size
        dist = - log h/fromInteger value
updateHashes _ 0 _ = []