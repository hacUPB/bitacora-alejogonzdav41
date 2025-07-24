// 1

```
@1978
D=A
```

// 2

```
@69
D=A
@100
M=D
```

// 3

```
@100
D=A
@24
M=D
D=M
@200
M=D
```

// 4

```
@25
D=A
@100
M=D
@15
D=A
@100
M=M-D
```

// 5

```
@0
D=M
@1
D=D+M
@69
D=D+A
@2
M=D
```

// 6

```
@100
D;JMP
```

// 7

```
@50
D=A
@100
M=D
@100
D=D-A
@20
D;JLT
```

// 8

```
@var1
D = M
@var2
D = D + M
@var3
M = D
```

// ¿Qué hace este programa?

* Toma el valo de var1, se lo suma al valor de var2 y finalmente le da ese valor a var3.

// En qué posición de la memoria está `var1`, `var2` y `var3`? ¿Por qué en esas posiciones?

* 16, 17 y 18.
* Porque las posiciones del 0 al 15 estan reservadas y las variables creadas se posicionan desde la 16.

// 9

```
i = 1
sum = 0
sum = sum + i
i = i + 1
```

// La traducción a lenguaje ensamblador del programa anterior es:

```
// i = 1
@i
M=1
// sum = 0
@sum
M=0
// sum = sum + i
@i
D=M
@sum
M=D+M
// i = i + 1
@i
D=M+1
@i
M=D
```

// ¿Qué hace este programa?

* Le da un valor inicial 1 a i y 0 a sum, luego suma en 1 al valor inicial de i.

// ¿En qué parte de la memoria RAM está la variable `i` y `sum`? ¿Por qué en esas posiciones?

* 16 y 17.
* Porque las posiciones del 0 al 15 estan reservadas y las variables creadas se posicionan desde la 16.

```
// i = i + 1
@i
D=M+1
@i
M=D
```

//La forma de optimizar esa parte del codigo es:

```
@i
M=M+1
```

// 10

```
@0
D=M
M=D+D
@1
M=D
```

// 11

```
i = 1000
LOOP:
if (i == 0) goto CONT
i = i - 1
goto LOOP
CONT:
```

// La traducción a lenguaje ensamblador del programa anterior es:

```
// i = 1000
@1000
D=A
@i
M=D
(LOOP)
// if (i == 0) goto CONT
@i
D=M
@CONT
D;JEQ
// i = i - 1
@i
M=M-1
// goto LOOP
@LOOP
0;JMP
(CONT)
```

// ¿Qué hace este programa?

* Genera un loop que compara el valor de i (que inicialmente es de 1000) y si es diferente de 0 le resta 1.

// ¿En qué memoria está almacenada la variable i? ¿En qué dirección de esa memoria?

* Ram.
* 16.

// ¿En qué memoria y en qué dirección de memoria está almacenado el comentario //i = 1000?

* Los comentarios no se almacenan en ninguna parte.

// ¿Cuál es la primera instrucción del programa anterior? ¿En qué memoria y en qué dirección de memoria está almacenada esa instrucción?

* @1000.
* Esta en la ROM y en la direccion 0.

// ¿Qué son CONT y LOOP?

* Son etiquetas, CONT es un contador y LOOP es un bucle condicionado.

//¿Cuál es la diferencia entre los símbolos `i` y `CONT`?

* La diferencia es que i es una variable y CONT una etiqueta.

// 12

```
@1
D=M
@2
D=D+M
@69
D=D+A
@4
M=D
```

//13

```
@R0
D=M
@0
D=D-A
@R1
D;JGE
```

// R0<0

```
@R1
M=-1
@LOOP
0;JMP
```

// R0>=0
```
@R1
M=1
@LOOP
0;JMP
(LOOP)
```

// 14

```
@R1
D=M
@R4
M=D
```

// 15

```
(LOOP)
@R0
A=M
M=-1
@R1
M=M-1
D=M
@R0
M=M+1
@LOOP
D;JNE
```

// 16

```
@10
D=A
@arr
M=D
D=M
@sum
M=0
@j
M=0
(LOOP)
@j
A=D+M
D=M
@sum
M=M+D
@j
M=M+1
@10
D=A
@j
D=D-M
@LOOP
D;JLE
(END)
@END
0:JMP
```

// ¿Qué hace este programa?

* 

// ¿Cuál es la dirección base de arr en la memoria RAM?

* 

// ¿Cuál es la dirección base de sum en la memoria RAM y por qué?

* 

// ¿Cuál es la dirección base de j en la memoria RAM y por qué?

* 

// 17

```
@7
D=D-A
@69
D;JEQ
```

// 18
