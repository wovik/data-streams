module HyperLogLog
    (
        hyperLogLog
    ) where

import Utils (hashNumber)
import Params
import Data.Bits
import Data.List
import Data.Ratio

firstOne :: Integer -> Int
firstOne n = case find (testBit n) [0..bits] of Nothing -> bits+1
                                                Just n -> n+1

takeBits :: Integer -> Int -> Int
takeBits n 0 = zeroBits
takeBits n b = case testBit n (b-1) of True -> bit (b-1) .|. takeBits n (b-1)
                                       False -> zeroBits  .|. takeBits n (b-1)

dropBits :: Integer -> Int -> Integer
dropBits = shiftR

initRegisters :: Int -> [Int]
initRegisters m = replicate m 0

hyperLogLog :: [Integer] -> Int -> Double
hyperLogLog ns b = hyperLogLog' ns (initRegisters (2^b)) b

inverseRatrional 0 = 0%1
inverseRatrional n = 1%n

hyperLogLog' :: [Integer] -> [Int] -> Int -> Double
hyperLogLog' [] registers b = rawEstimate
    where
        rawEstimate = alpha*(2.0^(b+b))/sumReg
        sumReg = fromRational $ foldl (\x y -> x + (inverseRatrional $ 2^(fromIntegral y))) (0%1) registers
        alpha = case b of 4 -> 0.673
                          5 -> 0.697
                          6 -> 0.709
                          _ -> 0.7213/(1+1.079/(2^b))

hyperLogLog' (n:ns) registers b
    | val > v = hyperLogLog' ns (xs ++ [val] ++ ys) b
    | otherwise = hyperLogLog' ns registers b
    where
        h = hashNumber n
        id = takeBits h b
        val = firstOne $ dropBits h b
        (xs, (v:ys)) = splitAt id registers