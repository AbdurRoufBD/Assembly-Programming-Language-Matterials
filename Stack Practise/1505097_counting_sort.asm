.MODEL SMALL
.STACK 100H
.DATA
MSG DB 'NOT DIGIT $'
MSG1 DB 'Enter Input Array : $' 
MSG2 DB 'Sorted Output Array : $'
COUNTERARR DW 300 DUP(0)
.CODE  
       

MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,MSG1
    MOV AH,9
    INT 21H
    
    
    TOP:
    MOV AH,1
    INT 21H
    CMP AL,'x'
    JE ENDINPUT
    CALL INPUTINTEGER
    
    MOV AX,2
    MUL BX
    MOV BX,AX
    INC COUNTERARR[BX]
    XOR AX,AX
    JMP TOP
    
    

    ENDINPUT:
    
    MOV AH,2
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H
    
    LEA DX,MSG2
    MOV AH,9
    INT 21H
    
    XOR CX,CX
    XOR BX,BX
    
    OUTERLOOP: ;outerloop 
        XOR AX,AX ; ax = 0
        MOV AX,2  ; multiply with 2
        MUL BX
        MOV BX,AX ; bx = offset
        XOR AX,AX
        MOV CX,COUNTERARR[BX]
        JCXZ  IGNOREINNERLOOP
        
        
        FOR:       ;INNER LOOP
            MOV AX,BX
            SHR AX,1
            CALL OUTPUTINTEGER
            MOV AH,2
            MOV DL,' '
            INT 21H
            XOR AX,AX   
        LOOP FOR
        
        
        IGNOREINNERLOOP:
        SHR BX,1
        XOR CX,CX
        INC BX
        CMP BX,256
    JLE OUTERLOOP
    
    ENDPROG:
    MOV AH,4CH
    INT 21H 
    
    MAIN ENDP


OUTPUTINTEGER PROC
    PUSH AX
    PUSH BX 
    PUSH CX
    PUSH DX
     
    XOR CX,CX
    MOV BX,10
    
    REPEAT: 
    XOR DX,DX
    DIV BX ; DIVISOR QUOTENT IN AX AND REMAINDER IN DX
    PUSH DX
    INC CX
    
    OR AX,AX
    JNZ REPEAT
    
    
    MOV AH,2
    
    PRINTNUM:
    POP DX
    ADD DX,'0'
    INT 21H
    LOOP PRINTNUM
    
    POP DX
    POP CX
    POP BX
    POP AX
    
    RET
    
    OUTPUTINTEGER ENDP


INPUTINTEGER PROC
    
   PUSH CX
   PUSH DX
   
   XOR BX,BX
   
   
   WHILE:
   AND AX,00FFH
   CMP AX,' '
   JE ENDWHILE
   
   SUB AX,'0'
   PUSH AX
   
   MOV AX,10
   MUL BX
   POP BX
   ADD BX,AX
   XOR AX,AX
   MOV AH,1
   INT 21H
   JMP WHILE
   
   ENDWHILE:
   
   
   
   POP DX
   POP CX
   RET
   INPUTINTEGER ENDP
    
END MAIN

    
    
    
    
    
    
    