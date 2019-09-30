module Practice3 where 

-- Barth Benjámin
-- Németh Csilla Márta
-- Náray Balázs

plusOne :: Int -> Int 
plusOne = (1+)

double :: Int -> Int 
double = (2*)

square :: Int -> Int 
square n = n * n

-- absolute value of their difference
distance :: Int -> Int -> Int 
distance x y = abs (x - y)

-- define with `distance`
distanceFrom5 :: Int -> Int 
distanceFrom5 = distance 5

-- calcualte distance of (x,y) from Origin 
coordDistanceSquared :: Int -> Int -> Int 
coordDistanceSquared x y = square x + square y

-- operator precedence
-- in ghci: :i <operator_name>
expr1, expr2, expr3, expr4, expr5, expr6, expr7 :: Int
expr8, expr9, expr10 :: Bool

expr1 = ((1 + 2) + 3) + 4

expr2 = 2 ^ (3 ^ 5)

expr3 = (2 ^ 3) + (5 * 7)

expr4 = (10 `div` 3) + 10
expr5 = (10 `div` 3) * 10
expr6 = 10 `div` (3 ^ 10)
expr7 = (div 10 3) ^ 10

-- div 10 (3 ^ 10) -> 12
-- (div 10 3) ^ 10 -> 5

asd :: Bool
asd = True

qwe :: Bool 
qwe = False

-- prec(&&) >  prec(||) -> 10
-- prec(&&) <  prec(||) -> 0
-- prec(&&) == prec(||) -> 7

expr8 = (True && False) || True

expr9 = (1 == 5) && True

expr10 = (1 == (5 + 7)) && True

exprWithNegation = (-1) + (-2) * (-3)