(LOOP)
    @24576
    D=M
    @101        // Código ASCII de 'e'
    D=D-A
    @CLEAR
    D;JEQ

    @LOOP
    0;JMP
    @CLEAR
@0
D=M
(CLEAR)
    @SCREEN
    D=A
    @addr
    M=D 

(CLEAR_LOOP)
    @addr
    A=M
    M=0        // Apaga 16 pixeles

    @addr
    M=M+1      // addr++

    @addr
    D=M
    @24576     // Dirección KBD (fin de memoria de pantalla)
    D=A-D
    @CLEAR_LOOP
    D;JGT      // Mientras addr < 24576

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