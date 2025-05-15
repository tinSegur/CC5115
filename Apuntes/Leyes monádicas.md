
Las [[mónadas]] deben cummplir tres propiedades fundamentales:

## Identidad a la izquierda

```haskell
return x >>= f = f x
```

En este caso, queremos que se cumpla que pasarle un operador al resultado de un return, el resultado debiese ser equivalente a entregarle el valor puro que está envuelto en la mónada a la función directamente. 


## Identidad a la derecha

```haskell
mx >>= return = mx
```

Se debe cumplir que el return es el neutro a la derecha del `bind`


## Asociatividad

```haskell
(mx >>= f) >>= g = mx >>= (\x -> (f x >>= g))
```



