t = True

def dec_to_bss(binary):
    i = len(binary) - 1
    dec = 0
    for x in binary:
        dec += int(x)*(2**i)
        i-=1
    return dec;

while t:
    binary = input('Ingresa el numero en binario: ')
    mode = input('Ingresa el sistema de representacion, posibles: bss, bcs, ca1, ca2 y ex2: ')
    decimal = 0;

    sign = 1 if (binary[0] == '0') else -1

    match mode:
        case 'bss':
            decimal = dec_to_bss(binary);
        
        case 'bcs':
            binary = binary[1:]
            decimal = dec_to_bss(binary)
            decimal *= sign
        
        case 'ca1':
            binary = binary[1:]
            
            i = len(binary) - 1
            for x in binary:
                
                x = 1 - x
                
                decimal += x*(2**i)
                i-=1
            decimal *= sign
        
        case 'ca2':
            print()

    print(decimal)
    t = input('Queres ingresar otro numero? \ny/n: ').lower() == 'y'