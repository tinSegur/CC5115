| Functores                                                                                                              | [[Functores aplicativos]]                                   | [[Mónadas]]                                                                                                 |
| ---------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------- |
| Operan funciones puras sobre valores puros, manteniendo en todo momento el contexto ("o caja") en que están envueltos. | Operan funciones puras _envueltas_ sobre valores envueltos. | Operan funciones _impuras_ (toman un argumento puro y devuelven un valor monádico) sobre valores monádicos. |
Se puede notar esta diferencia en los operadores que usan para aplicar funciones sobre cada una de estas abstracciones:

```haskell
-- Functor
fmap :: (a -> b) -> f a -> f b

-- Aplicativo
(<*>) :: f (a -> b) -> f a -> f b

-- Mónada
(>>=) :: m a -> (a -> m b) -> m b

```
