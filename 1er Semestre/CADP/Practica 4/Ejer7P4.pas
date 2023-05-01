program Ejer7P4;
// todo: Ir sacando digito a digito y sumarle 1 a la posicision de ese digito en el array
const
    dimF = 9;
type
    vector = array[0..dimF] of integer;

procedure initializeVector(var v: vector);
var
    i: integer;
begin
    for i := 0 to dimF do begin
        v[i] := 0;
    end;
end;

procedure procesDigit(var v: vector; number: integer);
var
    digit: integer;
begin
    while (number <> 0) do begin
        digit := number MOD 10;
        number := number DIV 10;

        v[digit] := v[digit] + 1;
    end;
end;

function posMax(v: vector): integer;
var
    i, max, pos: integer;
begin
    max := -1;
    for i := 0 to dimF do begin
        if (v[i] > max) then begin
            max := v[i];
            pos := i;
        end;
    end;
    posMax := pos;
end;

procedure printData(v: vector);
var
    i: integer;
begin
    for i := 0 to dimF do begin
        if (v[i] > 0) then
            writeln('Numero ', i, ': ', v[i], ' veces');
    end;

    writeln('El digito mas leido fue el ', posMax(v));
    write('Los digitos que no tuvieron ocurrencias son: ');
	for i := 0 to 9 do begin
		if(v[i] = 0) then
			write(i, ', ');
	end;
end;

var
    digits: vector;
    number: integer;

begin
    initializeVector(digits);

    readln(number);
    while (number <> -1) do begin
        procesDigit(digits, number);
        readln(number);
    end;
    
    printData(digits);
end.