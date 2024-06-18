
-- Ejercio 4 de referencia
--a)
paratodo' :: [a] -> (a -> Bool) -> Bool
paratodo' [] t = True
paratodo' (x:xs) t = t x && paratodo' xs t
--b)
existe' :: [a] -> (a -> Bool) -> Bool
existe' [] t = False
existe' (x:xs) t = t x || existe' xs t 
--c)
sumatoria' :: [a] -> (a -> Int) -> Int
sumatoria' [] t = 0
sumatoria' (x:xs) t = (t x) + (sumatoria' xs t)
--d)
productoria' :: [a] -> (a -> Int) -> Int
productoria' [] t = 1
productoria' (x:xs) t = (t x) * productoria' xs t

-- Ejercio 12
cuantGen :: (b -> b -> b) -> b -> [a] -> (a -> b) -> b
cuantGen op z [] p = z
cuantGen op z (x:xs) p = op (p (x)) (cuantGen op z xs p)
 
paratodo'' :: [a] -> (a -> Bool) -> Bool
paratodo'' xs t = cuantGen (&&) True xs t
 
existe'' :: [a] -> (a -> Bool) -> Bool
existe'' xs t = cuantGen (||) False xs t
 
sumatoria'' :: [a] -> (a -> Int) -> Int
sumatoria'' xs t = cuantGen (+) 0 xs t
 
productoria'' :: [a] -> (a -> Int) -> Int
productoria'' xs t = cuantGen (*) 1 xs t