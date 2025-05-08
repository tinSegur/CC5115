Estos functores tienen como objetivo resolver el problema de la cantidad de argumentos a la hora de definir la typeclass Functor. En particular, se refiere al problema donde se quieren definir _maps_ n-arios, donde se entreguen n objetos que correspondan a Functores y una función con n argumentos, entregándo a la función n elementos tomados de cada unode los functores. 

Como tal, el objetivo de los functores aplicativos es permitir la creación de functores que puedan admitir una cantidad de argumentos arbitraria, y que no implique predefinirlos en la librería estándar. Para esto, se toma inspiración del proceso a través del cuál se construyen funciones currificadas



Consideremos una versión generalizada de la aplicación de funciones:
```haskell
pure 	:: a -> f a
(<*>) 	:: f (a -> b) -> f a -> f b 
```

Donde se pueden dar programas así:

```haskell
	pure (+) <*> Just 5 <*> 6
	(pure (*) <*> Just 5) <*> Just 6
=   {def. pure, <*>}
 	(Just ((+) 5) <*> Just 6
= 	{def. <*>}
	Just ((+) 5 6)
=  	{def. +}
	Just 11
```

Entonces, veamos que Maybe es un functor aplicativo:

```haskell
instance Applicative Maybe where
-- 	pure :: a -> Maybe a
	pure = Just
-- 	(<*>) :: Maybe (a->b) -> Maybe a -> Maybe b
	Nothing <*> _ 	= Nothing
	(Just f) <*> x 	= fmap f x -- fmap se usa para el caso X = Nothing
```

Las listas también:

```haskell
instance Applicative [] where
-- 	pure :: a -> [a]
	pure x = [x]
--  (<*>) :: [a->b] -> [a] -> [b]
	fs <*> xs = [f x | f <- fs, x <- xs]
```

En este caso:
- `pure` toma un valor y devuelve una lista singleton
- `<*>` toma cada función de la lista a la izquierda, y la aplica a cada elemento de la lista a la derecha


