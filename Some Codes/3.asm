.MODEL SMALL

.DATA
    STR1 DB "ENTER 1ST NUMBER: $"
    STR2 DB "ENTER 2ND NUMBER: $"
    STR3 DB "YOU HAVE ENTERED: $"
    STR4 DB "AFTER SWAPPING: $"   

.CODE

MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,STR1
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21h
    MOV CH,AL
    
    MOV AH,2
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H
    
    LEA DX,STR2
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21h
    MOV CL,AL
    
    ;return 0
    MOV AH,2
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H
    
    LEA DX,STR3
    MOV AH,9
    INT 21h
    
    MOV AH,2
    MOV DL,CH
    INT 21H
    MOV DL,' '
    INT 21H
    MOV DL,CL
    INT 21H
    
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H
    
    LEA DX,STR4
    MOV AH,9
    INT 21H
    
    ; USE XOR TO SWAP         
    XOR CH,CL
    XOR CL,CH
    XOR CH,CL         
    
    MOV AH,2
    MOV DL,CH
    INT 21H
    MOV DL,' '
    INT 21H
    MOV DL,CL
    INT 21H
    
               
    MOV AH,4CH
    INT 21h
MAIN ENDP

END MAIN
