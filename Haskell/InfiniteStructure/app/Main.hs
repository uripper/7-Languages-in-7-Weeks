module Main where

import System.Exit (exitWith, ExitCode(..))
import Data.Char (toLower)

-- Creating an infinite data structure
-- The structure will be the fibonacci sequence
main :: IO ()
main = do
  let fibs = 0 : 1 : zipWith (+) fibs (tail fibs)
  let exitArray = ["exit", "quit", "q"]
      primeArray = ["prime", "p"]
      fibArray = ["fib", "f", "fibonacci"]
  putStrLn "Would you like to create a Fibonnacci structure or a prime number structure? (F/P), or exit?"
  user_input <- getLine
  let user_value = map toLower user_input
  if user_value `elem` exitArray
    then exitWith ExitSuccess
    else if user_value `elem` primeArray
      then do
        putStrLn "Enter a number to find the prime number"
        user_input <- getLine
        let user_value = map toLower user_input
        if user_value `elem` exitArray
          then exitWith ExitSuccess
          else do
            let prime = findPrime user_input
            putStrLn "The prime number at that index is: "
            putStrLn $ show prime
            main
      else if user_value `elem` fibArray
        then do
          putStrLn "Enter an index to find the fibonacci number at that index"
          user_input <- getLine
          let user_value = map toLower user_input
          if user_value `elem` exitArray
            then exitWith ExitSuccess
            else do
              let fibNum = findFib user_input
              putStrLn "The fibonacci number at that index is: "
              putStrLn $ show fibNum
              main
        else do
          putStrLn "Invalid input"
          main

properfactors :: Int -> [Int]
properfactors x = filter (\y -> x `mod` y == 0) [2..x-1]

numproperfactors :: Int -> Int
numproperfactors x = length (properfactors x)

primes :: [Int]
primes = filter (\x -> numproperfactors x == 0) [2..]

fib :: [Int]
fib = 0 : 1 : zipWith (+) fib (tail fib)

findPrime :: String -> Int
findPrime user_input =
  case reads user_input of
    [(val, "")] -> primes !! val
    _           -> 0

findFib :: String -> Int
findFib user_input =
  case reads user_input of
    [(val, "")] -> fib !! val
    _           -> 0
