### Actividad 1

**¿Qué es la entrada-salida mapeada a memoria?**

* Es una técnica donde los dispositivos de entrada y salida se controlan utilizando direcciones de memoria especiales. El CPU lee o escribe en direcciones específicas de la RAM que están “mapeadas” a un dispositivo físico.

**¿Cómo se implementa en la plataforma Hack?**

* Para el SCREEN cada palabra de 16 bits representa 16 píxeles en la pantalla. Desde la dirección 16384 hasta 24575.
* Mientras que para el KBD el CPU puede leer el código ASCII de la última tecla presionada desde esta dirección. Si no hay tecla, el valor es 0.

**Inventa un programa que haga uso de la entrada-salida mapeada a memoria.**

```
(LOOP)
    @24576     // Dirección del teclado (KBD)
    D=M
    @107
    D=D-A
    @DRAW
    D;JEQ
    @LOOP
    0;JMP
(DRAW)
    @SCREEN     // Dirección base de la pantalla (16384)
    D=A
    @SCREENPTR
    M=D

    @255
    D=A
    @SCREENPTR
    A=M
    M=D

    @HALT
    0;JMP

(HALT)
    @HALT
    0;JMP
```

**Investiga el funcionamiento del programa con el simulador.**

* 
