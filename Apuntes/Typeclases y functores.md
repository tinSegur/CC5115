## Recordatorio

Los typeclasses tienen como objetivo agrupar tipos basado en comportamientos comunes. 
Un ejemplo de la clase Eq:

```haskell
class Eq a where
	(==) :: a -> a -> Bool
	(/=) :: a -> a -> Bool

x == y = not (x /= y)
x /= y = not (x == y)
```

En este caso, las funciones `(==)` y `(/=)` están definidas una en términos de la otra. Por consecuencia, esto significa que cada una de ellas representa un conjunto mínimo de implementación (es decir, un conjunto mínimo de funciones que garantiza que la clase se comporte como se espera al implementarlas).

### Subclases
Es posible declarar un typeclass como una subclase de otra. Esto causa que instanciar un elemento de la subclase requiera que sea instanciable como elemento de la superclase, y le da acceso a los métodos de la superclase a los métodos de la subclase.


### Instancias derivadas
Al definir un datatype, es posible automáticamente incluirlo en las typeclasses estándar que vienen definidas por el lenguaje a través del `deriving`.    


### Typeclasses y constructores
Es posible definir typeclasses que agrupan constructores de tipo. Estos son constructores que esperan un tipo concreto y generan un tipo concreto distinto resultante. 


## Functores

Es una typeclass que caracteriza los tipos de datos que admiten una operación `map`.

```haskell
class Functor f where
	fmap :: (a -> b) -> f a -> f b
```

En este caso, `f`es una _variable de tipo_, que puede representar un tipo como una lista, un par, etc. En efecto, las listas pertenecen a la clase de functores:

```haskell
instance Functor [] where
	fmap = map
```

También los `Maybe`:

```haskell
instance Functor Maybe where
	fmap f (Just x) = Just (f x)
	fmap f Nothing 	= Nothing
```

Ambas clases son parte del preludio y ya vienen definidas como parte de los functores. Podemos añadir nuestras propias definiciones:

```haskell
instance Functor BinTree where
	fmap f (Leaf v) 		= Leaf (f v)
	fmap f (InNode t1 v t2) = InNode (fmap f t1) (f v) (fmap f t2) 
```


### Leyes de los functores

Para que un miembro de la clase functor sea "bien portado", se requiere que cumpla las siguientes condiciones:

- **Conservación de identidad**: `fmap id = id`
- **Conservación de composición**: `fmap (f . g) = (fmap f) . (fmap g)




