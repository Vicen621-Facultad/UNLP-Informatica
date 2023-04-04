t = True


def dec_to_bss(binary):
    i = len(binary) - 1
    dec = 0
    for x in binary:
        dec += int(x)*(2**i)
        i -= 1
    return dec


while t:
    binary = input('Ingresa el numero en binario: ')
    mode = input(
        'Ingresa el sistema de representacion, posibles: bss, bcs, ca1, ca2 y ex2: ')
    decimal = 0

    sign = 1 if (binary[0] == '0') else -1

    match mode:
        case 'bss':
            decimal = dec_to_bss(binary)

        case 'bcs':
            binary = binary[1:]
            decimal = dec_to_bss(binary)
            decimal *= sign

        case 'ca1':
            binary = binary[1:]

            ca1_bin = ''.join('1' if c == '0' else '0' for c in binary)
            decimal = dec_to_bss(ca1_bin)
            decimal *= sign

        case 'ca2':
            partition = binary[::-1].partition('1')
            print(f'part 0: {partition[0]}, part 1: {partition[1]}, part 2: {partition[2]}')
            print(f'write until first 1: {partition[0]}{partition[1]}')
            ca2 = f'{partition[0]}{partition[1]}'.join('1' if c == '0' else '0' for c in partition[2])
            print(f'part 2 flipped: '.join('1' if c == '0' else '0' for c in partition[2]))
            print(f'ca2: {ca2}')
            decimal = dec_to_bss(ca2[::-1]) * sign


    print(decimal)
    t = input('Queres ingresar otro numero? \ny/n: ').lower() == 'y'
