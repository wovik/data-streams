module HyperLogLog
    (
        hyperLogLog
    ) where

import Utils (hashNumber)
import Params
import Data.Bits
import Data.List
import Data.Ratio
import Data.IntMap (IntMap)
import qualified Data.IntMap as IntMap

type Registers = IntMap Int

firstOne :: Integer -> Int
firstOne n = case find (testBit n) [0..bits] of Nothing -> bits+1
                                                Just n -> n+1

takeBits :: Integer -> Int -> Int
takeBits n 0 = zeroBits
takeBits n b = if testBit n (b-1) then  bit (b-1) .|. takeBits n (b-1)
                                  else zeroBits  .|. takeBits n (b-1)

dropBits :: Integer -> Int -> Integer
dropBits = shiftR

initRegisters :: Int -> Registers
initRegisters m = IntMap.fromList $ zip [0..m-1] $ repeat 0

hyperLogLog :: Int -> [Integer] -> Double
hyperLogLog b ns = hyperLogLog' ns (initRegisters (2^b)) b

inverseRational n = 1%n

log10 = log

rangeCorrection :: Double -> Double -> Registers -> Double
rangeCorrection rawEst m registers
    | rawEst <= (m*5/2) = if v == 0 then rawEst else m*log10 (m/fromIntegral v)
    | rawEst > 2^32/30 = -2^32*log10 (1.0-rawEst/2^32)
    | otherwise = rawEst
        where v = IntMap.size $ IntMap.filter (== 0) registers

hyperLogLog' :: [Integer] -> Registers -> Int -> Double
hyperLogLog' [] registers b = est
    where
        rawEst = alpha*(2.0^(b+b))/sumReg
        sumReg = fromRational $ foldl (\x y -> x + (inverseRational $ 2^(fromIntegral y))) (0%1) registers
        m = 2^b
        est = rangeCorrection rawEst m registers
        alpha = case b of 4 -> 0.673
                          5 -> 0.697
                          6 -> 0.709
                          _ -> 0.7213/(1+1.079/m)

hyperLogLog' (n:ns) registers b
    | val > v = hyperLogLog' ns (IntMap.insert id val registers) b
    | otherwise = hyperLogLog' ns registers b
    where
        h = hashNumber n
        id = takeBits h b
        val = firstOne $ dropBits h b
        v = registers IntMap.! id