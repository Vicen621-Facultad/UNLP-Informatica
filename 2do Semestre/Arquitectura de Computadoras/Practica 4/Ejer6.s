            .data
A:          .word 20
B:          .word 20
C:          .word 10
D:          .space 1

            .text
            ld $t0, A($0) ; $t0 = A
            ld $t1, B($0) ; $t1 = B
            ld $t2, c($0) ; $t2 = C
    
            beq $t0, $t1, t0_eq_t1
            beq $t1, $t2, two_equals
            bne $t0, $t2, final ; Si no son iguales, ninguno de los 3 son iguales
    
two_equals: daddi $t3, $0, 2
            j final ; No comparo $t0 y $t2 ya que $t1 y $t0 son diferentes

t0_eq_t1:   daddi $t3, $0, 2
            bne $t0, $t2, final
            daddi $t3, $t3, 1 ; Si no salta, los 3 numeros son iguales

final:      sd $t3, D($0) ; D = $t3
