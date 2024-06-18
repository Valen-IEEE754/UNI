--8)a 
type GuiaTelefonica = ListaAsoc String Int

--8)b

data ListaAsoc a b = Vacia' | Nodo a b (ListaAsoc a b) 
                    deriving (Show,Eq,Ord)
---1
la_long :: ListaAsoc a b -> Int
la_long Vacia' = 0
la_long (Nodo _ _ c) = 1 + la_long c
---2
la_concat :: ListaAsoc a b -> ListaAsoc a b -> ListaAsoc a b
la_concat Vacia' la2 = la2
la_concat (Nodo a b la1) la2 = Nodo a b (la_concat la1 la2)
---3
la_agregar :: ListaAsoc a b -> a -> b -> ListaAsoc a b
la_agregar  c a b = Nodo a b c
---4 
la_pares :: ListaAsoc a b -> [(a, b)]
la_pares Vacia' = []
la_pares (Nodo a b c) = (a,b):la_pares c
---5
la_busca :: Eq a => ListaAsoc a b -> a -> Maybe b
la_busca Vacia' _ = Nothing
la_busca (Nodo a b xs) x
        | x == a = Just b
        | x /= a = la_busca xs x
---6        
la_borrar :: Eq a => a -> ListaAsoc a b -> ListaAsoc a b
la_borrar _ Vacia' = Vacia'
la_borrar d (Nodo a b c)
    |d == a = c
    |otherwise = Nodo a b (la_borrar d c)