--a) 
listofnum :: [Int] -> [Int]
listofnum [] = []
listofnum (x:xs)  = x * 2 : listofnum xs


--b) 
listofnum' :: [Int] -> [Int]
listofnum' a = map (*2) a