            .data
CONTROL:    .word32 0x10000
DATA:       .word32 0x10008
            .asciiz "ERROR"
TABLA:      .asciiz "CERO"
            .asciiz "UNO",
            .asciiz "DOS",
            .asciiz "TRES",
            .asciiz "CUATRO",
            .asciiz "CINCO",
            .asciiz "SEIS",
            .asciiz "SIETE",
            .asciiz "OCHO",
            .asciiz "NUEVE"

            .text
            lwu $s0, DATA($zero)    ; Carga el valor 0x10000 en $s0
            lwu $s1, CONTROL($zero) ; Carga el valor 0x10008 en $s1

            jal ingreso
            dadd $a0, $0, $v0       ; Guarda el valor retornado por ingreso en $a0
            daddi $a1, $0, TABLA    ; Carga la dir de tabla en $a1
            jal muestra
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

; ==== muestra ====
; Recibe en $a0, el valor a mostrar
; Recibe en $a1, la dir de inicio de la tabla
; Muestra en pantalla el numero escrito
muestra:    daddi $t8, $0, 8
            dmul $t0, $a0, $t   8        ; Multiplico a0 * 8 para encontrar la pos en la tabla
            dadd $t1, $a1, $t0      ; le aplico el desplazamiento a la tabla y guardo la dir en $t1
            sd $t1, 0($s0)          ; Paso el valor de inicio de la tabla a DATA
            daddi $t0, $0, 4
            sd $t0, 0($s1)          ; Mando 4 a CONTROL
            jr $ra