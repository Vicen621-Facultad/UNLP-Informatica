program ejer1;

const
	dimF = 300;

type
	oficina = record
		cod, dni: integer;
		valor: real;
	end;
	
	vector = array[1..dimF] of oficina;
	
procedure leerOficina(var o: oficina);
begin
	write('Ingrese codigo de oficina: ');
	readln(o.cod);
	if (o.cod <> -1) then begin
		o.dni := Random(10) + 1;
		writeln('Numero de DNI: ', o.dni);
		// Genero un numero real entre el 0 y el 100
		o.valor := Random * 100;
		writeln('Valor de la expensa: ', o.valor:3:2);
		writeln('');
	end;
end;
	
procedure agregarVector(var v: vector; var dimL: integer; o: oficina);
begin
	if (dimL + 1 <= dimF) then begin
		dimL := dimL + 1;
		v[dimL] := o;
	end;
end;

procedure cargarVector(var v: vector; var dimL: integer);
var
	o: oficina;
begin
	leerOficina(o);
	while (o.cod <> -1) do begin
		agregarVector(v, dimL, o);
		leerOficina(o);
	end;
end;

procedure ordenarVector(var v: vector; dimL: integer);
var
	i, j, pos: integer;
	item: oficina;
begin
	for i := 1 to dimL - 1 do begin
		pos := i;
		for j := i + 1 to dimL do
			if (v[j].cod < v[pos].cod) then
				pos := j;
		
		item := v[pos];
		v[pos] := v[i];
		v[i] := item;
	end;
end;

function busquedaDicotomica(v: vector; dimL, dni: integer): integer;
var
	pri, ult, medio: integer;
begin
	pri := 1;
	ult := dimL;
	medio := (pri + ult) DIV 2;
	
	while (pri <= ult) and (dni <> v[medio].dni) do begin
		if (dni < v[medio].dni) then
			ult := medio - 1
		else
			pri := medio + 1;
		medio := (pri + ult) DIV 2;
	end;
	
	if (pri <= ult) and (dni = v[medio].dni) then
		busquedaDicotomica := medio
	else
		busquedaDicotomica := 0;
end;

procedure imprimirVector(v: vector; dimL: integer);
var
	i: integer;
begin
	for i := 1 to dimL do
		writeln(i, ': Codigo: ', v[i].cod, 
			'  Expensa: ', v[i].valor:3:2,
			'  DNI: ', v[i].dni);
end;

function totalExpensas(v: vector; dimL: integer): real;
begin
	if (dimL < 1) then
		totalExpensas := 0
	else
		totalExpensas := v[dimL].valor + totalExpensas(v, dimL -1);
end;

var
	v: vector;
	dimL, busqueda: integer;

begin
	Randomize;

	cargarVector(v, dimL);
	writeln('---------- Vector desordenado ----------');
	imprimirVector(v, dimL);
	writeln('');
	
	ordenarVector(v, dimL);
	writeln('---------- Vector Ordenado ----------');
	imprimirVector(v, dimL);
	writeln('');
	
	busqueda := busquedaDicotomica(v, dimL, 10);
	if (busqueda <> 0) then
		writeln('El DNI 10 se encuentra en la posicion: ', busqueda)
	else
		writeln('El DNI 10 no se encuentra en el vector');
		
	writeln('Monto total de expensas: ', totalExpensas(v, dimL):3:2);
end.
