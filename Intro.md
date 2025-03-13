
## Programación funcional
El estilo de programación funcional es un estilo orientado a la evaluación de expresiones.


### Ventajas de la programación funcional
- Programas más concisos y comunicativos
- Permite acceso a abstracciones más complejas y a análisis más detallado de programas.
- El paralelismo se vuelve mucho más simple en lenguajes funcionales puros. 

### Haskell
- Tipado estático, con inferencia de tipos
	- Esta inferencia de tipos permite además la inferencia de "clases" de tipos (ej. tipos que permiten operaciones de comparación)
- Lenguaje funcional puro
	- Permite razonar ecuacionalmente sobre un programa.
- _Lazy_: No se computan los resultados hasta que es estrictamente necesario.


#### Notación
- Listas: `[1,2,3] (1:(2:(3:[])))`
- Funciones: en un archivo, 
	`func x = expr`
	- Para la composición:
		- pintwise1: `func2 x = func (func x)`
		- pintwise2: `func2 x = (func1 . func1) x`
		- pointfree: `func2 = func . func`

