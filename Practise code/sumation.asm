.MODEL SMALL
.STACK 100H
.DATA

MSG1 DB 'Enter a number less than 5 : $s'
MSG2 DB 'Enter another number less than 6 : $'
MSG_F DB 'Summation is : $'

.CODE 
MAIN PROC 
    ;INITIALIZE DS
    MOV AX,@DATA
    MOV DS,AX
    
    ;PRINT FIRST LINE
    LEA DX,MSG1
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV BL,AL
    
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
    LEA DX,MSG2
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV BH,AL
    
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
    SUB BL,'0'
    SUB BH,'0'
    ADD BH,BL
    ADD BH,'0'
    
    LEA DX,MSG_F
    MOV AH,9
    INT 21H 
    
    MOV AH,2
    MOV DL,BH
    INT 21H
    
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
END MAIN

    
    