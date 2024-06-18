primerElemento :: [a] -> Maybe a
dividir [] = Nothing
primerElemento (x:xs) = Just x