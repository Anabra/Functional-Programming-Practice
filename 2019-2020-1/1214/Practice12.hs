module Practice12 where

sum1 :: [Int] -> Int 
sum1 []     = 0 
sum1 (x:xs) = x + sum1 xs

-- sum1 [1,2,3] ~ 
-- foldr_ (+) 0 [1,2,3] == 1 + (2 + (3 + (0)))
foldr_ :: (a -> b -> b) -> b -> [a] -> b
foldr_ f neut []     = neut 
foldr_ f neut (x:xs) = f x (foldr_ f neut xs)

-- tail recursion
sum2' :: Int -> [Int] -> Int
sum2' acc []     = acc
sum2' acc (x:xs) = sum2' (acc + x) xs

sum2 :: [Int] -> Int
sum2 = sum2' 0

-- sum2 [1,2,3] 
-- foldl_ (+) 0 [1,2,3] = (((0) + 1) + 2) + 3
foldl_ :: (b -> a -> b) -> b -> [a] -> b
foldl_ f acc []     = acc
foldl_ f acc (x:xs) = foldl_ f (f acc x) xs

-- concat, maximum, length, isort, (++), reverse
-- for isort, use Data.List.insert

-- isort [3,2,7] == insert 3 (insert 2 (insert 7 []))
-- isort [3,2,7] == insert 3 $ insert 2 $ insert 7 $ [] 

concat' :: [[a]] -> [a]
concat' = foldr (++) []

maximum' :: Ord a => [a] -> a
maximum' = foldl1 max
maximum' (x:xs) = foldl max x xs

length' :: [a] -> Int
length' = foldl (\acc _ -> acc + 1) 0

isort :: Ord a => [a] -> [a] 
isort = foldr insert []

-- (++)
(+++) :: [a] -> [a] -> [a]
(+++) xs ys = foldr (:) ys xs
-- (+++) xs ys = foldr (\cur acc -> cur:acc) ys xs

reverse' :: [a] -> [a]
reverse' xs = rev [] xs where 
  rev :: [a] -> [a] -> [a]
  rev alreadyRevved [] = alreadyRevved 
  rev alreadyRevved (x:xs) = rev (x:alreadyRevved) xs  

-- using the definition of rev
reverseWithFoldl :: [a] -> [a]
reverseWithFoldl = foldl (\acc cur -> cur:acc) []
-- reverseWithFoldl = foldl (flip (:)) []