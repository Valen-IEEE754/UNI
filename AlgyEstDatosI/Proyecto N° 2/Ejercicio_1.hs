--- a)
data Carrera = Matematica | Fisica | Computacion | Astronomia
--- b)
titulo :: Carrera -> String
titulo Matematica   = "Licenciatura en Matematica"
titulo Fisica       = "Licenciatura en Fisica"
titulo Computacion  = "Licenciatura en Computacion"
titulo Astronomia   = "Licenciatura en Astronomia"
--- c)
data NotaBasica = Do | Re| Mi| Fa | Sol | La | Si
--- d)
cifradoAmericano :: NotaBasica -> Char
cifradoAmericano Do ='C'
cifradoAmericano Re ='D'
cifradoAmericano Mi ='E'
cifradoAmericano Fa ='F'
cifradoAmericano Sol='G'
cifradoAmericano La ='A'
cifradoAmericano Si ='B'