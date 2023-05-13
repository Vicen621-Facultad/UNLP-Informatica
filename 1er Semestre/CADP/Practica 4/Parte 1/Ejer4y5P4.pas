program Ejer4y5P4;
const
    dimF = 100;
type
    vector = array[1..dimF] of integer;

function getPos(v: vector; dimL, x: integer): integer;
begin
    while(dimL <> 0) and (v[dimL] <> x) do
        dimL := dimL -1;
    
    if (dimL = 0) then
        dimL := -1;
    getPos := dimL;
end;

procedure changeXY(var v: vector; x,y: integer);
var
    i: integer;
begin
    i := v[x];
    v[x] := v[y];
    v[y] := i;
end;

function sumVector(v: vector; dimL: integer): integer;
var
    i, sum: integer;
begin
    sum := 0;
    for i := 1 to dimL do
        sum := sum + v[i];
    sumVector := sum;
end;

function vectorAvg(v: vector; dimL: integer): real;
begin
    vectorAvg := sumVector(v, dimL) / dimL;
end;

procedure minAndMaxPos(v: vector; dimL: integer; var posMin, posMax: integer);
var
    i, max, min: integer;
begin
    max := -999;
    min := 999;
    for i := 1 to dimL do begin
        if (v[i] > max) then begin
            max := v[i];
            posMax := i;
        end;
        if (v[i] < min) then begin
            min := v[i];
            posMin := i;
        end;
    end;
end;

procedure readVector(var v: vector; var dimL: integer);
var
    val: integer;
begin
    dimL := 0;
    readln(val);
    while (val <> 0) and (dimL < dimF) do begin
        dimL := dimL + 1;
        v[dimL] := val;
        readln(val);
    end;
end;

var
    v: vector;
    posMax, posMin, dimL: integer;

begin
    readVector(v, dimL);
    minAndMaxPos(v, dimL, posMin, posMax);
    changeXY(v, posMax, posMin);
    writeln('El elemento maximo ', v[posMin], ' que se encontraba en la posicion ', posMax, ' fue intercambiado con el elemento minimo ', v[posMax], ' que se encontraba en la posicion ', posMin);
end.