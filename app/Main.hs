module Main where

import MinCount
import System.IO

makeSimulation :: Handle -> Int -> Int -> [Integer] -> Int -> IO ()
makeSimulation handle k n ns l =
    if n == l then return ()
    else
        let (xs, ys) = splitAt n ns in do
            hPutStrLn handle $ show n ++ "\t" ++ show (ratio (minCount k xs) n)
            makeSimulation handle k (n+1) ys l

writeToFile k = do
    handle <- openFile ("data/" ++ show k ++ ".dat") WriteMode
    makeSimulation handle k 1 [1..] 10001
    hClose handle

main :: IO ()
main = do
    writeToFile 2
    writeToFile 3
    writeToFile 10
    writeToFile 100
    writeToFile 400
