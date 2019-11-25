module Practice11 where 

fib :: Integer -> Integer
fib 0 = 0 
fib 1 = 1 
fib n = fib (n-1) + fib (n-2)

-- fib 40 = (fib 39 +) fib 38
-- fib 40 = (fib 38 + fib 37) + fib 38

fibs :: [Integer]
fibs = 0 : 1 : zipWith (+) fibs (drop 1 fibs)

isSorted :: Ord a => [a] -> Bool 
isSorted xs = and $ zipWith (<=) xs (drop 1 xs)

{-
(++) []     ys = ys 
(++) (x:xs) ys = x : xs ++ ys

length xs == n
length ys == m
c(xs ++ ys) == n

length xs == n
length ys == m
length zs == k
c(xs ++ (ys ++ zs)) == n + m

length xs == n
length ys == m
length zs == k
length ws == l
c(xs ++ (ys ++ (zs ++ ws))) == n + m + k
c(((xs ++ ys) ++ zs) ++ ws) == n + (n + m) + (n + m + k)
                            == 3*n + 2*m + k

suppose length xs == length ys == length zs == length ws == n
c(xs ++ (ys ++ (zs ++ ws))) = 3*n
c(((xs ++ ys) ++ zs) ++ ws) = 6*n

but this difference keeps growing!
the first one is linear,
but the second one is quadratic!
-}

concatL :: [[a]] -> [a]
concatL xs = foldl (++) [] xs

concatR :: [[a]] -> [a]
concatR = foldr (++) []

testL = last $ concatL $ map (\n -> [1..1000]) $ replicate 1000 1000
testR = last $ concatR $ map (\n -> [1..1000]) $ replicate 1000 1000

map' :: (a -> b) -> [a] -> [b]
map' f = foldr (\x ys -> f x : ys) [] 

filter' :: (a -> Bool) -> [a] -> [a]
filter' p = foldr (\x ys -> if p x then x : ys else ys) []


pipeline :: [a -> a] -> (a -> a) 
pipeline = undefined 
{-
pipeline [] 5 == 5
pipeline [] True == True 
pipeline [(*2)] 4 == 8
pipeline [(+1)] 4 == 5
pipeline [(+1),(*2)] 4 == 9
pipeline [(*2),(+1)] 4 == 10
pipeline [(*2),(+1),(*3)] 4 == 26
pipeline [reverse, map (*2), take 4] [1..] == [8,6,4,2]
pipeline [reverse, map (*2), take 4] [1..] == reverse . map (*2) . take 4 $ [1..]
-}