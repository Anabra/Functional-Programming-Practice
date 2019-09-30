module Practice4 where

-- bools (constructors, logical ops)
-- True | False

isZero :: Int -> Bool 
isZero 0 = True
isZero _ = False

not' :: Bool -> Bool 
not' True  = False
not' _     = True

and' :: Bool -> Bool -> Bool 
and' True  True  = True
and' _     _     = False

or' :: Bool -> Bool -> Bool 
or' False False = False 
or' _     _     = True 

-- x <=> y, iff x and y are the same
-- define without using (==)
equivalent :: Bool -> Bool -> Bool 
equivalent True  True  = True
equivalent False False = True
equivalent _     _     = False

-- bonus
foo :: Int -> (Int -> Bool) -> Bool 
foo = undefined

-- tuples (examples, constructors, elimination)

tuple1 :: (Int, Int)
tuple1 = (1, 2)

tuple2 :: (Int, Char)
tuple2 = (2, 'c')

tuple3 :: (Int, Char, Bool)
tuple3 = (2, 'c', True)

fstInt' :: (Int, Bool) -> Int 
fstInt' (x,y) = x

sndBool' :: (Int, Bool) -> Bool 
sndBool' (x,y) = y

type Coord   = (Int, Int)
type Tuple a = (a,a)

isOrigo :: Coord -> Bool 
isOrigo (0,0) = True
isOrigo _     = False

-- doubleTheTuple :: (Int, Int) -> ((Int,Int), (Int,Int))
-- doubleTheTuple :: (a, a) -> ((a,a), (a,a))
doubleTheTuple :: b -> (b, b)
doubleTheTuple t = (t,t)

fstSndBool :: ((Int,Bool), (Int,Bool)) -> Bool
fstSndBool ((_,b), _) = b 

-- parametric polymorphism
fst' :: (a,b) -> a 
fst' (x,_) = x

snd' :: (a,b) -> b
snd' (_,y) = y


-- a) Define bonus1 such that it type checks!
-- b) Are there any more different definitions?
bonus1 :: a -> a 
bonus1 x = x

-- Guttengéber Zoltán
-- Boross Richárd
-- c) Define bonus2 such that it type checks!
-- Without undefined and error
bonus2 :: a 
bonus2 = bonus2

-- polymorphism (parametric)