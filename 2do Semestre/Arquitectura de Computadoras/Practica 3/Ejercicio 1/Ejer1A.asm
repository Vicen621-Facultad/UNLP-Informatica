PB equ 31h
CB equ 33h

ORG 2000h
MOV AL, 00000000b ; Inicializo CB como salida
OUT CB, AL
MOV AL, 11000011b ; Muevo los valores de las leds a PB
OUT PB, AL
INT 0
END