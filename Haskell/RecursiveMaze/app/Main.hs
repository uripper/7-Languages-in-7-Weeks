import Data.List (minimumBy)
import System.Random (randomRIO, newStdGen, randomRs)

main :: IO ()
main = do
    gen <- newStdGen
    let numbers = take 20 $ randomRs (1,100) gen :: [Int]
    putStrLn("Initial array: " ++ show numbers)
    first <- randomRIO (0, length numbers - 1)
    case loop (numbers !! first) (take first numbers ++ drop (first + 1) numbers) of
        Just old_array -> putStrLn("Final array: " ++ show (numbers !! first : old_array))
        Nothing -> putStrLn("Error: remaining list is empty")

loop :: Int -> [Int] -> Maybe [Int]
loop _ [] = Just []
loop lastNumber remaining = do
  let entropy = entropyByCloseness lastNumber remaining
  let next = minimumBy (\x y -> compare (entropy x) (entropy y)) remaining
  rest <- loop next (filter (/= next) remaining)
  return (next : rest)

entropyByCloseness :: Int -> [Int] -> Int -> Double
entropyByCloseness lastNumber remaining x =
  let remaining' = map fromIntegral remaining :: [Double]
      lastNumber' = fromIntegral lastNumber
      x' = fromIntegral x
  in abs (x' - lastNumber') / (sum $ map (abs . (x' -)) remaining')
