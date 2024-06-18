--a)
primIguales :: Eq a => [a] -> [a]
primIguales [] = []
primIguales (x:xs) 
        |x == head xs = x : primIguales xs
        |x /= head xs = x : []

--b) 
primIguales' :: Eq a => [a] -> [a]
primIguales' [] = []
primIguales' a = takeWhile (== a!!1) a