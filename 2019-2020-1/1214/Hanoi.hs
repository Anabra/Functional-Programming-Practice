module Hanoi where

--  https://www.youtube.com/watch?v=8lhxIOAfDss

-- (n,m) ~ move 1 ring from the nth rod to the mth rod
type Move = (Int, Int)
-- ([2,3],[],[1]) ~ Hanoi problem with 3 rods.
-- The first rod has 2 rings (the second largest and the largest with the second largest being on top),
-- the second rod has 0 rings,
-- the third rod has 1 ring on it (the smallest one).
type Problem = ([Int], [Int], [Int])

-- Solve the Hanoi problem.
-- Generate a move sequence, 
-- such that all the rings
-- are on the last rod.
-- And the rules are followed:
--  If two rings are on top of each other,
--  then the one on top must be smaller than the one underneath it. 
solve :: Problem -> [Move]
solve = undefined








