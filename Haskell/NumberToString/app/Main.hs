module Main where
import Prelude
import System.Exit (exitSuccess)
-- Do this in a while loop
-- 1. Get a number from the user
-- 2. Convert the number to a string
-- 3. Print the string
-- 4. Repeat

numberToWord :: Int -> String
numberToWord n
  | n == 0 = "zero"
  | n == 1 = "one"
  | n == 2 = "two"
  | n == 3 = "three"
  | n == 4 = "four"
  | n == 5 = "five"
  | n == 6 = "six"
  | n == 7 = "seven"
  | n == 8 = "eight"
  | n == 9 = "nine"
  | n == 10 = "ten"
  | n == 11 = "eleven"
  | n == 12 = "twelve"
  | n == 13 = "thirteen"
  | n == 14 = "fourteen"
  | n == 15 = "fifteen"
  | n == 16 = "sixteen"
  | n == 17 = "seventeen"
  | n == 18 = "eighteen"
  | n == 19 = "nineteen"
  | n < 100 = let tens = ["twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"]
                  (t, u) = n `divMod` 10
              in tens !! (t - 2) ++ "-" ++ numberToWord u
  | n < 1000 = let (h, t) = n `divMod` 100
               in numberToWord h ++ " hundred " ++ numberToWord t
  | n < 1000000 = let (th, r) = n `divMod` 1000
                  in numberToWord th ++ " thousand " ++ numberToWord r
  | n < 1000000000 = let (m, r) = n `divMod` 1000000
                     in numberToWord m ++ " million " ++ numberToWord r
  | otherwise = error "Number too large to convert to words"
main :: IO ()
main = do
  putStrLn "Enter a number: "
  number <- readLn
  putStrLn ("The number as a string is: " ++ numberToWord number)
  main