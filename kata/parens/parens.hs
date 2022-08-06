
import Data.Char
import System.IO

-- wrong but will work
process_char :: Char -> Int
process_char x
   | x == '(' = 1 
   | x == ')' = -1


check_elem :: Int -> Bool
check_elem -1 = False
check_elem x = True

cumulative_sum :: Num a => [a] -> [a]
cumulative_sum = scanl (+) 0
              

check_parens :: Bool -> String
check_parens True = "yes"
check_parens False = "no"


process_cumulative :: [Int] -> Bool
process_cumulative [] = True
process_cumulative (a:ax) = check_pos(a) && process_cumulative(ax)

check_pos :: Int -> Bool
check_pos x
    | x < 0 = False
    | x >=0 = True


main = myLoop

myLoop = do done <- isEOF
            if done
              then return() 
              else do inp <- getLine
                      let processed = map process_char inp
                      let result1 = process_cumulative (cumulative_sum processed)
                      let sum_processed = sum processed
                      let result = check_parens (result1 && sum_processed == 0)
                      putStrLn result
                      myLoop