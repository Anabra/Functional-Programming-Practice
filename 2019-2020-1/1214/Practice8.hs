module Practice8 where 

{-
move from to (a,b,c) 
  | from == 0 && to == 1 = (tail a, head a : b, c)
  
move 0 1 (x:xs, ys, zs) = (xs, x:ys, zs)
-}

{-
what is a HOF (Higher Order Function?
a function that has either:
  - has a paramter that is function
  - its return value is a function
-}

-- Which ones are HOFs?

-- 0
plus :: Int -> (Int -> Int) 
plus x y = x + y

-- 5
app :: (a -> b) -> a -> b 
app = undefined 

-- 0
take' :: Int -> ([a] -> [a])
take' = undefined 

-- 7
foo :: (a -> b) -> Bool 
foo = undefined

-- 6
comp :: (b -> c) -> (a -> b) -> a -> c
comp = undefined

-- all of the above are HOF

-- this is not a HOF
bar :: Int -> Int 
bar = undefined

asd = ([] :: [Bool]) == ([] :: [Int])

-- Mi az eredménye az alábbi kifejezesének?
-- ([] :: [Bool]) == ([] :: [Int])

-- A) True
-- B) False
-- C) Fordítási idejű hiba
-- D) Futási idejű hiba

-- A: 2
-- B: 11
-- C: 4
-- D: 0

ifThenElse :: Bool -> a -> a -> a 
ifThenElse True  x _ = x 
ifThenElse False _ y = y

or' :: Bool -> Bool -> Bool 
or' lhs rhs = 
  if lhs then 
    True
  else if rhs then 
    True 
  else 
    False

comprPlusOneTimesTwo :: [Int] -> [Int]
comprPlusOneTimesTwo xs = [2*(x+1) | x <- xs]
-- [x+1 | x <- xs]
-- [2*x | x <- xs]

mapPlusOneTimesTwo :: [Int] -> [Int]
mapPlusOneTimesTwo = map (*2) .  map (+1)
-- map id ~ id
-- map f . map g ~ map (f . g)
