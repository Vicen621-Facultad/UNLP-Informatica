program ejer1;
const
	DIMF = 50;
type
	ventas = 0..99;
	codigos = 1..15;
	venta = record
		cod: codigos;
		cant: ventas;
		dia: integer;
	end;
	vector = array[1..DIMF] of venta;

procedure leerVenta(var vent: venta);
begin
	readln(vent.dia);
	if (vent.dia <> 0) then begin
		{Genera un numero al azar entre el 0 y 14}
		vent.cod := Random(15) + 1;
		readln(vent.cant);
	end;
end;

procedure agregar(var v: vector; var dimL: integer; vent: venta);
begin
	if (dimL + 1 < DIMF) then begin
		dimL := dimL + 1;
		v[dimL] := vent;
	end;
end;

procedure cargarVector(var v: vector; var dimL: integer);
var
	vent: venta;
begin
	Randomize;
	dimL := 0;
	leerVenta(vent);
	while (vent.dia <> 0) do begin
		agregar(v, dimL, vent);
		leerVenta(vent);
	end;
end;

procedure imprimirVector(v: vector; dimL: integer);
var
	i: integer;
begin
	for i := 1 to dimL do
		writeln(i, ': ', v[i].cod);
end;

procedure seleccion(var v: vector; dimL: integer);
var
	i, j, pos: integer;
	item: venta;
begin
	for i := 1 to dimL - 1 do begin
		pos := i;
		for j := i + 1 to dimL do
			if (v[j].cod < v[pos].cod) then
				pos := j;
		
		item := v[i];
		v[i] := v[pos];
		v[pos] := item;
	end;
end;

procedure eliminar(var v: vector; var dimL: integer; pos, cant: integer);
var
	i: integer;
begin
	if (pos > 0) and (pos <= dimL) then begin
		dimL := dimL - cant;
		for i := pos to dimL do
			v[i] := v[i + cant];
	end;
end;

{Si encuentra el codigo, devuelve la posicion. De lo contrario devolve}
function busqueda(v: vector; dimL, codigo: integer): integer;
var
	pos: integer;
begin
	pos := 1;
	
	while (pos <= dimL) and (v[pos].cod < codigo)do
		pos := pos + 1;
		
	if (pos > dimL) or (v[pos].cod <> codigo) then
		pos := -1;
	
	busqueda := pos;
end;

procedure buscaryEliminar(var v: vector; var dimL: integer; codMin, codMax: integer);
var
	posMin, posMax: integer;
begin
	posMin := busqueda(v, dimL, codMin);
	posMax := busqueda(v, dimL, codMax);
	if (posMin <> -1) and (posMax<> -1) then
		eliminar(v, dimL, posMin, posMax - posMin);
end;

var
	v: vector;
	dimL: integer;
	
begin
	cargarVector(v, dimL);
	imprimirVector(v, dimL);
	writeln('______________');
	
	seleccion(v, dimL);
	imprimirVector(v, dimL);
	writeln('______________');
	
	buscaryEliminar(v, dimL, 2, 7);
	imprimirVector(v, dimL);
end.
