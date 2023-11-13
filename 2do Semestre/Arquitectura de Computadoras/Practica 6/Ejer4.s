            .data
CONTROL:    .word 0x10000
DATA:       .word 0x10008
clave:      .asciiz "HoLa"
texto:      .space 4
error:      .asciiz "ERROR\n"
bien:       .asciiz "Bienvenido\n"
ing_car:    .asciiz "Ingrese la contrasena: "

            .code
            lwu $s0, DATA($0)       ; s0 = OFFSET DATA
            lwu $s1, CONTROL($0)    ; s1 = OFFSET CONTROL
            daddi $sp, $0, 0x400    

loop:       daddi $a0, $0, texto
            jal leer
            daddi $a0, $0, texto
            daddi $a1, $0, clave
            daddi $a2, $0, error
            daddi $a3, $0, bien
            jal respuesta
            beqz $v0, loop           ; Si no es 0, vuelvo a pedir la contraseña
            halt

leer:       daddi $sp, $sp, -24
            sd $s2, 0($sp)          ; apilo s2
            sd $ra, 8($sp)          ; apilo ra
            sd $s3, 16($sp)         ; apilo s3

            dadd $s2, $0, $a0       ; s2 = guardo la direccion de inicio en s2
            daddi $s3, $0, 4        ; s3 = contador para saber cuantas letras voy leidas

            daddi $t0, $0, ing_car
            daddi $t1, $0, 4
            sd $t0, 0($s0)
            sd $t1, 0($s1)

loopLeer:   dadd $a0, $0, $s2       ; a0 = posicion donde guardar el caracter
            jal char
            daddi $s2, $s2, 1       ; Paso a la siguiente posicion
            daddi $s3, $s3, -1      ; Decremento el contador
            bnez $s3, loopLeer

            ld $s2, 0($sp)
            ld $ra, 8($sp)
            ld $s3, 16($sp)
            daddi $sp, $sp, 24
            jr $ra

char:       daddi $t0, $0, 9

            sd $t0, 0($s1)          ; leo caracter
            lbu $t1, 0($s0)         ; Guardo caracter en t1
            sb $t1, 0($a0)          ; Guardo el caracter en la posicion pasada en el parametro a0
            jr $ra

; Devuelvo 0 si las cadenas difieren
; Devuelvo 1 si las cadenas son iguales
respuesta:  lbu $t0, 0($a0)         ; t0 = car de texto
            lbu $t1, 0 ($a1)        ; t1 = car de clave

            beqz $t1, rta_bien      ; Si t1 = 0 terminó la cadena

            daddi $a0, $a0, 1   
            daddi $a1, $a1, 1

            beq $t0, $t1, respuesta ; Si son iguales sigo comparando 

            sd $a2, 0($s0)          ; DATA = Offset error
            daddi $t2, $0, 4
            sd $t2, 0($s1)          ; CONTROL = 4
            daddi $v0, $0, 0        ; Retorno 0
            jr $ra

rta_bien:   sd $a3, 0($s0)          ; DATA = Offset bien
            daddi $t2, $0, 4
            sd $t2, 0($s1)          ; control = 4
            daddi $v0, $0, 1        ; Retorno 1
            jr $ra
