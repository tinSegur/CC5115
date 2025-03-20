## Guarded definitions
Si se quiere definir una función que responda a varios casos según condiciones sobre el input, se pueden utilizar _guarded definitions_, que permiten simplificar el uso de _ifs_ anidados. 

```haskell
singInt :: Int -> Int
signInt x | x < 0	= -1
		  | x == 0 	= 0
		  | otherwise = 1
```

## Type-classes
Imponen restricciones sobre los tipos de entrada de una función, con características comunes y jerarquías. Se permite además imponer múltiples restricciones sobre un _input_.

```haskell
sign :: (Num a, Ord a) => a -> Int
```

