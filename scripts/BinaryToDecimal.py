import os


def clear():
    os.system('cls' if os.name == 'nt' else 'clear')


def run():
    print('Script hecho por: Vicen621\n')

    loop = True

    systems = {
        'bss': 'Binario Sin Signo',
        'bcs': 'Binario Con Signo',
        'ca1': 'Complemento a 1',
        'ca2': 'Complemento a 2',
        'ex2': 'Exceso'
    }

    options = ['bss', 'bcs', 'ca1', 'ca2', 'ex2']

    while loop:
        binary = input('Ingresa el numero en binario: ')
        system = ''
        input_message = "\nElige el sistema de representacion:\n"

        for index, item in enumerate(options):
            input_message += f'{index+1}) {item}\n'

        input_message += 'Tu elección: '

        while system.lower() not in options:
            system = input(input_message)

        decimal = 0
        binary_print = binary

        sign = 1 if (binary[0] == '0') else -1

        match system:
            case 'bss':
                decimal = int(binary, 2)

            case 'bcs':
                binary = binary[1:]
                decimal = int(binary, 2)
                decimal *= sign

            case 'ca1':
                binary = binary[1:]

                ca1_bin = ''.join('1' if c == '0' else '0' for c in binary)
                decimal = int(ca1_bin, 2)
                decimal *= sign

            case 'ca2':
                partition = binary[::-1].partition('1')
                flip = ''.join('1' if c == '0' else '0' for c in partition[2])
                ca2 = f'{partition[0]}{partition[1]}{flip}'
                decimal = int(ca2[::-1] if sign == -1 else binary, 2) * sign

            case 'ex2':
                EXCESS = 2**(len(binary)-1)
                decimal = int(binary, 2) - EXCESS

            case other:
                print('Sistema no reconocido, por favor ingrese un sistema valido')
                continue

        print(
            f'\n{binary_print}₂ interpretado en {systems[system]} es: {decimal}₁₀ \n')
        loop = input('Queres ingresar otro numero? \ns/n: ').lower() == 's'
        clear()


if __name__ == '__main__':
    run()
