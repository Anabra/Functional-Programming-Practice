# Próbavizsga

## Előzetes tudnivalók

Használható segédanyagok:

- [Haskell könyvtárak dokumentációja](http://lambda.inf.elte.hu/haskell/doc/libraries/),
- [Hoogle](http://lambda.inf.elte.hu/haskell/hoogle/),
- [a tárgy honlapja](http://lambda.inf.elte.hu/), és a
- [Haskell szintaxis összefoglaló](http://lambda.inf.elte.hu/CheatSheet.xml).

Ha bármilyen kérdés, észrevétel felmerül, azt a felügyelőknek kell
jelezni, **nem** a diáktársaknak!

A feladatok tetszőleges sorrendben megoldhatóak. A pontozás szabályai a következők:

- Minden teszten átmenő megoldás ér teljes pontszámot.
- Funkcionálisan hibás (csak 1-2 teszteseten megbukó) megoldás nem teljes pontszámot ér.
- Fordítási hibás vagy hiányzó megoldás nem ér pontot.

*Tekintve, hogy a tesztesetek, bár odafigyelés mellett íródnak, nem
fedik le minden esetben a függvény teljes működését, határozottan
javasolt még külön próbálgatni a megoldásokat beadás előtt, vagy
megkérdezni a felügyelőket!*


## Feladatsor

1. Készítsünk egy `f1` függvényt, amely eldönti, hogy egy adott szám
   osztható-e 2-vel, 3-al vagy 5-tel. (1 pont)

    ```haskell
    f1 :: Int -> Bool
    ```

    ~~~~
    f1 4 == True
    f1 5 == True
    f1 15 == True
    f1 7 == False
    f1 1 == False
    f1 0 == True
    f1 (-9) == True
    ~~~~

2. Készítsük el a `head2` függvényt, amely visszaadja egy párban a
   lista első 2 elemét (legalább 2 elemű listára működjön)! (1 pont)

    ```haskell
    head2 :: [a] -> (a,a)
    ```

    ~~~~
    head2 [1..10] == (1,2)
    head2 "ab" == ('a','b')
    ~~~~

3. Írjuk meg a `ratAdd` függvényt, amely két számláló és nevező
   párként megadott racionális számot ad össze! (A számláló a pár első
   tagja, a nevező a pár második tagja.) (1 pont)

    ```haskell
    ratAdd :: (Int, Int) -> (Int, Int) -> (Int, Int)
    ```

    ~~~~
    ratAdd (1,2) (1,3) == (5,6)
    ratAdd (1,1) (1,1) == (2,1)
    ratAdd (0,2) (1,2) == (2,4)
    ~~~~

4. Készítsük el a faktoriális (`fac`) függvényt! A faktoriális
   függvény értéke 1 vagy kisebb számokra 1 legyen. Minden egyéb számra
   pedig az előtte levő számok szorzata legyen a `fac` értéke. (2 pont)

    ```haskell
    fac :: Int -> Int
    ```

    ~~~~
    fac 3 == 6
    fac 4 == 24
    fac 0 == 1
    fac (-1) == 1
    ~~~~

5. Készítsük el a legkisebb elemet kiválasztó `minimumInt` függvényt
   egész számokra. (A lista nem üres.) (2 pont)

    ```haskell
    minimumInt :: [Int] -> Int
    ```

    ~~~~
    minimumInt [1] == 1
    minimumInt [1,2] == 1
    minimumInt [2,3,1] == 1
    minimumInt [5,3,7,6] == 3
    ~~~~

6. Készítsük el egy listába tetszőleges helyre egy elemet beszúró
   `insert` függvényt! (2 pont)

    Az első paramétere legyen a beszúrás indexe, a második a beszúrt
    elem a harmadik pedig a lista, amibe az elemet beszúrjuk. Rossz
    indexeléssel ne foglalkozzunk.

    ```haskell
    insert :: Int -> a -> [a] -> [a]
    ```

    ~~~~
    insert 0 1 [] == [1]
    insert 0 1 [2,3] == [1,2,3]
    insert 1 'x' "abc" == "axbc"
    insert 3 'x' "abc" == "abcx"
    ~~~~

7. Készítsük el a `dropUntil` függvényt, amely egy lista elejéről
   addig dobja el az elemeket, amíg nem talál egy olyat, amely egy
   adott tulajdonságnak megfelel. (3 pont)

    ```haskell
    dropUntil :: (a -> Bool) -> [a] -> [a]
    ```

    ~~~~
    dropUntil (>= 3) [1..5] == [3..5]
    dropUntil even [1..5] == [2..5]
    dropUntil (=='m') "almafa1" == "mafa1"
    ~~~~

8. Készítsünk egy `minimumOfMaxima` függvényt, amely listák listáját
   kapja paraméterként, és a listák legnagyobb elemei közül veszi a
   legkisebbet. Minden listának (beleértve a fő listát is) legalább 1
   eleme van. (3 pont)

    ```haskell
    minimumOfMaxima :: Ord a => [[a]] -> a
    ```

    ~~~~
    minimumOfMaxima [[3,4,5],[1,2,3],[7,8,9]] == 3
    minimumOfMaxima [[4,7],[1,2,9],[5]] == 5
    minimumOfMaxima [[9],[8],[1]] == 1
    minimumOfMaxima ["hello", "haskell", "world"] == 'o'
    ~~~~

9. Készítsük el a `safeHead` függvényt, amely egy listából egy
   [`Maybe`][maybe] típusú eredményt ad vissza! A `safeHead` adjon
   `Nothing` értéket, ha a lista üres, különben pedig egy `Just`
   konstruktorban adja vissza a lista első elemét! (1 pont)

    ```haskell
    safeHead :: [a] -> Maybe a
    ```

    ~~~~
    safeHead [1,2,3] == Just 1
    safeHead "" == Nothing
    ~~~~

    [maybe]: http://lambda.inf.elte.hu/haskell/doc/libraries/base-4.9.0.0/Data-Maybe.html

10. Készítsük el a síkidomok `Shape` típusát! Háromféle ilyen alakzat
    lehetséges, egy kör (`Circle`), amit a sugarával adunk meg, egy
    téglalap (`Rectangle`), amit magasságával és szélességével adunk
    meg és egy háromszög (`Triangle`), amit magasságával és alapjának
    a hosszával adunk meg. A hosszokat `Double` típussal adjuk
    meg. Legyen rajta `deriving (Eq, Show)`.

    Készítsük el a `scale :: Double -> Shape -> Shape` függvényt, ami
    a paraméterben megadott számszorosára növeli egy síkidom méretét.

    Írjuk meg a `area` függvényt, ami egy síkidom területét számolja
    ki. (Tipp: van `pi` érték)

    (3 pont)

    ```haskell
    scale :: Double -> Shape -> Shape
    area :: Shape -> Double
    ```

    ~~~~
    scale 4 (Circle 1) == Circle 4
    scale 2 (Circle 3) == Circle 6
    scale 0.5 (Triangle 1 2) == Triangle 0.5 1
    scale 1.5 (Rectangle 3 4) == Rectangle 4.5 6

    area (Circle 2) == 4 * pi
    area (Triangle 1 2) == 1
    area (Rectangle 2 3) == 6
    ~~~~

## Értékelés

A próbavizsga két részéből összesen 31 pont szerezhető, amely alapján az értékelésre a következő javaslatot beszéltük meg:

 - 16 ponttól : 2-es
 - 19 ponttól : 3-as
 - 22 ponttól : 4-es
 - 25 ponttól : 5-ös
