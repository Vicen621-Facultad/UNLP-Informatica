            .data
CONTROL:    .word32 0x10000
DATA:       .word32 0x10008

            .code
            lwu $s0, DATA($zero)    ; Carga el valor 0x10000 en $s0
            lwu $s1, CONTROL($zero) ; Carga el valor 0x10008 en $s1

            jal ingreso
            dadd $s2, $0, $v0       ; Guardo el primer numero es $s2
            jal ingreso
            dadd $a0, $0, $s2       ; Carga el primer numero en $a0
            dadd $a1, $0, $v0       ; Carga el segundo numero en $a1
            jal resultado
            halt

; ==== ingreso ====
; Lee un numero de teclado
; Devuelvue el numero en caso de ser de un digito
; En caso contrario devuelve -1
ingreso:    daddi $t0, $0, 8
            sd $t0, 0($s1)          ; Mando 8 a CONTROL
            ld $t1, 0($s0)          ; Carga el valor de DATA en $t1
            slti $t2, $t1, 10       ; t2 = 1 si $t1 < 10
            bnez $t2, un_dig
            daddi $v0, $0, -1       ; si el num ingresado es >= 10 devuelvo -1
            j fin_ing

un_dig:     dadd $v0, $0, $t1
fin_ing:    jr $ra

; ==== resultado ====
; Recibe en $a0 y $a1 los numeros a sumar
; Muestra en pantalla el resultado numerico de la suma
resultado:  dadd $t0, $a0, $a1      ; hago la suma y la guardo en $t0
            sd $t0, 0($s0)          ; Guardo el resultado en DATA
            daddi $t1, $0, 2
            sd $t1, 0($s1)          ; Mando 2 a CONTROL
            jr $ra