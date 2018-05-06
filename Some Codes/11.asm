.MODEL SMALL

.CODE
    VAR1 DB ?
    VAR2 DB ?
    VAR3 DB ?
                   
MAIN PROC
    MOV AH,1
    INT 21H
    MOV VAR1,AL
    
    MOV AH,2
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV VAR2,AL
    
    MOV AH,2
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV VAR3,AL
    
    MOV AH,2
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H
    
    MOV CL,VAR1
    SUB CL,VAR2
    ADD CL,VAR3
                   
    MOV DL,CL 
    INT 21H
    
    MOV AH,4CH
    INT 21H 
MAIN ENDP

END MAIN 
