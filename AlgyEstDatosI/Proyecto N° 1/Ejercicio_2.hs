--a)
paratodo :: [Bool] -> Bool
paratodo [] = True
paratodo (x:xs) = x && paratodo xs
--b)
sumatoria :: [Int] -> Int
sumatoria [] = 0
sumatoria (x:xs) = x + sumatoria xs
--c)
productoria :: [Int] -> Int
productoria[] = 1
productoria (x:xs) = x * productoria xs
--d)
factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial(n-1)
--e)
promedio :: [Int] -> Int 
promedio[] = 0
promedio x = div (sumatoria x) (length x)