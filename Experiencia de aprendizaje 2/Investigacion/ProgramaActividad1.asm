(LOOP)
    @24576     // Dirección del teclado (KBD)
    D=M
    @107
    D=D-A
    @DRAW
    D;JEQ      // Si se presionó 'k', ir a DRAW
    @LOOP
    0;JMP      // Si no, seguir esperando

// Dibuja píxeles
(DRAW)
    @SCREEN    // Dirección base de la pantalla (16384)
    D=A
    @SCREENPTR
    M=D        // Guardar dirección en SCREENPTR

    @255       // Valor binario 0000000011111111 (enciende 8 bits bajos)
    D=A
    @SCREENPTR
    A=M
    M=D        // Escribe el valor en la pantalla (enciende 8 píxeles)

    @HALT
    0;JMP

(HALT)
    @HALT
    0;JMP