        .data
cadena: .asciiz "adbdcdedfdgdhdid" # cadena a analizar
car:    .asciiz "d"                # caracter buscado
cant:   .word 0                    # cantidad de veces que se repite el caracter en la cadena

        .text
        dadd $gp, $0, $0
        lbu $t0, car($0)
        ld $t1, cant($0)
        
loop:   lbu $t2, cadena($gp)       # $t2 = caracter actual
        daddi $gp, $gp, 1          # inc $gp
        
        beqz $t2, fin              # si $t2 es 0, la cadena termino
        bne $t0, $t2, loop         # si los caracteres no son iguales sigo con el loop

        daddi $t1, $t1, 1          # inc $t1
        j loop

fin:    sd $t1, cant($0)
        halt