            .data
x:          .word 10
tabla:      .word 7, 9, 20, 10, 15, 2, 5, 80, 3, 1
cant:       .space 1
long:       .word 10
res:        .space 80
        
            .text
            ld $t0, x($0)
            ld $t1, long($0)
            dadd $gp, $0, $0
            dadd $t2, $0, $0

loop:       dadd $t3, $0, $0    # Guardo en res 0 o 1
            ld $t4, tabla($gp)  # $t4 = pos de la tabla
            slt $t3, $t0, $t4   # $t3 = 1 si $t4 > $t0
            sd $t3, res($gp)    # Guardo en res 0 o 1

            daddi $t1, $t1, -1  # dec $t1
            daddi $gp, $gp, 1   # inc $gp

            beqz $t3, no_mayor
            daddi $t2, $t2, 1   # inc $t2
    
no_mayor:   bnez $t1, loop
            sd $t2, cant($0)    # cant = $t2
            halt

