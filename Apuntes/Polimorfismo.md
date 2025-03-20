En general, el concepto refiere a funciones que puede recibir un tipo arbitrario como input en vez de tipos específicos, y adaptar (o no) su output apropiadamente. Permite reutilizar código y simplificar programas.

## En haskell

### Polimorfismo paramétrico
Refiere a polimorfismo de funciones que reciben cualquier tipo y alteran su _output_ paramétricamente según el tipo recibido. Por ejemplo:

```haskell
head :: (a, b) -> a
```

### Polimorfismo ad-hoc
Este tipo de polimorfismo es una abstracción que permite imponer condiciones o características sobre los tipos que se le entregan a funciones polimórficas. Esto se hace a través de los _type-class_. Estas "clases de tipos" permiten establecer interfaces comunes y además definir relaciones de jerarquía.

``` haskell
(+) :: Num a => a -> a -> a  
```


En este caso, denotamos que la función suma requiere que el tipo 'a' sea un tipo numérico. 
Consideremos por otra parte la firma de una función como `quicksort`, que toma como input una lista de valores que puedan ser comparables entre sí (es decir, que puedan ser ordenados):

```haskell
qsort :: Ord a => [a] -> [a]
```


**Ejemplos de tipado**
```haskell
	second :: (a, (b, c)) -> b
	swap   :: (a, b) -> (b, a)
	pair   :: a -> b -> (a, b)
	double :: Num a => a -> a
palindrome :: Eq a => [a] -> Bool
```


