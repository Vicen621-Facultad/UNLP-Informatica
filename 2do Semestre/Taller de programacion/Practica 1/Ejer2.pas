program ejer2;
const
    DIMF = 300;
type
    oficina = record
        cod, dni: integer;
        valor: real;
    end;

    vector = array[1..DIMF] of oficina;

procedure leerOfcina(var ofi: oficina);
begin
    readln(ofi.cod);
    if (ofi.cod <> -1) then begin
        ofi.dni := Random(1000);
        ofi.valor := random(1000)
    end;
end;

procedure agregar(var v: vector; var dimL: integer; ofi: oficina);
begin
    if (dimL + 1 < DIMF) then begin
        dimL := dimL + 1;
        v[dimL] := ofi;
    end;
end;

procedure cargarVector(var v: vector; var dimL: integer);
var
    ofi: oficina;
begin
    dimL := 0;
	leerOfcina(ofi);
	while (ofi.cod <> -1) do begin
		agregar(v, dimL, ofi);
		leerOfcina(ofi);
	end;
end;

procedure insercion(var v: vector; dimL: integer);
var
	i, j: integer;
	actual: oficina;
begin
	for i := 2 to dimL do begin
		actual := v[i];
		j := i - 1;
		while (j > 0) and (v[j].cod > actual.cod) do begin
			v[j + 1] := v[j];
			j := j - 1;
		end;
		v[j + 1] := actual;
	end;
end;

procedure seleccion(var v: vector; dimL: integer);
var
	i, j, pos: integer;
	item: oficina;
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

procedure imprimirVector(v: vector; dimL: integer);
var
	i: integer;
begin
	for i := 1 to dimL do
		writeln(i, ': ', v[i].cod);
end;

var
    v: vector;
    dimL: integer;
begin
    cargarVector(v, dimL);
    imprimirVector(v, dimL);
    writeln('- - - - - - - - - - - - - - - - -');

    insercion(v, dimL);
    imprimirVector(v, dimL);

    seleccion(v, dimL);
    imprimirVector(v, dimL);
end.