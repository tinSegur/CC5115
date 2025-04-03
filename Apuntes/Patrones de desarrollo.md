## fold`
`fold` y `foldr` proveen una abstracción de un patrón común de desarrollo, de forma que se puede razonar sobre estas funciones para obtener propiedades interesantes, y luego aplicar estas propiedades como aprte del desarrollo común. 

### Concatenación de listas

```haskell
-- Dadas las reglas:
v @ x 		= x
f x (y @ z)	= f x y @ z

-- Se tiene que:
foldr f v (xs ++ ys) = foldr f v xs @ foldr f v ys
```

Esta propiedad es útil para probar la "distribución" de foldr bajo ciertas condiciones, como por ejemplo:


```haskell
-- Dado que:
0 + x 			= x
(+) x (y + z) 	= (+) x y + z

-- Se puede concluir que 
foldr (x) 0 (xs ++ ys) = (foldr (+) 0 xs) + (foldr (+) 0 ys)

-- Es decir,
sum (xs ++ ys) = sum xs + sum ys
```

### Ley de fusión
Permite descibir, bajo ciertas condiciones, la composisición de una cierta función con otra función recursiva como la aplicación de una sola función compuesta. Formalmente:

```haskell
f . foldr g a = foldr h b
```

Para esto, se debe cumplir que:
- `f`sea estricta. Es decir, que al recibir un cómputo indefinido, devuelva un cómputo indefinido.
- `f a = b`
- `f (g x y) = h x (f y)`


