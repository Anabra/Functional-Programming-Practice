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

-- not efficient
reverse1 :: [a] -> [a]
reverse1 [] = [] 
reverse1 (x:xs) = reverse xs ++ [x] 

reverse2Helper :: [a] -> [a] -> [a]
reverse2Helper acc []     = acc 
reverse2Helper acc (x:xs) = reverse2Helper (x:acc) xs

reverse2 :: [a] -> [a]
-- reverse2 = reverse2Helper []
reverse2 xs = foldr (:) [] xs
