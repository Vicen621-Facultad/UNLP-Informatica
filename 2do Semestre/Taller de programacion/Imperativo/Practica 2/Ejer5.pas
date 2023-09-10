program ejer5;
const
    DIMF = 20;
type
    indice = -1..DIMF;
    vector = array[1..DIMF] of integer;

procedure agregarVector(num: integer; var v: vector; var dimL: integer);
begin
	if (dimL + 1 <= DIMF) then begin
		dimL := dimL + 1;
		v[dimL] := num;
	end;
end;

procedure imprimirVector(v: vector; dimL: integer);
var
    i: integer;
begin
    for i := 1 to dimL do
        writeln(i, ': ', v[i]);
end;
	
procedure generarVector(var v: vector; var dimL: integer);
var
	num: integer;
begin
	num := Random(100);
	if (num <> 0) then begin
        agregarVector(num, v, dimL);
		generarVector(v, dimL);
	end
end;

procedure insercion(var v: vector; dimL: integer);
var
	i, j: indice;
	actual: integer;
begin
	for i := 2 to dimL do begin
		actual := v[i];
		j := i - 1;
		while (j > 0) and (v[j] > actual) do begin
			v[j + 1] := v[j];
			j := j - 1;
		end;
		v[j + 1] := actual;
	end;
end;

procedure busquedaDicotomica(v: vector; ini, fin: indice; dato: integer; var pos: indice);
var
    medio: indice;
begin
    medio := (ini + fin) DIV 2;

    while (fin >= ini) and (dato <> v[medio]) do begin
        if (dato > v[medio]) then
            ini := medio + 1
        else
            fin := medio - 1;
        
        medio := (ini + fin) DIV 2;
    end;

    if (fin >= ini) and (dato = v[medio]) then
        pos := medio
    else
        pos := -1;
end;

var
	v: vector;
	dimL: integer;
    pos: indice;

begin
	Randomize;
    dimL := 0;
	generarVector(v, dimL);
    writeln('----------- VECTOR -----------');
    imprimirVector(v, dimL);
    insercion(v, dimL);
    writeln('------- VECTOR ORDENADO -------');
    imprimirVector(v, dimL);
    busquedaDicotomica(v, 1, dimL, 10, pos);
    writeln('Posicion del 10 en el vector: ', pos);
end.