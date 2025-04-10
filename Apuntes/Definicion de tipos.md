## Sinónimos de tipos
Durante el desarollo, suele ser útil definir sinónimos de tipos para mejorar la legibilidad del código y facilitar la reutilización. Por ejemplo:

```haskell
type Position = (Float, Float)
type Angle = Float
type Distance = Float

move :: Position -> Distance -> Angle -> Position
move (x, y) d a = (x + d * cos a, y + d * sin a)

```

Se pueden parametrizar:

```haskell
type Pair a = (a, a)
type Automorphism a = a -> a

-- Map
type Assoc k v = [(k, v)]

find :: Eq k => Assoc k v -> k -> v
find key table = head [v' | (k', v') <- table, k' == key]
```


## Datatypes

```haskell
data Direction = North | South | East | West

shift :: Position -> Direction -> Position
shift (x, y) North = (x, y+1)
shift (x, y) South = (x, y-1)
shift (x, y) East = (x+1, y)
shift (x, y) West = (x-1, y)

rev :: Direction -> Direction
rev North = South
rev South = North
rev East = West
rev West = East
```

Se puede notar que si bien este nuevo datatype está definido, no lo podemos mostrar en el intérprete ya que no existe dentro de la typeclass Show. Se puede arreglar así:

```haskell
data Direction = North | South | East | West deriving (Show, Eq)
```

Esto provee inferencia automática para métodos de printeo y de igualdad.

### Extendiendo datatypes
Se le pueden añadir parámetros a los datatypes:

```haskell
data Shape 	= Circle Position Distance
			| Rectangle Position Position deriving (Show, Eq)
```

Notar que el tipo de Circle se presenta como:

```haskell
Circle :: Position -> Distance -> Shape
```

Es decir, los constructores también están currificados.
Por el otro lado, no es posible tener polimorfismo de constructores (por ej. tener dos constructores para la clase Circle)

### Maybe

El datatype Maybe es útil para capturar parcialidad (veremos más adelante que es una mónada):

```haskell
data Maybe a = Nothing | Just a deriving (Show, Eq) --no es necesario definirlo, es de la librería estándar

safeDiv :: Int -> Int -> Maybe Float
safeDiv _ 0 = Nothing
safeDiv x y = Just (x `div` y)

```

### Datatypes inductivos

Claramente, lo interesante aquí es introducir inductividad. Se puede hacer así:

```haskell
data Nat = Zero | Succ Nat deriving (Show, Eq)
```

Por supuesto, datatypes inductivos se prestan a métodos inductivos para realizar operaciones:

```haskell
nat2Int :: Nat -> Int
nat2Int Zero 	= 0
nat2Int Succ n 	= 1+nat2Int n

addNat :: Nat -> Nat -> Nat
add Zero n 		= n
add (Succ n) n	= Succ (add m n) 

leqNat :: Nat -> Nat -> Bool -- Menor o igual
leqNat Zero _				= True
leqNat _ Zero				= False
leqNat (Succ m) (Succ n)	= leqNat m n

fibNat :: Nat -> Nat
fibNat Zero 			= Zero
fibNat (Succ Zero) 		= Succ Zero
fibNat (Succ (Succ n)) 	= addNat (fibNat (Succ n)) (fibNat n) 
```







