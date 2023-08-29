
            org 1000h
            STRING DB "abbcde!"
            ZERO DB 00h
            
            org 3000h
; Esta subrutina recibe un caracter en la pila por valor y una string en la pila por referencia
; Devuleve la cantidad de veces que se encuentra el caracter recibido en la string recibida en CX
CONTAR_CAR: PUSH BX ; Guardo BX
            PUSH AX ; Guardo AX

            MOV BX, SP 
            ADD BX, 6 ; Le sumo 6 a BX ya que guarde los 3 registros
            MOV AX, [BX] ; Guardo la primera variable en AX (caracter a contar)
            ADD BX, 2 ; Le sumo 2 a BX para ir a la siguiente variable
            MOV BX, [BX] ; Guardo la segunda variable en BX (Direccion donde empieza el string)

            MOV CX, 0 ; Inicilizo CX en 0
 LOOP_CONT: CMP BYTE PTR [BX], 0h ; Comparo [BX] con 0 para ver si termino de ejecutarse
            JZ FIN_CONT ; Si es 0 el programa termino
            CALL COMP ; Llamo a COMP para que se fije si [BX] es minuscula
            INC BX ; Incremento BX para pasar a la siguiente letra
            JMP LOOP_CONT ; Llamo al loop otra vez
  FIN_CONT: POP AX
            POP BX
            RET
  

      ; Esta subrutina recibe un caracter en AX por valor y uno en BX por referencia.
      ; Si los caracteres son iguales incrementa CX, de lo contrario no pasa nada
      COMP: CMP AL, [BX] ; Compara el caracter en AX con el de [BX]
            JNZ NO_ES_CAR ; Si no son iguales llama a ret
            INC CX ; En caso de ser iguales incrementa CX y luego llama a ret
 NO_ES_CAR: RET
            
            org 2000h
            MOV AX, offset STRING
            PUSH AX
            MOV AX, 'z'
            PUSH AX
            CALL CONTAR_CAR
            POP AX
            POP AX
            hlt
            end