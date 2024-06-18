--a)
paratodo' :: [a] -> (a -> Bool) -> Bool
paratodo' [] t = True
paratodo' (x:xs) t = t x && paratodo' xs t

todosPares :: [Int] -> Bool
todosPares a = paratodo' a even

--b) 
multiplo :: Int -> Int ->Bool
multiplo  m x
            | mod x m == 0 = True
            | otherwise = False

existe' :: [a] -> (a -> Bool) -> Bool
existe' [] t = False
existe' (x:xs) t = t x || existe' xs t

hayMultiplo :: Int -> [Int] -> Bool
hayMultiplo v [] = False
hayMultiplo v b = existe' b (multiplo v)

-- c)  
sumatoria :: [Int] -> Int
sumatoria [] = 0
sumatoria (x:xs) = x + sumatoria xs

sumaCuadrados :: Int -> Int
sumaCuadrados n = sumatoria [1..n] * sumatoria [1..n]

-- d) 
identidad :: Bool -> Bool
identidad True = True 
identidad False = False 

productoria' :: [a] -> (a -> Int) -> Int
productoria' [] t = 1
productoria' (x:xs) t = (t x) * productoria' xs t

factorial' :: Int -> Int
factorial' n = productoria' [1..n] identidad

-- e)
esPar' :: Int -> Int
esPar' x
        | mod x 2 == 0 = x
        | otherwise = 1

multiplicaPares :: [Int] -> Int
multiplicaPares xs = productoria' xs esPar'