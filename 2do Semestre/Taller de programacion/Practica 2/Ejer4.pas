program ejer4;
type
	vector = array[1..20] of integer;
	
procedure agregarVector(num: integer; var v: vector; var dimL: integer);
begin
	if (dimL + 1 <= 20) then begin
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

procedure maximoVector(v: vector; dimL: integer): integer;
var
	max: integer;
begin
	if (dimL = 0) then
		maximoLista := 0
	else begin
		max := maximoLista(dimL - 1);
		if (v[dimL] > max) then
			max := v[dimL];
			
		maximoLista := max;
	end;
end;
	
procedure minimoVector(v: vector; dimL: integer): integer;
var
	min: integer;
begin
	if (dimL = 0) then
		minimoVector := 0
	else begin
		min := minimoVector(dimL - 1);
		if (v[dimL] > max) then
			min := v[dimL];
			
		minimoVector := min;
	end;
end;
	
begin
	Randomize;
	generarVector(v, dimL);
end.
