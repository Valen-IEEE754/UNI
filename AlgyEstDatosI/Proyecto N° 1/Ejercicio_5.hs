identidad :: Bool -> Bool
identidad True = True 
identidad False = False
    
paratodo' :: [a] -> (a -> Bool) -> Bool
paratodo' [] t = True
paratodo' (x:xs) t = t x && paratodo' xs t
    
paratodo'' :: [Bool] -> Bool
paratodo'' [] = True
paratodo'' bs = paratodo' bs identidad 