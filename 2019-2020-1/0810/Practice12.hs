module Practice12 where 

-- ~foldr
sum1 :: [Int] -> Int 
sum1 []     = 0 
sum1 (x:xs) = x + sum1 xs

-- ~foldl
sum2 :: Int -> [Int] -> Int 
sum2 acc []     = acc 
sum2 acc (x:xs) = sum2 (acc + x) xs

-- foldr_ (+) 0 [1,2,3] == 1 + (2 + (3 + (0)))
foldr_ :: (a -> b -> b) -> b -> [a] -> b
foldr_ f neut []     = neut 
foldr_ f neut (x:xs) = f x (foldr_ f neut xs)

-- foldl_ (+) 0 [1,2,3] == (((0) + 1) + 2) + 3 
foldl_ :: (b -> a -> b) -> b -> [a] -> b
foldl_ f acc []     = acc 
foldl_ f acc (x:xs) = foldl_ f (f acc x) xs
