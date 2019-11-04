module Practice8 where

mapPlusOneTimesTwo :: [Int] -> [Int]
mapPlusOneTimesTwo = map (*2) . map (+1)

-- map (*2)            :: [Int] -> [Int]
-- map (+1)            :: [Int] -> [Int]
-- map (*2) . map (+1) :: [Int] -> [Int]
-- map f . map g ~ map (f . g)   // rewrite rule
-- map id ~ id

comprPlusOneTimesTwo :: [Int] -> [Int]
comprPlusOneTimesTwo xs = [ 2*y | y <- [ x+1 | x <- xs]]

ifThenElse :: Bool -> a -> a -> a
ifThenElse True  lhs _ = lhs
ifThenElse False _ rhs = rhs

and' :: Bool -> Bool -> Bool 
and' lhs rhs = 
  if lhs then 
    if rhs then 
      True 
    else 
      False
  else 
    False

or' :: Bool -> Bool -> Bool 
or' lhs rhs = 
  if lhs then 
    True
  else if rhs then 
    True 
  else 
    False
