program ejer6;

procedure decimalToBinary(num: integer);
begin
    if (num < 2) then
        write('Binario: ', num)
    else begin
        decimalToBinary(num DIV 2);
        write(num MOD 2);
    end;
end;

procedure leerNumeros();
var
    num: integer;
begin
    write('Escribe un numero: ');
    readln(num);
    while (num <> 0) do begin
        decimalToBinary(num);
        writeln('');
        write('Escribe un numero: ');
        readln(num);
    end;
end;

begin
    leerNumeros()
end.