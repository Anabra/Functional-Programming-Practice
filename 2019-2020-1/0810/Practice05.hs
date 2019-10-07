module Practice05 where 

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
headTail = undefined

threeTupleToList :: (a,a,a) -> [a]
threeTupleToList = undefined

isEmpty :: [a] -> Bool
isEmpty = undefined

isSingleton :: [a] -> Bool 
isSingleton = undefined

atLeastThree :: [a] -> Bool 
atLeastThree = undefined 

-- extra

sum' :: [Int] -> Int 
sum' = undefined

length' :: [a] -> Int
length' = undefined
