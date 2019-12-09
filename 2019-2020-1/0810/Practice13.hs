module Practice13 where 

import Prelude hiding (Maybe(..))

data Day = Mon | Tue | Wed | Thu | Fri | Sat | Sun

data SimpleColour = Red | Green | Blue | White

whiteSimple :: SimpleColour 
whiteSimple = White

showSimpleColour :: SimpleColour -> String 
showSimpleColour Red   = "Red"
showSimpleColour Green = "Green"
showSimpleColour Blue  = "Blue"
showSimpleColour White = "White"

-- RGB (0-255) (0-255) (0-255)
-- HSL (0-359) (0-100) (0-100)
data Colour = RGB Int Int Int
            | HSL Int Int Int
  deriving (Eq, Ord, Show)

whiteRGB :: Colour
whiteRGB = RGB 0 0 0 

whiteHSL :: Colour
whiteHSL = HSL 42 13 100

showColour :: Colour -> String 
showColour (RGB r g b) = "RGB " ++ show r ++ " " ++ show g ++ " "  ++ show b

eqColour :: Colour -> Colour -> Bool 
eqColour (RGB r1 g1 b1) (RGB r2 g2 b2) = r1 == r2 && g1 == g2 && b1 == b2 
eqColour (HSL h1 s1 l1) (HSL h2 s2 l2) = h1 == h1 && s1 == s2 && l1 == l2
eqColour _ _ = False

data Maybe a = Nothing | Just a
  deriving (Eq, Ord, Show)

safeHead :: [a] -> Maybe a
safeHead []     = Nothing
safeHead (x:xs) = Just x

safeTail :: [a] -> Maybe [a]
safeTail []     = Nothing
safeTail (x:xs) = Just xs

lookup' :: Eq k => k -> [(k,v)] -> Maybe v
lookup' _ [] = Nothing
lookup' k ((curK, curV):kvs)
  | k == curK = Just curV
  | otherwise = lookup' k kvs

maybeToList :: Maybe a -> [a]
maybeToList Nothing  = []
maybeToList (Just x) = [x]

concatMaybes :: [Maybe a] -> [a] 
concatMaybes xs = concatMap maybeToList xs

mapMaybe :: (a -> Maybe b) -> [a] -> [b]
mapMaybe f xs = concatMaybes (map f xs)

divide10 :: Double -> Maybe Double 
divide10 0 = Nothing 
divide10 n = Just (10 / n)

-- mapMaybe (\n -> )
