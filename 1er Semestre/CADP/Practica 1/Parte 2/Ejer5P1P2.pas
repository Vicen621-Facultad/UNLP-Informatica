program Ejer5P1P2;

var
    maximo, minimo, total, valor: integer;

BEGIN
    maximo := -32767;
    minimo := 32767;

    total := 0;

    repeat
        readln(valor);

        if (valor < minimo) then
            minimo := valor;
        
        if valor > maximo then
            maximo := valor;
        
        total := total + valor;
    until valor = 100;

    writeln('Maximo: ', maximo);
    writeln('Minimo: ', minimo);
    writeln('Total: ', total);
END.