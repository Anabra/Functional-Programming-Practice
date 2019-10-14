{-# OPTIONS -Wall #-}
module Practice6 where 

import Prelude hiding (sum, length, take, minimum, drop, product, or)

{-
-- foo (*2) [1,2,3] == [2,4,6]
-- foo odd  [1,2,3] == [True, False, True]
foo :: (a -> b) -> [a] -> [b]
foo = undefined 

-- bar [(*2), (+1), (+3)] 4 == [8, 5, 7]
-- bar [odd, even, (<10)] 4 == [False, True, True]
bar :: [a -> b] -> a -> [b]
bar = undefined

swapFirstTwo :: [a] -> [a]
swapFirstTwo (x:y:ys) = y:x:ys 

firstElemPred :: [(a, Int)] -> Bool 
firstElemPred ((_,0):_) = True
firstElemPred _         = False
-}

{- Recursion

F is recursive if F calls itself

Things to pay attention to:
  - recursive case (what if sb already solved a subtask?) 
  - base case (when does the recursion terminate?)

-}

sum :: [Int] -> Int    
sum []     = 0
sum (x:xs) = x + sum xs

{-
sum [1,2,3] = sum (1:2:3:[])
            = 1 + sum (2:3:[])
            = 1 + 2 + sum (3:[])
            = 1 + 2 + 3 + sum []
-}

length :: [a] -> Int 
length []     = 0
length (_:xs) = 1 + length xs
-- length [1+2, 2+3, loop, undefined] == 4

loop :: a 
loop = loop

-- we can assume we are working with naturals
fact :: Int -> Int 
fact 0 = 1
fact n = n * fact (n-1)

-- take n xs ~ take the first n elements of xs (if they exist)
-- we can assume n is natural
take :: Int -> [a] -> [a]
take 0 _  = []
take _ [] = []
-- n > 0, (x:xs) is non-empty
take n (x:xs) = x : take (n-1) xs

{- 
take 4 [1,2] = 1 : take 3 [2]
             = 1 : 2 : take 2 []
-}

-- don't use (<), (>), (<=), (>=)
-- we can assume the inputs are natural numbers
le :: Int -> Int -> Bool
le 0 _ = True
-- first arg must be >1 
le _ 0 = False 
-- both args must be >1
le n m = le (n-1) (m-1)

-- the list contains at least one element
minimum :: Ord a => [a] -> a
minimum [] = error "minimum: empty list"
minimum [x] = x
minimum (x:xs) = x `min` (minimum xs)

-- drop n xs ~ drop the first n elemnts of xs
-- drop 3 [1..10] == [4..10]
-- drop 7 [1..3]  == []
-- drop 0 [1..3]  == [1..3]
-- drop 3 []      == []
drop :: Int -> [a] -> [a]
drop = undefined

-- product [x1,x2,x3] == x1 * x2 * x3
product :: [Int] -> Int
product = undefined

-- or [x1,x2,x3] == x1 || x2 || x3
or :: [Bool] -> Bool 
or = undefined