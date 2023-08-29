      org 1000h
      NUM1 DW 0AAAAh
      NUM2 DW 0BBBBh

      org 3000h
SWAP: PUSH BX ; Guardo BX
      PUSH AX ; Guardo AX
      PUSH CX ; Guardo CX
      PUSH DX ; Guardo DX

      MOV BX, SP
      ADD BX, 10 ; Le sumo 10 ya que son 4 registros mas el IP
      MOV CX, [BX] ; CX = Direccion de num2 (1002h)
      ADD BX, 2
      MOV DX, [BX] ; DX = Direccion de num1 (1000h)

      ; Guardar num1
      ; Mover num2 a num1
      ; mover num1 a num2
      MOV BX, DX ; BX = Direccion de num1 (1000h)
      MOV AX, [BX] ; AX = Valor de num1
      MOV BX, CX ; BX = Direccion de num2 (1002h)
      MOV CX, [BX] ; CX = Valor de num2

      MOV [BX], AX ; Guardo valor de num1 en dir de num2
      MOV BX, DX ; BX = Direcciond de num1 (1000h)
      MOV [BX], CX ; Guardo el valor de num2 en dir de num1
      POP DX ; Restauro DX
      POP CX ; Restauro CX
      POP AX ; Restauro AX
      POP BX ; Restauro BX
      RET


      org 2000h
      MOV AX, OFFSET NUM1
      PUSH AX
      MOV AX, OFFSET NUM2
      PUSH AX
      CALL SWAP
      POP AX
      POP AX
      hlt
      end