.MODEL SMALL

.DATA
    VAR1 DB 0   

.CODE

MAIN PROC
    MOV AH,1
    INT 21H
    MOV CH,AL 
    
    MOV AH,2
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV CL,AL 
    
    MOV AH,2
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV BH,AL  
    
    MOV AH,2
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H
    
    ADD CL,CH
    SUB CL,'0'
    ADD CL,BH
    SUB CL,'0'
    
    MOV AH,2
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H
    
    MOV DL,CH
    INT 21H
       
    MOV AH,4CH
    INT 21h
MAIN ENDP

END MAIN
