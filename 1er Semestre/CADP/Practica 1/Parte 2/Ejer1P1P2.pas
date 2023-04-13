program Ejer1P1P2;

var
    total, mayores5, i, value: integer;

BEGIN
    total := 0;
    mayores5 := 0;
    for i := 1 to 10 do BEGIN
        readln(value);
        total := total + value;
        if value > 5 then
            mayores5 := mayores5 + 1;
    END;
    writeln('Total: ', total);
    writeln('Mayores a 5: ', mayores5)
END.