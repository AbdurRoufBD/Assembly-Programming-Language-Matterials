.MODEL SMALL
.STACK 100H
.CODE

MAIN PROC 
    MOV AH,1
    INT 21h ;INPUT
    MOV BL,AL
    
    
    MOV AH,2
    MOV DL,BL ; OUTPUT
    INT 21h
    
    
    MAIN ENDP
END