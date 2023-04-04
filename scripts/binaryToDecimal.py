t = True
while t:
    binary = input('Ingresa el numero en binario: ')
    mode = input('Ingresa el sistema de representacion, posibles: bss, bcs, ca1, ca2 y ex2: ')
    decimal = 0;


    match mode:
        case 'bss':
            i = len(binary) - 1
            for x in binary:
                decimal += int(x)*(2**i)
                i-=1

        case 'bcs':
            sign = 1 if (binary[0] == '0') else -1
            binary = binary[1:]
            
            i = len(binary) - 1
            for x in binary:
                decimal += int(x)*(2**i)
                i-=1
            decimal *= sign
        
        case 'ca1':
            sign = 1 if (binary[0] == '0') else -1
            binary = binary[1:]
            
            i = len(binary) - 1
            for x in binary:
                x = int(x)
                if (sign == -1):
                    x = 1 - x
                
                decimal += x*(2**i)
                i-=1
            decimal *= sign

    print(decimal)
    t = True if input('Queres ingresar otro numero? \n y/n: ').lower == 'y' else False