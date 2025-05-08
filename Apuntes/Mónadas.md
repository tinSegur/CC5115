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