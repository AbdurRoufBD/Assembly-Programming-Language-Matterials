.MODEL SMALL

.CODE
                       
MAIN PROC
    MOV CL, 65
    MOV AH,2
    MOV DL,CL
    INT 21H
    
    MOV AH,4CH
    INT 21H
MAIN ENDP

END MAIN 
