--- a)
data Carrera = Matematica | Fisica | Computacion | Astronomia
                deriving (Show,Eq)
type Ingreso = Int
data Cargo = Titular | Asociado | Adjunto | Asistente | Auxiliar 
        deriving (Show,Eq)
data Area = Administrativa | Ensenanza | Economica | Postgrado
    deriving (Show,Eq)
data Persona = Decane---constructor sin argumento
            | Docente Cargo --- constructor con un argumento
            | NoDocente Area---constructor con un argumento
            | Estudiante Carrera Ingreso ---constructor con dos argumentos
            deriving (Show,Eq)
--- b) El tipo constructor Docente es Cargo que este puede ser Titular, Asociado, Adjunto, Asistente, Auxiliar ---  Docente :: Cargo -> Persona
--- c)
cuantos_doc :: [Persona] -> Cargo -> Int
cuantos_doc [] c = 0
cuantos_doc (x:xs) c
        | Docente c == x = 1 + cuantos_doc xs c
        | Docente c /= x = cuantos_doc xs c

--- d)
cuantos_doc' :: [Persona] -> Cargo -> Int
cuantos_doc' xs c = length (filter (== Docente c) xs )
