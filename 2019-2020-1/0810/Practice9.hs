module Practice9 where

import Data.Char

wordNumWithCapital :: String -> Int
wordNumWithCapital ws = wordNumWithCapital' (words ws) 

wordNumWithCapital' :: [String] -> Int 
wordNumWithCapital' [] = 0 
wordNumWithCapital' ((c:_):ws) 
  | isUpper c = 1 + wordNumWithCapital' ws 
  | otherwise = wordNumWithCapital' ws

ones :: Int -> [Int]
ones n = replicate n 1
-- ones 0 = [] 
-- ones n = 1 : ones (n-1)

oneMatrix :: Int -> [[Int]]
-- oneMatrix n = map ones (replicate n n)
oneMatrix n = replicate n (ones n)



-- solve these with map & filter 

doubleAll :: [Int] -> [Int]
doubleAll = map (*2) 

-- use: odd
onlyOdds :: [Int] -> [Int]
onlyOdds = filter odd

-- multiple every element by 4 then mod it by 3
times4Mod3 :: [Int] -> [Int]
times4Mod3 = map (`mod` 3) . map (*4)  

-- use: even
-- gather those elements that have an even modulus by 5
onlyMod5Even :: [Int] -> [Int]
onlyMod5Even = filter (\n -> even (n `mod` 5)) 

onlyMod5Even' :: [Int] -> [Int]
onlyMod5Even' = filter pred where
  pred :: Int -> Bool
  pred n = even (n `mod` 5)

-- take the modulus by 5, then gather those that are even
evenMod5 :: [Int] -> [Int]
evenMod5 = filter even . map (`mod` 5)

-- gather those eleemnts that are not divisible by 5
allButDivisibleBy5 :: [Int] -> [Int]
allButDivisibleBy5 = undefined

-- evensInside [[1,2,3], [4,5,6], [2,7]] 
-- == [[False, True, False], [True, False, True], [True, False]]
evensInside :: [[Int]] -> [[Bool]]
evensInside = undefined 

-- multiLevelEvens [[1,2,3], [4,5,6], [2,7]] 
-- == [[2], [4,6], [2]]
multiLevelEvens :: [[Int]] -> [[Int]]
multiLevelEvens = undefined 

