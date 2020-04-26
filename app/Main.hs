module Main where

import MinCount
import HyperLogLog
import UniqueSum
import System.IO
import System.Random
import Data.List

makeSimulation :: Handle -> Int -> Int -> [Integer] -> Int -> IO ()
makeSimulation handle k n ns l =
    if n == l then return ()
    else
        let (xs, ys) = splitAt n ns in do
            -- hPutStrLn handle $ show n ++ "\t" ++ show (ratio (hyperLogLog k xs) n)
            hPutStrLn handle $ show n ++ "\t" ++ show (ratio (minCount k xs) n)
            makeSimulation handle k (n+1) ys l

writeToFile k = do
    handle <- openFile ("data/" ++ show k ++ ".dat") WriteMode
    makeSimulation handle k 1 [1..] 10001
    hClose handle

checkSuccesses k n ns l alpha =
    if n == l then 0
    else
        if (s > 1+alpha) || (s < 1-alpha) then 0 + checkSuccesses k (n+1) ys l alpha
        else 1 + checkSuccesses k (n+1) ys l alpha
        where
            (xs, ys) = splitAt n ns
            s = ratio (minCount k xs) n

writeSuccesses k alpha =
    putStrLn $ show k ++ "\t " ++ show (checkSuccesses k 1 [1..] 10001 alpha)


-- main :: IO ()
-- main = do
--     writeToFile 4
--     writeToFile 5
--     writeToFile 6
--     writeToFile 7
--     writeToFile 8

-- main :: IO ()
-- main = do
    -- writeToFile 2
    -- writeToFile 3
    -- writeToFile 10
    -- writeToFile 100
    -- writeToFile 400

-- alpha = 0.1

-- main :: IO ()
-- main = do
--     writeSuccesses 315 alpha
--     writeSuccesses 330 alpha


-- Sum

randomlist :: Integer -> Integer -> StdGen -> [Integer]
randomlist a b = randomRs (a,b)

onesAndBigNum = (replicate 99 1) ++ [9223372036854775] ++ onesAndBigNum

sumSecond :: [(Integer,Integer)] -> Int
sumSecond xs = fromInteger $ sum bs
    where (_, bs) = unzip xs

makeSimulationSum :: Handle -> Int -> Int -> [(Integer,Integer)] -> Int -> IO ()
makeSimulationSum handle m n stream l =
    if n == l then return ()
    else
        let (xs, ys) = splitAt n stream in do
            hPutStrLn handle $ show n ++ "\t" ++ show (ratio (uniqueSum m xs) (sumSecond xs))
            makeSimulationSum handle m (n+1) ys l

makeSimulationAvg :: Handle -> Int -> Int -> [(Integer,Integer)] -> Int -> IO ()
makeSimulationAvg handle m n stream l =
    if n == l then return ()
    else
        let (xs, ys) = splitAt n stream
            (ids, _) = unzip xs
            exactVal = ratio (fromIntegral $ sumSecond xs) n
            estimation = (uniqueSum m xs)/(minCount m ids)
            in do
                hPutStrLn handle $ show n ++ "\t" ++ show (estimation/exactVal)
                makeSimulationAvg handle m (n+1) ys l

writeToFileSum m = do
    gen <- newStdGen
    handle <- openFile ("data/" ++ show m ++ ".dat") WriteMode
    makeSimulationAvg handle m 1 (zip [1..] onesAndBigNum) 1001
    hClose handle

main = do
    writeToFileSum 3
    writeToFileSum 10
    writeToFileSum 100
    writeToFileSum 400

