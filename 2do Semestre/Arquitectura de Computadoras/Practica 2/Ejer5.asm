         ORG 1000h
         MSJ DB "INGRESE UN NUMERO:"
         FIN_MSJ DB ?
         ERROR DB "CARACTER NO VALIDO"
         FIN_ERROR DB ?
        
         ORG 1500h
         NUM DB ?
  
         ORG 3000h
 ES_NUM: CMP BYTE PTR [BX], '0' ; Comparo [BX] con el caracter '0'
         JS FIN ; Solo se prende S si [BX] < '0'
         CMP BYTE PTR [BX], ':' ; Comparo [BX] con el caracter siguiente a '9'
         JNS FIN ; Solo se prense S si [BX] < ':'
         MOV CL, 0FFh ; Si no salta en ninguno es un numero
         JMP FIN2
    FIN: MOV CL, 00h ; Si salta significa que no es un numero
         MOV BX, OFFSET ERROR
         MOV AL, OFFSET FIN_ERROR - OFFSET ERROR
         INT 7 ; Imprimo el mensaje de error
   FIN2: RET
      
         ORG 2000h
         MOV BX, OFFSET MSJ
         MOV AL, OFFSET FIN_MSJ - OFFSET MSJ
         INT 7
         MOV BX, OFFSET NUM
         INT 6
         CALL ES_NUM
         CMP CL, 0FFh
         JNZ NOT_IMP
         MOV AL, 1
         INT 7
NOT_IMP: MOV CL, NUM
         INT 0
         END 
