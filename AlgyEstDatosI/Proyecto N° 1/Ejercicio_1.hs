--a)
esCero :: Int -> Bool
esCero  0 = True ;
esCero _ = False ;
--b)
esPositivo :: Int -> Bool
esPositivo x
            | x > 0 = True
            | x <= 0 = False
--c)
esVocal :: Char -> Bool
esVocal x = x == 'a' || x == 'e'|| x == 'i'|| x == 'o'|| x == 'u'