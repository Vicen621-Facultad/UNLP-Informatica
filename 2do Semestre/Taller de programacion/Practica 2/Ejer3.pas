program ejer3;
type
	lista = ^nodo;
	nodo = record
		dato: integer;
		sig: lista;
	end;
	
procedure agregarAdelante(dato: integer; var l: lista);
var
	nue: lista;
begin
	new(nue);
	nue^.dato := dato;
	nue^.sig := l;
	l := nue;
end;

procedure generarLista(var l: lista);
var
	num: integer;
begin
	num := Random(100);
	if (num <> 0) then begin
		agregarAdelante(num, l);
		generarLista(l);
	end;
end;

function minimoLista(l: lista): integer;
var
	min: integer;
begin
	if (l = nil) then
		minimoLista := 100
	else begin
		min := minimoLista(l^.sig);
		if (l^.dato < min) then
			min := l^.dato;
			
		minimoLista := min;
	end;
end;

function maximoLista(l: lista): integer;
var
	max: integer;
begin
	if (l = nil) then
		maximoLista := 0
	else begin
		max := maximoLista(l^.sig);
		if (l^.dato > max) then
			max := l^.dato;
			
		maximoLista := max;
	end;
end;

function buscar(valor: integer; l: lista): boolean;
begin
	if (l <> nil) then begin
		if (valor = l^.dato) then
			buscar := true
		else
			buscar := buscar(valor, l^.sig);
	end
	else
		buscar := false;
end;

procedure imprimirLista(l: lista);
begin
	while (l <> nil) do begin
		writeln(l^.dato);
		l := l^.sig;
	end;
end;

var
	l: lista;
begin
	Randomize;
	generarLista(l);
    writeln('------- LISTA -------');
	imprimirLista(l);
	writeln('Minimo de la lista: ', minimoLista(l));
	writeln('Maximo de la lista: ', maximoLista(l));
	writeln('Valor 50 en lista?: ', buscar(50, l));
end.
