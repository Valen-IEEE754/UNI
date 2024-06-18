--- a)
minimoElemento :: Ord a => [a] -> a
minimoElemento [a] = a
minimoElemento (x:xs) =  x `min` minimoElemento xs

--- b)
minimoElemento' :: (Bounded a, Ord a) => [a] -> a
minimoElemento' [] = maxBound
minimoElemento' [a] = a
minimoElemento' (x:xs) =  x `min` minimoElemento' xs

--- c)La nota mas grave de la melodıa es : Re