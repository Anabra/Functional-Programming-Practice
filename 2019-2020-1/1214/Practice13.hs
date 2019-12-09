module Practice13 where

data SimpleColour = White | Black | Red | Green | Blue
  deriving (Eq, Ord, Show)

whiteSimple :: SimpleColour
whiteSimple = White 

showSimpleColour :: SimpleColour -> String 
showSimpleColour White = "White"
showSimpleColour Black = "Black"
showSimpleColour Red   = "Red"
showSimpleColour Green = "Green"
showSimpleColour Blue  = "Blue"

data Colour = RGB Int Int Int 
            | HSL Int Int Int 
  deriving (Eq, Ord, Show)

whiteRGB :: Colour
whiteRGB = RGB 255 255 255

whiteHSL :: Colour 
whiteHSL = HSL 42 13 100

showColour :: Colour -> String 
showColour (RGB r g b) = "RGB " ++
                         show r ++ " " ++
                         show g ++ " " ++
                         show b
showColour (HSL h s l) = "HSL " ++
                         show h ++ " " ++
                         show s ++ " " ++
                         show l

eqColour :: Colour -> Colour -> Bool 
eqColour (RGB r1 g1 b1) (RGB r2 g2 b2) = r1 == r2 && g1 == g2 && b1 == b2 
eqColour (HSL h1 s1 l1) (HSL h2 s2 l2) = h1 == h1 && s1 == s2 && l1 == l2
eqColour _ _ = False

-- data Maybe a = Nothing | Just a

safeHead :: [a] -> Maybe a
safeHead []     = Nothing
safeHead (x:xs) = Just x

safeTail :: [a] -> Maybe [a]
safeTail []     = Nothing
safeTail (x:xs) = Just xs

maybeToList :: Maybe a -> [a]
maybeToList Nothing  = [] 
maybeToList (Just x) = [x]

-- end  goal: mapMaybe :: (a -> Maybe b) -> [a] -> [b]
-- next goal: mapMaybe :: (a -> Maybe b) -> [a] -> [[b]]
mapMaybe :: (a -> Maybe b) -> [a] -> [b]
mapMaybe f xs = concat $ map maybeToList $ (map f xs) 

foo :: Int -> Maybe Int 
foo n 
  | even n    = Just (n `div` 2)
  | otherwise = Nothing 