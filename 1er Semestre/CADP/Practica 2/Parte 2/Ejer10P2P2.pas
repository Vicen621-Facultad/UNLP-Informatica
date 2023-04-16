program Ejer10P2P2;

function esVocal(car: char): boolean;
    begin
      esVocal := (car = 'A') or 
        (car = 'E') or 
        (car = 'I') or 
        (car = 'O') or 
        (car = 'U') or
        (car = 'a') or
        (car = 'e') or
        (car = 'i') or
        (car = 'o') or
        (car = 'u');
    end;

function esConsonante(car: char): boolean;
    begin
      esConsonante := not(esVocal(car)) and 
        (((car > 'a') and (car <= 'z')) or 
        ((car > 'A') and (car <= 'Z')));
    end;

procedure sequenceA(var ok: boolean);
    var
        car: char;
    begin
        readln(car);
        while((car <> '$') and (esVocal(car))) do
            readln(car);
        ok := car = '$';
    end;

procedure sequenceB(var ok: boolean);
    var
        car: char;
    begin
        readln(car);
        while((car <> '#') and (esConsonante(car))) do
            readln(car);
        ok := car = '#';
    end;

var
    ok: boolean;

begin
    sequenceA(ok);
    if (ok) then begin
        sequenceB(ok);
        if ok then
            writeln('La sequencia cumple el patron')
        else
            writeln('La sequencia no cumple en B');
    end
    else
        writeln('La secuencia no cumple en A');
end.