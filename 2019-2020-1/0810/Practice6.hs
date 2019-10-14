{-# OPTIONS -Wall #-}
module Practice6 where 

import Prelude hiding (sum, length, minimum, (++), concat, zip, elem, take, drop)


-- :t x (y,z) --> c
-- :t x       --> ((a, b) -> c)
-- :t y --> a
-- :t z --> b
asd :: ((a, b) -> c) -> (a -> (b -> c))
asd x y z= x (y,z)

qwe :: (a -> (b -> c)) -> ((a, b) -> c)
qwe  z (x,y) = z x y

-- foo (*2) [1,2,3] == [2,4,6]
-- foo odd  [1,2,3] == [True, False, True]
foo :: (a -> b) -> [a] -> [b]
foo = undefined 

-- bar [(*2), (+1), (+3)] 4 == [8, 5, 7]
-- bar [odd, even, (<10)] 4 == [False, True, True]
bar :: [a -> b] -> a -> [b]
bar = undefined


{- Recursion

F is recursive if F calls itself

Things to pay attention:
  - recursive case (what if somebody already completed a subtask?)
  - base case (where does the function terminate?)

-}

sum :: [Int] -> Int 
sum []     = 0
sum (x:xs) = x + sum xs

length :: [a] -> Int 
length []     = 0
length (_:xs) = 1 + length xs
-- length [loop, loop] == 2

loop :: a 
loop = loop

-- We can assume that n is a natural
fact :: Int -> Int
fact 0 = 1 
fact n = n * fact (n-1)

{-
fact 3 = 3 * fact 2
       = 3 * 2 * fact 1
       = 3 * 2 * 1 * fact 0
       = 3 * 2 * 1 * 0 * fact (-1)
       = 3 * 2 * 1 * 0 * (-1) * fact (-2)
       ...
-}

-- take n xs ~ take first n elements of xs (if they exist)
take :: Int -> [a] -> [a]
take _ []     = []
take 0 _      = []
take n (x:xs) = x : take (n-1) xs

-- min :: Ord a => a -> a -> a

minimum :: Ord a => [a] -> a
minimum []     = error "minimum: empty list"
minimum [x]    = x 
minimum (x:xs) = x `min` (minimum xs) 