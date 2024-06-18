--a) f :: (a, b) -> ...
--f (x , y) = …}
 
-- (x, y) :: (a, b)
-- x :: a
-- y :: b
-- Sí cubre todos los casos
 
 
--b) f :: [(a, b)] -> …
--f (a , b) = …
 
-- (x, y) :: [(a, b)]
-- x :: (a, b)
-- y :: 
-- No cubre todos los casos
 
-- (x, y) :: [(a, b),(c, d)]
-- x :: (a, b)
-- y :: (c, d)
-- Si cubre todos los casos
 
 
 
--c) f :: [(a, b)] -> ...
--f (x:xs) = …
-- (x:xs) :: [(a, b)]
-- x :: (a, b)
--esta bien tipado pero falta:
-- xs :: []
 
--d) f :: [(a, b)] -> ...
--f ((x, y) : ((a, b) : xs)) = …
-- ((x, y) : ((a, b) : xs)) :: [(a, b)]
-- (x, y) :: (a: xs, b: xs)
-- ((a, b) : xs)) :: (a: xs, b: xs)
-- x :: a: xs
-- y :: b: xs
 
--esta bien tipado pero falta:
-- xs :: []
 
--e) f :: [(Int, a)] -> ...
--f [(0, a)] = …
 
 
--[(Int, a)]  :: [(0, a)]
--(Int, a) :: (0, a)
-- Int:: 0
-- a :: a
--esta bien tipado pero falta:
-- xs :: []
 
--f ) f :: [(Int, a)] -> ...
--f ((x, 1) : xs) = …
--[(Int, a)] :: ((x, 1) : xs)
-- (Int, a) :: (x, 1)
-- Int :: x
-- a :: 1
--No funciona por que esta al revés, siendo que x además de poder ser un int puede ser un bool y a debería ser una función o debería ser algo que esté definida para cualquier caso cosa que no pasa si ingreso un 2 int
--y además falta:
-- xs :: []
--g) f :: (Int -> Int) -> Int -> ...
--f a b = …
--(Int -> Int) -> Int :: a b
-- (Int -> Int):: a
-- Int :: b
--No funciona si b es bool por qué debería ingresar un int pero puede ingresar un bool
 
--h) f :: (Int -> Int) -> Int -> ...
--f a 3 = …
--(Int -> Int) -> Int :: a 3
-- (Int -> Int):: a
-- Int ::3
 
--i) f :: (Int -> Int) -> Int
--f 0 1 2 = ...
--(Int -> Int) -> Int :: 0 1 2
-- (Int -> Int):: 0 1
-- Int :: 2
--No funciona por que debería ser una función o solo la entrada de un número, no dos (0 1)
