 
--a) f :: (a, b) -> b
f1 :: (a, b) -> b
f1 (_, y) = y

--b) f :: (a, b) -> c
f2 :: (a, b) -> c
f2 = undefined
 
--c) f :: (a -> b) -> a -> b

--infixl 0  z
-- z :: (a -> b) -> a -> b  
-- f z  x =  f x

--Tambien encontre que se  hace referencia a estas funciones
--import Prelude hiding (($), ($!))
--infixl 0  $, $!
--($), ($!) :: (a -> b) -> a -> b  
--f $  x =         f x
--f $! x = x `seq` f x

--d) f :: (a -> b) -> [a] -> [b]
f4         ::  (a -> b) -> [a] -> [b]
f4 _ []     =  []
f4 f (x:s)  =  f x : map f s
 
--e) f :: (a -> b) -> (b -> c) -> a -> c
f5  ::  (a -> b) -> (b -> c) -> a -> c
f5  f x s = undefined

--Tambien encontre la funcion de composicion que esta definida tambien asi solo que el(a -> b) -> (b -> c) estan intercambiados por (b -> c) -> (a -> b)
--  > :type (.)       
--  (.) :: (b -> c) -> (a -> b) -> a -> c