          ORG 1000h
          NUM DB ?
          ; El ultimo caracter de la tabla es ':' ya que es el caracter siguiente a '9' en la tabla ascii
          TABLA_NUM DB '0', "Cero ", '1', "Uno ", '2', "Dos ", '3', "Tres ", '4', "Cuatro ", '5', "Cinco ", '6', "Seis ", '7', "Siete ", '8', "Ocho ", '9', "Nueve ", ':'
        
          ORG 3000h
RECORRER: PUSH BX ; Guardo BX
          PUSH DX ; Guardo DX
          
          MOV DL, NUM ; DL = NUM
          MOV BX, OFFSET TABLA_NUM ; BX = 1001h
LOOP_REC: CMP BYTE PTR [BX], DL ; Comparo la pos de la tabla con NUM
          JZ FIN_REC ; Si es 0 encontro el numero
          INC BX ; De lo contrario paso a la siguiente pos
          JMP LOOP_REC
          
 FIN_REC: INC BX ; Incremento BX para pararme al principio de la palabra
          CALL FOUNDED ; Devulve en AL la cantidad de caracteres a imprimir
          INT 7 ; Imprimo
          POP DX ; Restauro DX
          POP BX ; Restauro BX
          RET
          
 ; Recibe en DL el numero a comparar
 ; Devuleve en AL la cant de digitos a imprimir
 FOUNDED: PUSH BX ; Guardo BX
          PUSH DX ; Guardo DX

          MOV AL, 0 ; Inicializo AL en 0
          INC DL ; Incremento DL para pararme en el siguiente *NUMERO*
  LOOP_F: CMP BYTE PTR [BX], DL ; Comaparo la pos de la tabla con el siguiente numero
          JZ FIN_F ; Si es 0 terminaron los caracteres
          INC AL ; De lo contrario incremento la cant de cars a imprimir
          INC BX ; Paso a la siguiente pos de la tabla
          JMP LOOP_F
   FIN_F: POP DX ; Restauro DX
          POP BX ; Restauro BX
          RET

          ORG 2000h
REINICIO: MOV DH, 2 ; Inicializo DH en 2 para seguir el rastro de los 0 ingresados
    LOOP: MOV BX, OFFSET NUM ; Dir de num para guardar el val ingresado
          INT 6 ; Leo valor
          CALL RECORRER
          CMP BYTE PTR [BX], '0' ; Comparo [BX] con 0 para seguir rastro de los mismos
          JNZ REINICIO ; Si no es cero reinicio el contador de ceros consecutivos
          DEC DH ; De lo contrario decremento el contador
          JNZ LOOP ; Si el contador no es zero vuelvo al loop
          INT 0
          END