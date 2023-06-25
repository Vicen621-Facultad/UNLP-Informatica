ORG 1000h
FRASE db "Organización y la Computación"
FIN db ?
a db "a"
c db "c"
TOTAL db 0

ORG 2000h
MOV AH, TOTAL ; Llevo la cuenta de cuantas "ac" hay
MOV AL, a ; Guardo el codigo ascii de "a" en AL
MOV CL, c ; Guardo el codigo ascii de "c" en CL

MOV CH, OFFSET FIN - OFFSET FIN ; Guardo el largo de la frase en CH
MOV BX, OFFSET FRASE ; Guardo la dir de memoria de inicio de la frase en BX para recorrerla

CARGAR: MOV DL, [BX] ; Muevo el caracter actual a DL
INC BX ; Paso al siguiente caracter

CMP DL, AL ; Si el caracter es "a" salto a HAY_A
JZ HAY_A
JMP FINAL ; Si no hay "c" paso al siguiente caracter

HAY_A: CMP [BX], CL ; Si el caracter actual es "c" salto a HAY_C
JZ HAY_C
JMP FINAL ; Si no hay "c" paso al siguiente caracter

HAY_C: INC AH ; Ya que hay una a seguida de una c, incremento el contador

FINAL: DEC CH ; Decremento CH ya que pase al siguiente caracter
JNZ CARGAR

MOV TOTAL, AH
HLT
END