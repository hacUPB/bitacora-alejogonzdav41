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

* Realiza la suma de los 10 elementos de arr y deja el resultado final en sum.

// ¿Cuál es la dirección base de arr en la memoria RAM?

*  arr se encuentra en la direccion 16 de la RAM

// ¿Cuál es la dirección base de sum en la memoria RAM y por qué?

* sum se encuentraen la direccion 17 de la RAM por lo que se explico antes de las variables

// ¿Cuál es la dirección base de j en la memoria RAM y por qué?

* Y por eso mismo, al arr estar en la 16 y sum en la 17, j va a estar en la 18

// 17

```
@7
D=D-A
@69
D;JEQ
```

// 19

// Inicializa el puntero de pantalla

```
@16384
D=A
@16
M=D
```

// Lee el teclado

```
@24576
D=M
@19
D;JNE
```

// Mueve el puntero hacia atrás si no se presiona tecla

```
@16
D=M
@16384
D=D-A
@4
D;JLE
@16
M=M-1
0;JMP
```

// Si se presiona tecla, mueve el puntero hacia adelante

```
@4
0;JGE
@16
D=M
@24576
D=D-A
@4
D;JLT
@16
M=M+1
0;JMP
```

// Escribe el valor -1 (0xFFFF) en la dirección apuntada (enciende píxeles)

```
@16
M=-1
@4
0;JGE
```

// ¿Qué hace este programa?

* Recorre la pantalla hacia adelante o atrás (dependiendo de si presionas una tecla o no) y enciende un bloque de 16 píxeles en la posición actual.
* Si no se presiona tecla: el puntero de pantalla se mueve hacia atrás.
* Si se presiona una tecla: el puntero se mueve hacia adelante.
* Luego, en ambos casos, se pinta un bloque de píxeles (-1 = 0xFFFF = 16 bits en 1) en esa posición.

// 20
(LOOP)
@24576
D=M
@100
D=D-A
@draw
D;JEQ
@LOOP
0;JMP
(draw)
// put bitmap location value in R12
// put code return address in R13
@SCREEN
D=A
@R12
AD=D+M
// row 7
@240 // A holds val
D=D+A // D = addr + val
A=D-A // A=addr + val - val = addr
M=D-A // RAM[addr] = val
// row 8
D=A // D holds previous addr
@32
AD=D+A
@462 // A holds val
D=D+A // D = addr + val
A=D-A // A=addr + val - val = addr
M=D-A // RAM[addr] = val
// row 9
D=A // D holds previous addr
@31
AD=D+A
@32767
A=!A // A holds val
D=D+A // D = addr + val
A=D-A // A=addr + val - val = addr
M=D-A // RAM[addr] = val
AD=A+1 // D holds addr
@3963 // A holds val
D=D+A // D = addr + val
A=D-A // A=addr + val - val = addr
M=D-A // RAM[addr] = val
// row 10
D=A // D holds previous addr
@31
AD=D+A
@8192 // A holds val
D=D+A // D = addr + val
A=D-A // A=addr + val - val = addr
M=A-D // RAM[addr]=-val
AD=A+1 // D holds addr
@5632 // A holds val
D=D+A // D = addr + val
A=D-A // A=addr + val - val = addr
M=D-A // RAM[addr] = val
// row 11
D=A // D holds previous addr
@31
AD=D+A
@14336 // A holds val
D=D+A // D = addr + val
A=D-A // A=addr + val - val = addr
M=D-A // RAM[addr] = val
AD=A+1 // D holds addr
@13312 // A holds val
D=D+A // D = addr + val
A=D-A // A=addr + val - val = addr
M=D-A // RAM[addr] = val
// row 12
D=A // D holds previous addr
@31
AD=D+A
@3072 // A holds val
D=D+A // D = addr + val
A=D-A // A=addr + val - val = addr
M=D-A // RAM[addr] = val
AD=A+1 // D holds addr
@21504 // A holds val
D=D+A // D = addr + val
A=D-A // A=addr + val - val = addr
M=D-A // RAM[addr] = val
// row 13
D=A // D holds previous addr
@31
AD=D+A
@3072 // A holds val
D=D+A // D = addr + val
A=D-A // A=addr + val - val = addr
M=D-A // RAM[addr] = val
AD=A+1 // D holds addr
@21248 // A holds val
D=D+A // D = addr + val
A=D-A // A=addr + val - val = addr
M=D-A // RAM[addr] = val
// row 14
D=A // D holds previous addr
@33
AD=D+A
M=0
@-2
AD=D+A
@2048 // A holds val
D=D+A // D = addr + val
A=D-A // A=addr + val - val = addr
M=A-D // RAM[addr]=-val
AD=A+1 // D holds addr
@13825 // A holds val
D=D+A // D = addr + val
A=D-A // A=addr + val - val = addr
M=A-D // RAM[addr]=-val
// row 15
D=A // D holds previous addr
@33
AD=D+A
M=0
@-1
AD=D+A
	@13296 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=A-D // RAM[addr]=-val
	// row 16
	D=A // D holds previous addr
	@33
	AD=D+A
	M=0
	@-1
	AD=D+A
	@23024 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=A-D // RAM[addr]=-val
	// row 17
	D=A // D holds previous addr
	@33
	AD=D+A
	M=0
	@-2
	AD=D+A
	@32767
	A=!A // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	AD=A+1 // D holds addr
	@19463 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=A-D // RAM[addr]=-val
	// row 18
	D=A // D holds previous addr
	@33
	AD=D+A
	M=0
	@-2
	AD=D+A
	@16384 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	AD=A+1 // D holds addr
	@9946 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=A-D // RAM[addr]=-val
	// row 19
	D=A // D holds previous addr
	@32
	AD=D+A
	@28640 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 20
	D=A // D holds previous addr
	@32
	AD=D+A
	@20702 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 21
	D=A // D holds previous addr
	@32
	AD=D+A
	@24515 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 22
	D=A // D holds previous addr
	@33
	AD=D+A
	M=0
	@-1
	AD=D+A
	@6608 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=A-D // RAM[addr]=-val
	// row 23
	D=A // D holds previous addr
	@33
	AD=D+A
	M=0
	@-1
	AD=D+A
	@24818 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=A-D // RAM[addr]=-val
	// row 24
	D=A // D holds previous addr
	@33
	AD=D+A
	M=1
	@-1
	AD=D+A
	@1248 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 25
	D=A // D holds previous addr
	@33
	AD=D+A
	@2 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	@-1
	AD=D+A
	@20992 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 26
	D=A // D holds previous addr
	@33
	AD=D+A
	@4 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	@-1
	AD=D+A
	@30464 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=A-D // RAM[addr]=-val
	// row 27
	D=A // D holds previous addr
	@33
	AD=D+A
	@7 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	@-1
	AD=D+A
	@1792 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 28
	D=A // D holds previous addr
	@33
	AD=D+A
	M=0
	@-1
	AD=D+A
	@2048 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=A-D // RAM[addr]=-val
	// return
@LOOP
    0;JMP