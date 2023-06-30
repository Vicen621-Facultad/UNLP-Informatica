org 1000h ; Memoria de datos
MANTISA DB 10011101b
EXPONENTE DB 2

org 3000h ; Memoria de instrucciones
DISMINUIR: DEC AL ; Decremento el exponente
ADD AH, AH ; Multiplicar x2 es como sumar 2 veces lo mismo

JC CARRY; Si hay carry es porque no se puede desplazar la mantisa
MOV BL, 00h ; Ya que no hay carry, devuelvo 00 en BL
JMP FIN

CARRY: MOV BL, 0FFh ; Si hay carry devuelvo FF en BL
FIN: RET ; Vuelvo al programa principal

org 2000h ; Programa principal
MOV AL, EXPONENTE ; Muevo el exponente a AL
MOV AH, MANTISA ; Muevo la mantisa a AH
CALL DISMINUIR ; Llamo a la subrutina DISMINUIR
hlt
end