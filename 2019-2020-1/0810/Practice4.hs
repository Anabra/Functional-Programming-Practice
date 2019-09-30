module Practice4 where 

-- bools (logical ops)
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


-- left-hand side
-- right-hand side
or' :: Bool -> Bool -> Bool 
or' False False = False
or' _     _     = True

-- gives True iff the arguments are equal
equivalent :: Bool -> Bool -> Bool 
equivalent True  True  = True
equivalent False False = True
equivalent _     _     = False

-- tuples (examples, construct, destruct)

tuple1 :: (Int, Int)
tuple1 = (2, 3)

tuple2 :: (Int, Char)
tuple2 = (2, 'c')

tuple3 :: (Int, Char, Bool)
tuple3 = (2, 'c', True)

funTuple :: (Int -> Int, Int -> Bool)
funTuple = ((*2), even)

type IntIntTuple = (Int, Int)
type PolyTuple a = (a,a)

tupleInTuple :: (IntIntTuple, IntIntTuple)
tupleInTuple = ((1,2), (2,3))

identity :: a -> a 
identity x = x

-- A => A /\ A
doubleTheTuple :: a -> (a,a)
doubleTheTuple x = (x,x)

-- Náray Balázs
ud :: a 
ud = ud

-- polymorphic type
polyTuple :: (a,a) -- PolyTuple a
polyTuple = undefined

-- where clause

-- lists