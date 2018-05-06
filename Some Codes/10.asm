.MODEL SMALL

.CODE
    VAR1 DW ?
    VAR2 DW ?
                   
MAIN PROC
    
    MOV AX,180
    MOV BX,180
    
    MOV CX,AX
    ADD CX,BX      
    
    MOV AH,2
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H
    MOV DL,CH
    INT 21H
    MOV DL,CL
    INT 21H
    MOV AH,4CH
    INT 21H 
MAIN ENDP

END MAIN 
