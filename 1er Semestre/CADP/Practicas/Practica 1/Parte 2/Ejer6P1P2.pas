PROGRAM Ejer6P1P2;

TYPE
    code = 0..200;

VAR
    codigo, minimo1Code, minimo2Code: code;
    minimo1, minimo2, mas16Par, precio, i: integer;

BEGIN
    minimo1 := 32767;
    minimo2 := 32767;

    mas16Par := 0;

    {Inicializo la variable para que al 
    pasarla a minimo2Code por primera 
    vez en la linea 26 no de error}
    minimo1Code := 0;

    for i := 1 to 200 do BEGIN
        readln(codigo);
        readln(precio);

        if (precio < minimo1) then BEGIN
            minimo2 := minimo1;
            minimo2Code := minimo1Code;

            minimo1 := precio;
            minimo1Code := codigo;
        END
        else if (precio < minimo2) then BEGIN
            minimo2 := precio;
            minimo2Code := codigo;
        END;
        
        if (precio > 16) and (codigo MOD 2 = 0) then
            mas16Par := mas16Par + 1;
    END;
    
    writeln('Productos mas baratos: ', minimo1Code, ' ', minimo2Code);
    writeln('Productos con precio mayor a 16 con codigo par: ', mas16Par);
END.