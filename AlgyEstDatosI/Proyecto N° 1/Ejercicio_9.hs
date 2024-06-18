--a)
listofnumsec :: [Int] -> [Int]
listofnumsec [] = []
listofnumsec (x:xs) 
                |mod x 2 == 0 = x : listofnumsec xs 
                |mod x 2 /= 0 = listofnumsec xs

--b) 



listofnumsec' :: [Int] -> [Int]
listofnumsec' [] = []
listofnumsec' a = filter esPar a

--c)
esPar :: Int -> Bool
esPar i = mod i 2 == 0

multiplicaPares' :: [Int] -> Int
multiplicaPares' [] = 1
multiplicaPares' (x:xs) 
                    |esPar x == True = x * multiplicaPares' xs
                    |esPar x == False = multiplicaPares' xs