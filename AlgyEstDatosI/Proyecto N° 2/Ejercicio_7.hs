data Cola = VaciaC | Encolada Persona Cola
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
--- A)
--- 1)
atender :: Cola -> Maybe Cola
atender VaciaC = Nothing
atender (Encolada x xs) = Just xs
--- 2)
encolar :: Persona -> Cola -> Cola
encolar a VaciaC = Encolada a VaciaC
encolar a (Encolada x xs) = Encolada x (encolar a xs)   
--- 3)
busca :: Cola -> Cargo -> Maybe Persona
busca VaciaC cargo = Nothing
busca (Encolada persona cola) cargo
    |persona    == Docente cargo = Just (persona)
    |otherwise  = busca cola cargo
--- B) Se parece a NotaMusical junto con a Alteracion