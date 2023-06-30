org 1000h
NUM1_L DW 0120H  ; 0000 0001 0010 0000
NUM1_H DW 0A04H  ; 0000 1010 0000 0100
NUM2_L DW 0E50H  ; 0000 1110 0101 0000
NUM2_H DW 0A0B4H ; 1010 0000 1011 0100
RESUL_L DW 0
RESUL_H DW 0

org 2000h
MOV AX, NUM1_L ; Muevo la parte baja de num1 a AX
MOV BX, NUM2_L ; Muevo la parte baja de num2 a BX
ADD AX, BX ; Sumo la parte baja de num1 con la parte baja de num2 y se guarda en AX
MOV RESUL_L, AX ; Guardo la parte baja del resultado en RESUL_L

MOV AX, NUM1_H ; Muevo la parte alta de num1 a AX
MOV BX, NUM2_H ; Muevo la parte alta de num2 a BX
ADD AX, BX ; Sumo la parte alta de num1 con la parte alta de num2 y se guarda en AX
MOV RESUL_H, AX ; Guardo la parte alta del resultado en RESUL_H

hlt
end