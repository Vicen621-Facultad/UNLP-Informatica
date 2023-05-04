program Ejer10P4;
const
    dimF = 300;
type
    vector = array[1..dimF] of real;

procedure readVector(var v: vector; var dimL: integer);
var
    val: real;
begin
    dimL := 0;
    readln(val);
    while (val <> 0) and (dimL < dimF) do begin
        dimL := dimL + 1;
        v[dimL] := val;
        readln(val);
    end;    
end;

procedure increment(var v: vector; dimL: integer; inc: real);
var
    i: integer;
begin
    for i := 1 to dimL do
        v[i] := v[i] * inc;
end;

function avg(v: vector; dimL: integer): real;
var
    i: integer;
    cant: real;
begin
    cant := 0;
    for i := 1 to dimL do
        cant := cant + v[i];
    
    avg := cant / dimL;
end;

var
    v: vector;
    dimL: integer;

begin
    readVector(v, dimL);
    increment(v, dimL, 1.15);
    writeln('Valor promedio de los sueldos: ', avg(v, dimL));
end.