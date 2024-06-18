--a) 
primIgualesA :: Eq a => a -> [a] -> [a]
primIgualesA _ [] = []
primIgualesA a (x:xs) 
                |a == x = x : primIgualesA a xs
                |a /= x = []

--b)
primIgualesA' :: Eq a => a -> [a] -> [a]
primIgualesA' a [] = []
primIgualesA' a b = takeWhile (==a) b 