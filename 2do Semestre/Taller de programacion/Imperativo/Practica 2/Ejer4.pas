program ejer4;
const
	DimF = 20;
type
	vector = array[1..DimF] of integer;
	
procedure agregarVector(num: integer; var v: vector; var dimL: integer);
begin
	if (dimL + 1 <= DimF) then begin
		dimL := dimL + 1;
		v[dimL] := num;
	end;
end;
	
procedure generarVector(var v: vector; var dimL: integer);
var
	num: integer;
begin
	num := Random(100);
	if (num <> 0) then begin
		agregarVector(num, v, dimL);
		generarVector(v, dimL);
	end;
end;

procedure imprimirVector(v: vector; dimL: integer);
var
    i: integer;
begin
    for i := 1 to dimL do
        writeln(i, ': ', v[i]);
end;

function maximoVector(v: vector; dimL: integer): integer;
var
	max: integer;
begin
	if (dimL = 0) then
		maximoVector := 0
	else begin
		max := maximoVector(v, dimL - 1);
		if (v[dimL] > max) then
			max := v[dimL];
			
		maximoVector := max;
	end;
end;
	
function minimoVector(v: vector; dimL: integer): integer;
var
	min: integer;
begin
	if (dimL = 0) then
		minimoVector := 100
	else begin
		min := minimoVector(v, dimL - 1);
		if (v[dimL] < min) then
			min := v[dimL];
			
		minimoVector := min;
	end;
end;

function sumarVector(v: vector; dimL: integer): integer;
var
	total: integer;
begin
	if (dimL = 0) then
		total := 0
	else
		total := v[dimL] + sumarVector(v, dimL - 1);
	
	sumarVector := total;
end;

var
	v: vector;
	dimL: integer;

begin
	Randomize;
	generarVector(v, dimL);
	writeln('------- VECTOR ------- ');
	imprimirVector(v, dimL);
	writeln('Minimo del vector: ', minimoVector(v, dimL));
	writeln('Maximo del vector: ', maximoVector(v, dimL));
	writeln('Suma de los valores: ', sumarVector(v, dimL))
end.
