program Ejer7P2P2;

procedure sumOfDigits(num: integer; var digits, total: integer);
    var
        digit: integer;
    begin
        total := 0;

        while(num <> 0) do begin
            digit := num MOD 10;
            num := num DIV 10;

            total := total + digit;
            digits := digits + 1;
        end;

        writeln(digits);
    end;

var
    totalDigits, sumTotal, value: integer;

begin
    totalDigits := 0;

    repeat
        readln(value);
        sumOfDigits(value, totalDigits, sumTotal);
    until (sumTotal = 10);

    writeln('El total de digitos procesados es: ', totalDigits);
end.