
Se refiere al  razonamiento a través del cuál se aplican reglas consideradas válidas sobre una equivalencia entre dos valores para demostrar propiedades sobre ellos. 

En haskell, se puede aplicar este tipo de razonamiento a programas escritos en el lenguaje para establecer equivalencias entre ellos. A su vez, esto permite establecer propiedades de funciones o procedimientos. Dentro del lenguaje, se pueden tomar las definiciones de funciones como las ecuaciones iniciales que luego se pueden aplicar para demostrar las equivalencias. 

## Técnicas
### Análisis de casos
Aplicable particularmente en casos donde tenemos funciones que realizan pattern matching sobre un identificador y aplican distintas reglas apropiadamente. 
Ejemplo:

```haskell
-- dada una def
not True = False
not False = True

-- queremos demostrar not (not b) = b

-- caso b = True
not (not True) = not False = True

-- caso b = False
not (not False) = not True =  False

```

### Inducción Estructural
Aplicable en funciones recursivas donde se utiliza pattern matching para definir casos base y se tienen por otro lado casos recursivos.
Luego es cuestión de formular la demostración recursiva utilizando los casos base y recursivos apropiados.

