module Practice11 where 

fibs :: [Integer]
fibs = 0 : 1 : zipWith (+) (drop 1 fibs) fibs 

fib :: Int -> Integer
fib 0 = 0 
fib 1 = 1 
fib n = fib (n-1) + fib (n-2)

conj True True = True 
conj _ _       = False 

conj lhs rhs = case lhs of 
  False -> False 
  True  -> rhs

concatL :: [[a]] -> [a]
concatL xs = foldl (++) [] xs

concatR :: [[a]] -> [a]
concatR = foldr (++) []

-- f $ g $ h x
-- f (g (h x))

-- ($) :: (a -> b) -> a -> b
-- f $ x   = f x
-- ($) f x = f x

-- (.) :: (b -> c) -> (a -> b) -> a -> c 
-- f . g     = \x -> f (g x)
-- (.) f g   = \x -> f (g x)
-- (.) f g x = f (g x)
-- (.) f g x = f $ g x

testR = last $ concatR $ map (\n -> [1..n]) $ replicate 1000 1000
testL = last $ concatL $ map (\n -> [1..n]) $ replicate 1000 1000

summation :: [Int] -> Int 
summation [] = 0 
summation (x:xs) = x + summation xs 

prod :: [Int] -> Int 
prod [] = 1 
prod (x:xs) = x * prod xs 

map' :: (a -> b) -> [a] -> [b]
map' f [] = [] 
map' f (x:xs) = f x : map f xs

map'' :: (a -> b) -> [a] -> [b]
-- map'' f = foldl (\ys x -> f x : ys) []
-- map'' f = foldl (\ys x -> ys ++ [f x]) []
map'' f = foldr (\x ys -> f x : ys) []

negTake :: Int -> (a -> Bool) -> [a] -> [a]
negTake n p = take n . filter (not . p)

reduce :: (a -> a -> b) -> a -> b 
reduce f x = f x x