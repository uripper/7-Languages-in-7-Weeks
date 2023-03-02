module Main where
import System.Exit (exitWith, ExitCode(..))
-- Creating an infinite data structure
-- The structure will be the fibonacci sequence

main :: IO ()

main = do
    let fibs = 0 : 1 : zipWith (+) fibs (tail fibs)
    putStrLn "Enter the number of fibonacci numbers to print: "
    user_input <- getLine
    let user_value = read $ show user_input :: String
    if user_value == "exit" then exitWith ExitSuccess else do
        -- Check if the value can be converted to an integer
        if not $ all (`elem` ['0'..'9']) user_input then do
            putStrLn "Invalid input"
            main
            else do
            -- Check if the value is greater than 1000
            let n = read user_input :: Int
            if n  > 1000 then putStrLn "Number too large" else
                print $ take n fibs
            main


