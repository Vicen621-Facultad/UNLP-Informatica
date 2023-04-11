program Ejer5P2P2;

function isDouble(numA, numB: integer): boolean;
    begin
        isDouble := numA * 2 = numB
    end;

var
    numA, numB, readed, doubles: integer;

begin
    readed := 0;
    doubles := 0;

    readln(numA);
    readln(numB);

    while(numA <> 0) or (numB <> 0) do begin
        if (isDouble(numA, numB)) then
          doubles := doubles + 1;
        
        readed := readed + 1;

        readln(numA);
        readln(numB);
    end;

    writeln('Pares leidos: ', readed);
    writeln('Pares dobles: ', doubles);
end.
