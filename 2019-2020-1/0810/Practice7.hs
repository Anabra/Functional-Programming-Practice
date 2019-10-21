module Practice7 where

-- http://hackage.haskell.org/package/base-4.12.0.0/docs/Data-List.html

or' :: [Bool] -> Bool 
or' = undefined 

and' :: [Bool] -> Bool 
and' = undefined 

minimum' :: Ord a => [a] -> a 
minimum' = undefined 

maximum' :: Ord a => [a] -> a 
maximum' = undefined

elem' :: Eq a => a -> [a]
elem' = undefined 

zip' :: [a] -> [b] -> [(a,b)]
zip' = undefined 

unzip' :: [(a, b)] -> ([a], [b])
unzip' = undefined

-- same as (++)
(+++) :: [a] -> [a] -> [a]
(+++) = undefined

reverse' :: [a] -> [a]
reverse' = undefined 

replicate' :: Int -> a -> [a]
replicate' = undefined

repeat' :: a -> [a]
repeat' = undefined 

cycle' :: [a] -> [a]
cycle' = undefined 


isPrefixOf' :: Eq a => [a] -> [a] -> Bool
isPrefixOf' = undefined 

isSuffixOf' :: Eq a => [a] -> [a] -> Bool
isSuffixOf' = undefined

subsequences' :: [a] -> [[a]]
subsequences' = undefined 

permutations' :: [a] -> [[a]]
permutations' = undefined 

