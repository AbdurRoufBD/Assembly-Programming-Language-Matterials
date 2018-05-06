.MODEL SMALL

.DATA


.CODE

MAIN PROC
    MOV AH,1
    INT 21h
    MOV BL,AL ;save input into B
    
    MOV AH,2
    MOV DL,0Dh
    INT 21h
    MOV DL,0Ah
    INT 21h
    
    SUB BL,20h ;a-->A convertion
    MOV DL,BL
    INT 21h
    
    ;return 0  
    MOV AH,4CH
    INT 21h
MAIN ENDP

END MAIN
