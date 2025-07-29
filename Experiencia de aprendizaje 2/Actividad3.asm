// Primero vamos a la posicion 24576 por medio de @KBD o @24576
// Luego leemos lo que hay en la posicion y le restamos 100
// Despues comparamos el resultado para saber si se realizara el salto a @DRAW, si se cumple la igualdaad a 0 se procedera a al dibujo, si no segura en el loop.
// Esto nos dirige a la pantalla por medio del @SCREEN
// Corremos el codigo del dibujo que al finalizar volvera al loop para asegurarse de que se siga cumpliendo la condicion
// En caso de que no se este presionando la tecla D se limpiara el dibujo

/* (LOOP)
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
@33	AD=D+A
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
@24576
A=M
D;JMP */

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