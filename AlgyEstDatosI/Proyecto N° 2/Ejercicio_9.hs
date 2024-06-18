data Arbol a = Hoja | Rama ( Arbol a ) a ( Arbol a )
type Prefijos = Arbol String

--a)
a_long :: Arbol a -> Int
a_long Hoja = 0
a_long (Rama a _ b) = 1 + a_long a + a_long b
--b)
a_hojas :: Arbol a -> Int
a_hojas Hoja = 1
a_hojas (Rama c _ d) = a_hojas c + a_hojas d
--c)
a_inc :: Num a => Arbol a -> Arbol a
a_inc Hoja = Hoja
a_inc (Rama e h f) = (Rama(a_inc e) (h+1) (a_inc f))
--d)
a_map :: (a -> b) -> Arbol a -> Arbol b
a_map _ Hoja = Hoja
a_map u (Rama x y z) = (Rama (a_map u x) (u y) (a_map u z))