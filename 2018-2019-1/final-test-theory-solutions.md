# Elméleti kérdéssor megoldásai

1. Melyik HELYES kifejezés?  
    A) `6 div 3`  
    B) ``6 `div` 3``  
    C) `6 (div) 3`  
    D) `(6) div (3)`


    Megoldás:


    A) syntax error (a függvény infix módon lett alkalmazva backtick-ek nélkül)  
    B) SOLUTION  
    C) syntax error (a függvény infix módon lett alkalmazva backtick-ek nélkül)  
    D) syntax error (a függvény infix módon lett alkalmazva backtick-ek nélkül)  


2. Melyik HELYES kifejezés, ha `f :: Int -> Int -> String -> Bool`?  
    A) `f (1 2 "str") || True`  
    B) `f (1 2 "str" || True)`  
    C) `(f 1 2 "str") || True`  
    D) `f(1,2,"str") || True`  


    Megoldás:


    A) `(1 2 "str")`-t a fordító egyetlen argumentumnak veszi, de az `f` hármat vár  
    B) `(1 2 "str" || True)` j.o. nem helyes kifejezés  
    C) SOLUTION  
    D) függvény alkalmazás (nem Python-ban vagyunk)  


3. Melyik állítás HAMIS az alábbiak közül?
    ```haskell
    f ([a]:[b])
    f (a:b:[])
    f ((a:[]):b:[])
    ```
    A) Az 1. és 3. minták ugyanarra illeszkednek  
    B) Amire illeszkedik az 1. minta, arra illeszkedik a 2. minta is  
    C) Amire illeszkedik az 2. minta, arra illeszkedik a 3. minta is  
    D) A minták közül legalább egy illeszkedik a(z) `[[],[]]` értékre  


    Let's desugar these patterns:


    ```
    f ([a]:[b])
      ~ f ([a]:(b:[]))    (desugaring)
      ~ f ((a:[]):(b:[])) (desugar)
      ~ f ((a:[]):b:[])   (because of fixity)
        f (a:b:[])
        f ((a:[]):b:[])
    ```

    Az első és harmadik minták azonosak.  
    Ezek olyan kételemű listákra illeszkednek, amik listákat tartalmaznak, és az első elemük is lista.  
    A második minta bármilyen kételemű listára illeszkedik.  

    A) Igaz  
    B) Igaz, mert a második minta általánosabb, több mindenre illeszkedik.  
    C) SOLUTION: Hamis, mert a második minta általánosabb, több mindenre illeszkedik.  
    D) Igaz, mert a második mintára illeszkedik.  


4. Melyik kifejezés NEM lista típusú?  
    A) `([[1,2],[]])`  
    B) `[(1,2),(3,4)]`  
    C) `([1,2]:[])`  
    D) `([1,2],[])`  


    Megoldás:


    A) List: `([[1,2],[]])` ~ `[[1,2],[]]`  
    B) List  
    C) List: `([1,2]:[])` ~ `[1,2]:[]`  
    D) SOLUTION: Tuple   


5. Mi az eredménye a következő kifejezésnek: `head [1,2,3] == take 1 [3,2,1]`  
    A) `True`  
    B) `False`  
    C) Fordítási idejű hiba  
    D) Futási idejű hiba  


    SOLUTION C, mert:


    ```haskell
    head :: [a] -> a
    take :: Int -> [a] -> [a]
    (==) :: Eq a => a -> a -> a
    ```


    Nem lehet az `(==)`-t különböző típusú operandusokra alkalmazni.


6. Melyik sor hagyható el a függvényből úgy, hogy működése változatlan maradjon?
    ```haskell
    f [x,y] = x `min` y
    f [x] = x
    f (x:rest) = x `min` f rest
    ```
    A) Az első  
    B) A második  
    C) A harmadik  
    D) Egyik sem  


    SOLUTION A: Az elsőt, mert az illeszkedik a harmadikra:


    ```
      f [x,y] =(1)= f (x:[y]) =(2)= x `min` f [y] =(3)= x `min` y
      (1) - desugar arguments
      (2) - helyettesítsük a jobb oldalát a harmadik egyenletnek
      (3) - helyettesítsük a jobb oldalát `min`-nek a második egyenlet jobb oldalával
    ```
    __Megjegyzés__: A másik két minta közül egyik sem hagyható el.


7. Mi lehet a típusa az alábbi kifejezésnek?
    ```haskell
    map (filter (\x -> x))
    ```
    
    
    A) `[a] -> [a]`  
    B) `[Bool] -> [Bool]`  
    C) `[[a]] -> [[a]]`  
    D) `[[Bool]] -> [[Bool]]`  


    SOLUTION D mert:
    ```
    map :: (a -> b) -> [a] -> [b]
    filter :: (c -> Bool) -> [c] -> [c]
    (\x -> x) :: d -> d
    ```


    Vizsgáljuk meg, hogy mik lehetnek az egyes típusváltozók értékei:


    `filter (\x -> x)` azt jelenti, hogy `(c -> Bool)` egyenlő `(d -> d)`-vel.
    Tehát `d ~ Bool` és `c ~ Bool`. Innen pedig `filter (\x -> x) :: [Bool] -> [Bool]`.


    Mivel a `filter (\x -> x)` az a függvényt, amit a `map`-nek odaadunk, ezért `a -> b ~ [Bool] -> [Bool]`.
    Innen: `a ~ [Bool]` és `b ~ [Bool]`.


    Végül, `map :: (a -> b) -> [a] -> [b] :: [[Bool]] -> [[Bool]]`.


8. Mi lehet a típusa az alábbi függvénynek?
    ```
    f (x,xs) = init x
    f _ = "default"
    ```
    A) `f :: [a] -> String`  
    B) `f :: [String] -> String`  
    C) `f :: (a,b) -> String`  
    D) `f :: ([Char],a) -> [Char]`  


    SOLUTION D, mert:
    
    
    ```haskell
    init :: [a] -> [a]
    "default" :: String ~ [Char]
    ```
    
    
    Ez azt jelenti, hogy `f` visszatérési értékének a típusa `String` (vagy `[Char]`).  
    Tehát az `init x` típusának is `[Char]`-nak kell lennie.  
    Ennek következményeként: `x :: [Char]`.  
    Végül az `f` egy `Tuple`-re van alklamzva, aminek első komponense `x`, és a második komponenséről nem tudunk semmit.  
    Így `f :: ([Char],a) -> [Char]`
    

9. Mi a típusa az alábbi függvénynek?
    ```
    f [] = []
    f [x] = [x]
    f [x:xs] = [xs]
    ```
    A) `f :: [a] -> [a]`  
    B) `f :: [[a]] -> [a]`  
    C) `f :: [a] -> [[a]]`  
    D) `f :: [[a]] -> [[a]]`  


    SOLUTION D, mert:


    A második sorból kiderül, hogy a `f` egyetlen argumentuménak és visszatérési értékének típusa azonos.  
    Ez azt jelenti, hogy a megoldás csak az a A vagy a D lehet.  
    Továbbá azt is észrevehetjük, hogy az utolsó minta egy oylan egyelmű listára illeszkedik, amelyben egy nemüres lista található.  
    Ez azt jelenti, hogy az argumentum `[[a]]` típusú lesz.  
    Ebből következik, hogy a megoldás a D.  

10. Mi az eredménye a következő kifejezésnek: `zip [1..] "almafa"`  
    A) Nem áll le, nem ír ki semmit  
    B) Nem áll le, végtelen eredményt ad  
    C) Véges eredménnyel leáll  
    D) Fordítási hiba  


    SOLUTION C, mert `zip` mindig a rövidebbik lista végéig "zipzároz".


11. Mi igaz a `foldl (++) x ls` és `foldr (++) x ls` kifejezésekre?  
    A) Eredményük és futási költségük mindenképp azonos  
    B) Eredményük és futási költségük azonos, ha ls véges és kiértékelhető  
    C) Csak az egyik lehet típushelyes  
    D) Típushelyesek, de eredményük vagy futási költségük eltérő lehet  


    SOLUTION D, mert:


    A két kifejezés azonos eredményt ad, de futási költségük eltér.  
    A kifejezések kizárólag a zárójelezésükben különböznek.  


    Tekintsük az alábbi két kifejezést:  
    `([1,2,3] ++ [3,4,5]) ++ [7,8,9]`  
    `[1,2,3] ++ ([3,4,5] ++ [7,8,9])`  
    Az első egy `foldl` által előállított, a második pedig egy `foldr` általá előállított kifejezés.


    Az első kifejezésben az első listán kétszer megyünk végig.  
    Egyszer, amik az első két lsitát fűzzük össze, és még egyszer, amikor az így kapott listát fűzzük össze a harmadik listával. (lásd a `(++)` [definíciója](http://lambda.inf.elte.hu/haskell/doc/libraries/base-4.9.0.0/src/GHC-Base.html#%2B%2B)).  


    A második kifejezésben minden listán pontosan egyszer megyünk végig.
    

12. Melyik kifejezés hoz létre helyes `T` típusú értéket, ha `data T = A Int Bool | B String | C`  
    A) `A "almafa"`  
    B) `A True 3`  
    C) `B 3`  
    D) `C`  


    SOLUTION D, mert:
    ```haskell
    A :: Int -> Bool -> T
    B :: String -> T
    C :: T
    ```
    Az A, B és C kifejezések mind típushibásak.
