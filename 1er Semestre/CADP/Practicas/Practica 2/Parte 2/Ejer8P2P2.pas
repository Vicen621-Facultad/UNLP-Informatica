program Ejer8P2P2;

function sumarDigitos(num: integer): integer;
    var
        digito, total: integer;
    begin
        total := 0;

        while(num <> 0) do begin
            digito := num MOD 10;
            num := num DIV 10;

            total := total + digito;
        end;

        sumarDigitos := total;
    end;

function obtenerPares(num: integer): integer;
    var
        digitos, currentDigit: integer;
    begin
        digitos := 0;

        while (num <> 0) do begin
            currentDigit := num MOD 10;
            if (currentDigit MOD 2 = 0) then 
                digitos := digitos * 10 + currentDigit;
            
            num := num DIV 10;
        end;

        obtenerPares := digitos;
    end;

function obtenerImpares(num: integer): integer;
    var
        total, currentDigit: integer;
    begin
		total := 0;
        while (num <> 0) do begin
            currentDigit := num MOD 10;
            if (currentDigit MOD 2 <> 0) then 
                total := total + 1;
            
            num := num DIV 10;
        end;

        obtenerImpares := total;
    end;

var
    value: integer;

begin
    readln(value);
    

    while(value <> 123456) do begin {Compiler warning: Comparision might be always true due tu range of constant and expressions}
        writeln('Suma de los digitos del numero ingresado: ', sumarDigitos(obtenerPares(value)));
        writeln('Cantidad de digitos impares: ', obtenerImpares(value));
        
        readln(value);
    end;
end.
