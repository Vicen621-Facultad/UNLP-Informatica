program ejer4;
const
    DIMF = 30;
type
    rubros = 1..8;
    producto = record
        cod: integer;
        rubro: rubros;
        precio: real;
    end;

    lista = ^nodo;
    nodo = record
        dato: producto;
        sig: lista;
    end;

    vector = array[1..DIMF] of producto;

procedure leerProducto(var p: producto);
begin
    Writeln('Ingrese el precio: ');
    readln(p.precio);
    if (p.precio <> 0) then begin
        write('Rubro: ');
        p.rubro := Random(8) + 1;
        writeln(p.rubro);

        write('Codigo de producto: ');
        p.cod := Random(100) + 1;
        writeln(p.cod);
    end;
end;

procedure insertarOrdenado(var l: lista; prod: producto);
var
    act, ant, nue: lista;
begin
    new(nue);
    nue^.dato := prod;

    act := l;
    ant := l;

    // No se como ordenar por 2 condiciones a la vez
    while (act <> nil) and (act^.dato.rubro <> prod.rubro) do begin
        ant := act;
        act := act^.sig;
        {while (act <> nil) and (act^.dato.rubro <> prod.rubro) and (act^.dato.cod > prod.cod) do begin
            ant := act;
            act := act^.sig;
        end;}
    end;

    if (act = ant) then
        l := nue
    else
        ant^.sig := nue;
    
    nue^.sig := act;
end;

procedure cargarLista(var l: lista);
var
    p: producto;
begin
    l := nil;

    leerProducto(p);
    while (p.precio <> 0) do begin
        insertarOrdenado(l, p);
        leerProducto(p);
    end;
end;

procedure imprimirLista(l: lista);
begin
    while (l <> nil) do begin
		write('Rubro: ', l^.dato.rubro);
		writeln('    Codigo: ', l^.dato.cod);
        l := l^.sig;
    end;
end;

procedure imprimirVector(v: vector; dimL: integer);
var
    i: integer;
begin
    for i := 1 to dimL do begin
        write(i, ': ');
		write('Rubro: ', v[i].rubro);
		writeln('    Precio: ', v[i].precio:2:2);
    end;
end;

procedure agregarVector(var v: vector; var dimL: integer; p: producto);
begin
    if (dimL + 1 <= DIMF) then begin
        dimL := dimL + 1;
        v[dimL] := p;
    end;
end;

// Hacer con corte de control?
procedure cargarVector(l: lista; var v: vector; var dimL: integer);
begin
    dimL := 0;
    while (l <> nil) do begin
        if (l^.dato.rubro = 3) then
            agregarVector(v, dimL, l^.dato);
            
        l := l^.sig;
    end;
end;

procedure seleccion(var v: vector; dimL: integer);
var
	i, j, pos: integer;
	item: producto;
begin
	for i := 1 to dimL - 1 do begin
		pos := i;
		for j := i + 1 to dimL do
			if (v[j].precio < v[pos].precio) then
				pos := j;
		
		item := v[i];
		v[i] := v[pos];
		v[pos] := item;
	end;
end;

function promedio(v: vector; dimL: integer): real;
var
    i: integer;
    ret: real;
begin
    ret := 0;
    for i := 1 to dimL do
        ret := ret + v[i].precio;

    promedio := ret / dimL;
end;

var
    l: lista;
    v: vector;
    dimL: integer;
begin
    Randomize;

    cargarLista(l);
    imprimirLista(l);

    cargarVector(l, v, dimL);
	writeln('----------------------------------------');
	writeln('----------------VECTOR------------------');
	writeln('----------------------------------------');
    imprimirVector(v, dimL);

    seleccion(v, dimL);
	writeln('----------------------------------------');
	writeln('------------VECTOR ORDENADO-------------');
	writeln('----------------------------------------');
    imprimirVector(v, dimL);
    writeln('Promedio del vector: ', promedio(v, dimL):2:2)
end.