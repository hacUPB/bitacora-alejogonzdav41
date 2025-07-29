// Primero vamos a la posicion 24576 por medio de @KBD o @24576
// Luego leemos lo que hay en la posicion y le restamos 100
// Despues comparamos el resultado para saber si se realizara el salto a @DRAW, si se cumple la igualdaad a 0 se procedera a al dibujo, si no segura en el loop.
// Esto nos dirige a la pantalla por medio del @SCREEN
// Corremos el codigo del dibujo que al finalizar volvera al loop para asegurarse de que se siga cumpliendo la condicion
// En caso de que no se este presionando la tecla D se limpiara el dibujo


// Inicialización
@LOOP
0;JMP

// ========== BORRADO ==========
(ERASE)
@0
D=A
@i
M=D           // i = 0

(ERASE_LOOP)
@i
D=M
@8
D=D-A
@AFTER_ERASE
D;JGE          // if i >= 8 goto AFTER_ERASE

@SCREEN
D=A
@i
D=D+M
A=D-A
D=D-A
M=0           // borrar

@i
M=M+1
@ERASE_LOOP
0;JMP

(AFTER_ERASE)
@LOOP
0;JMP

// ========== DIBUJO ==========
(DRAW)
@0
D=A
@i
M=D           // i = 0

// Bitmap camaron (8 líneas ejemplo)
@0b1111111111111111
D=A
@SCREEN
D=D+A
A=D-A
M=D-A

@0b1000000000000001
D=A
@SCREEN
@1
D=D+A
A=D-A
M=D-A

@0b1011111111111101
D=A
@SCREEN
@2
D=D+A
A=D-A
M=D-A

@0b1010000000000101
D=A
@SCREEN
@3
D=D+A
A=D-A
M=D-A

@0b1010111111100101
D=A
@SCREEN
@4
D=D+A
A=D-A
M=D-A

@0b1001000000011001
D=A
@SCREEN
@5
D=D+A
A=D-A
M=D-A

@0b1111111111111111
D=A
@SCREEN
@6
D=D+A
A=D-A
M=D-A

@0b0000000000000000
D=A
@SCREEN
@7
D=D+A
A=D-A
M=D-A

@LOOP
0;JMP

// ========== BUCLE PRINCIPAL ==========
(LOOP)
@24576         // Teclado
D=M
@100
D=D-A          // ¿D == 100? (ascii de 'd')
@DRAW
D;JEQ
@ERASE
0;JMP