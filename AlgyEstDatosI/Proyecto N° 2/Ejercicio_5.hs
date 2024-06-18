data NotaBasica = Do | Re| Mi| Fa | Sol | La | Si
                deriving (Eq,Ord,Show,Bounded)
--- a)
data Alteracion = Bemol | Sostenido | Natural
data NotaMusical = Nota NotaBasica Alteracion
                 | A Int Bool NotaMusical
--- b)
sonido :: NotaBasica -> Int
sonido Do = 1
sonido Re = 3
sonido Mi = 5
sonido Fa = 6
sonido Sol = 8
sonido La = 10
sonido Si = 12

sonidoCromatico :: NotaMusical -> Int
sonidoCromatico (Nota nb Sostenido) =sonido nb + 1
sonidoCromatico (Nota nb Bemol)     =sonido nb - 1
sonidoCromatico (Nota nb Natural)   =sonido nb
--- c)
instance (Eq NotaMusical) where
 nm1 == nm2 = sonidoCromatico nm1 == sonidoCromatico nm2
--- d)
instance (Ord NotaMusical) where
 nm1 <= nm2 = sonidoCromatico nm1 <= sonidoCromatico nm2