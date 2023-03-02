module Main where
-- Creating an infinite data structure
-- The structure will be the fibonacci sequence

main :: IO ()

main = do
    let fibs = 0 : 1 : zipWith (+) fibs (tail fibs)
    user_input <- getLine
    let n = read user_input :: Int
    print $ take n fibs
    main

