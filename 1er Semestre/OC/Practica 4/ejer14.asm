org 1000h
NUM1_L DW 0120H  ; 0000 0001 0010 0000
NUM1_H DW 0A04H  ; 0000 1010 0000 0100
NUM2_L DW 0E50H  ; 0000 1110 0101 0000
NUM2_H DW 0A0B4H ; 1010 0000 1011 0100
RESUL_L DW 0
RESUL_H DW 0

org 2000h
MOV AX, NUM1_L ; Muevo la parte baja de num1 a AX
MOV CX, NUM1_H ; Muevo la parte alta de num1 a CX
MOV BX, NUM2_L ; Muevo la parte baja de num2 a BX
MOV DX, NUM2_H ; Muevo la parte alta de num2 a DX

ADD AX, BX ; Sumo las partes bajas y se guardan en AX
ADC CX, DX ; Sumo las partes altas + el carry de las partes bajas

MOV RESUL_L, AX ; Guardo la parte baja del resultado en RESUL_L
MOV RESUL_H, CX ; Guardo la parte alta del resultado en RESUL_H
hlt
end