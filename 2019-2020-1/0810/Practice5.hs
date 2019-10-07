module Practice5 where 

fst' :: (a,b) -> a
fst' (x,_) = x

snd' :: (a,b) -> b
snd' (_,y) = y

head' :: [a] -> a 
head' (x:xs) = x 
-- BETTER: head' (x:_) = x 
-- OK: head' (x  :   xs) = x 
-- OK: head' (   x  :   xs     ) = x 
-- OK: head' (   asd  :   qwe     ) = asd 
-- NOT OK: head' x:xs ~> head' x : xs (three parameter function)
-- MEANS SOMETHING ELSE: head' [x:xs] ~> list containing a single element being another non-empty list
head' [] = error "head': empty list" -- semantically same as undefined

tail' :: [a] -> [a]
tail' (x:xs) = xs
-- tail' (_:xs) = xs
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
sum' (x:xs) = x + sum' xs

length' :: [a] -> Int
-- Note that the elemnts of the list doesn't matter. 
-- Time for some compiler optimizations!
length' (_:xs) = 1 + length xs