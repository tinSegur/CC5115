## El operador  `bind`

```haskell
(>>=) :: m a -> (a -> m b) -> m b
```

```haskell
class Applicative m => Monad m where
	return 	:: a -> m a
	(>>=)	:: m a -> (a -> m b) -> m b

	return = pura
```

Las mónadas son subclases de los functores aplicativos, donde se denomina la función `pure` (que transforma un valor puro en un valor monádico) como `return`.

El operador `bind`, notado `(>>=)`, es similar al operador aplicativo, con la diferencia de tener el argumento a la izquierda en vez de la derecha. Además, el operador toma un valor monádico y le entrega un valor puro a la función. A su vez, la función devuelve un valor monádico. 
Por ejemplo:

```haskell
Just 1 >>= \x1 ->
Just 2 >>= \x2 ->
Just 3 >>= \x3 ->
return (x1 + x2 + x3)
```

Este patrón suele repetirse al trabajar con valores monádicos, con lo que Haskell entrega la do-notation:

```haskell
x1 <- m1
x2 <- m2
...
xn <- mn
f x1 x2 ... xn
```

Esta notación también permite hacer pattern matching en el lado iquierdo de éstas expresiones. 


## Mónada de I/O
Esta mónada se usa para integrar programas funcionales con los efectos generados por las interacciones con el mundo exterior (típicamente, el usuario).

Para cada tipo concreto `t`, `IO t` representa el tipo de programas que realizan operaciones de entrada y salida, y devuelven un valor de tipo `t`.

Esta mónada tiene ciertas "primitivvas" o acciones básicas:

- `getChar :: IO Char` -> lee un carácter del teclado, lo imprime, y lo devuelve como resultado. 
- `getLine :: IO String` -> lee una línea delimitada por el caracter newline, y devuelve la línea como string. 
- `putChar :: Char -> IO ()
- `putStr :: String -> IO ()`
- `putNl :: IO ()`

### Ejemplos

```haskell
act :: IO(Char, Char)
-- lee 3 caracteres, descarta el segundo, devuelve el primero y el tercero como par
act = do
	x <- getChar
	getChar
	y <- getChar
	return (x, y)

strlen :: IO()
strlen = do
	putStr "Enter a string: "
	xs <- getLine
	putStr "The string has: "
	putStr (show (length xs))
	putStrLn " characters."
```


## Mónada de estado

Esta mónada busca encapsular las interacciones del programa con un estado cambiante, y facilitar la comunicación de este estado ente distinas partes del programa. 


### Ejemplo

```haskell
type Value 	= Int
type State 	= Int
type Result	= Value

data ST a = Mk (State -> (a, State))

instance Functor ST where
	fmap f (Mk st) = Mk (\s -> let (va, st') st s in
			(f va, st'))

instance Applicative ST where
	pure va = Mk (\s -> (va, s))
	(Mk stab) <*> (Mk sta) = Mk (\s -> let (fab, s') = stab s in
										let (va, s'') = sta s' in
				(fab va, s'')
				)

instance Monad ST where
	(Mk sta) >>= f = Mk (\s -> let (va, s') = sta s in
								let (Mk stb) = f va in
								stb s'
						)

tick :: ST ()
tick = Mk (\x -> ((), x+1))


evalN :: Expr -> ST Result
evalN (Val v)		= do 
	tick
	return v
evalN (Sum e1 e2)	= do
	v1 <- evalN e1
	v2 <- evalN e2
	tick
	return (v1 + v2)



```









