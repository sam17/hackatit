import Data.Char
import System.IO

process_char :: Char -> Int
process_char x
   | x == '(' = 1 
   | x == ')' = -1

cumulative_sum :: Num a => [a] -> [a]
cumulative_sum = scanl (+) 0
              
check_parens :: Bool -> String
check_parens True = "yes"
check_parens False = "no"

process_cumulative :: [Int] -> Bool
process_cumulative [] = True
process_cumulative (a:ax) = (a>=0) && process_cumulative(ax)

main = myLoop

myLoop = do done <- isEOF
            if done
              then return() 
              else do inp <- getLine
                      let processed = map process_char inp
                      let cumulative_processed = process_cumulative (cumulative_sum processed)
                      let sum_processed = sum processed
                      let result = check_parens (cumulative_processed && sum_processed == 0)
                      putStrLn result
                      myLoop