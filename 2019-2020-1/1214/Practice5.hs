module Practice5 where 

-- type String = [Char]
-- 'a':'b':'c':[] == ['a','b','c']
-- ['a','b','c']  == "abc"

-- desugaring
-- [x,y,z] ~> x:y:z:[]

head' :: [a] -> a 
head' (x:xs) = x 
-- BETTER: head' (x:_)
-- OK: head' (  x:xs   ) = x 
-- OK: head' (  x   :   xs   ) = x 
-- OK: head' (  asd   :   qwe   ) = asd
-- NOT OK: head' x:xs ~> head' x : xs (three arg fun) 
-- NOT OK: head' [x:xs] ~> head' [(x:xs)]
head' [] = error "head': empty list"

-- Maybe explanation
-- Bool = True , False
-- Maybe = Just True, Just False, Nothing

safeHead :: [a] -> Maybe a 
safeHead (x:xs) = Just x
safeHead [] = Nothing

tail' :: [a] -> [a]
tail' (x:xs) = xs 
tail' [] = error "tail': empty list"


headTail :: [a] -> (a,[a])
headTail (x:xs) = (x,xs)
headTail [] = error "headTail: empty list"

threeTupleToList :: (a,a,a) -> [a]
threeTupleToList (x,y,z) = [x,y,z]

isEmpty :: [a] -> Bool
isEmpty [] = True 
isEmpty _  = False

isSingleton :: [a] -> Bool 
isSingleton [_] = True 
isSingleton _   = False

atLeastThree :: [a] -> Bool
-- this list has at least element: x,y,z, and zs may be an other list (either cosntructed by [] or by (:), it doesn't matter) 
atLeastThree (x:y:z:zs) = True 
atLeastThree _         = False 
-- atLeastThree [1..] == True

-- extra

sum' :: [Int] -> Int 
sum' []     = 0   
sum' (x:xs) = x + sum' xs

{- What if we added more patterns?
sum' []     = 0
sum' [x]    = x    
sum' [x,y]  = x + y    
sum' (x:xs) = x + sum' xs

sum' [x,y] = sum' (x:(y:[]))
           = x + sum' (y:[])
           = x + y + sum' []
           = x + y
-}

{-
invariant in the ith iteration (i = ...)
  n = sum(xs[0..i])
sum(list<int> xs)
{
    int n = 0;
    for (i = 0; i < length xs; i++)
    {
        n = n + xs[i];
    }
}
-}

length' :: [a] -> Int
-- Note that the elemnts of the list doesn't matter. 
-- Time for some compiler optimizations!
length' []     = 0
length' (_:xs) = 1 + length xs
