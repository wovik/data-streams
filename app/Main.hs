module Main where

import MinCount
import HyperLogLog
import System.IO

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

alpha = 0.1

main :: IO ()
main = do
    writeSuccesses 315 alpha
    writeSuccesses 330 alpha
