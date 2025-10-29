//RAE1

@i
M=1           

@sum
M=0           

@limit
M=100         

(LOOP)
@i
D=M           
@limit
D=D-M         
@END
D;JGT         

// sum += i
@i
D=M
@sum
M=M+D

// i++
@i
M=M+1

@LOOP
0;JMP         

(END)
@END
0;JMP         