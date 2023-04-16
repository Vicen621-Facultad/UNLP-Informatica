program Ejer11P2P2;

procedure sequenceA(var chars: integer; var ok: boolean);
    var
        car: char;
    begin
        chars := 0;
        readln(car);
        while(car <> '$') and (car <> '%') do begin
            readln(car);
            chars := chars + 1;
        end;
        ok := car = '%';
    end;

procedure sequenceB(chars: integer; var ok: boolean);
    var
        car: char;
        arrobas: integer;

    begin
        readln(car);
        if (car = '@') then 
            arrobas := 1
        else 
            arrobas := 0;

        while(car <> '*') and (arrobas < 4) and (chars > 0) do begin
            chars := chars - 1;
            readln(car);
            if (car = '@') then
                arrobas := arrobas + 1;
        
        ok := (car = '*') and (chars = 0);
        end;
    end;

var
    ok: boolean;
    chars: integer;
begin
    sequenceA(chars, ok);
    if (ok) then begin
        sequenceB(chars, ok);
        if (ok) then
            writeln('La sequencia cumple')
        else
            writeln('La sequencia no cumple en B');
    end
    else
        writeln('La sequencia no cumple en A')
end.