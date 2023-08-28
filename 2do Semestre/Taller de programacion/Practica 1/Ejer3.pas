program ejer3;
const
    DIMF = 8;
type
    codigo = -1..DIMF;
    pelicula = record
        cod: codigo;
        puntaje: real;
    end;

    lista = ^nodo;
    nodo = record
        dato: pelicula;
        sig: lista;
    end;
    
    vector = array[1..DIMF] of real;

procedure leerPelicula(var p: pelicula);
begin
    Writeln('Ingrese el codigo de genero: ');
    readln(p.cod);
    if (p.cod <> -1) then begin
        write('Puntaje: ');
        p.puntaje := Random;
        writeln(p.puntaje);
    end;
end;

{ Este procedimineto recibe la lista por referencia y la pelicula a insertar por valor
Si ya hay una pelicula en la lista con su codigo de genero la va a insertar adelante de la misma
De lo contrario, insertara la pelicula al final de la lista}
procedure insertarOrdenado(var l: lista; p: pelicula);
var
    act, ant, nue: lista;
begin
    new(nue);
    nue^.dato := p;

    act := l;
    ant := l;

    while (act <> nil) and (p.cod <> act^.dato.cod) do begin
        ant := act;
        act := act^.sig;
    end;

    if (act = ant) then
        l := nue
    else
        ant^.sig := nue;

    nue^.sig := act;
end;

procedure cargarLista(var l: lista);
var
    p: pelicula;
begin
    leerPelicula(p);
    while (p.cod <> -1) do begin
        insertarOrdenado(l, p);
        leerPelicula(p);
    end;
end;

procedure imprimirLista(l: lista);
begin
    while (l <> nil) do begin
        write('Codigo de genero: ', l^.dato.cod);
        // multiplico por 10 ya que el ':2:2' divide por 10
		writeln('    Puntaje: ', 10 * l^.dato.puntaje:2:2); 
        l := l^.sig;
    end;
end;

procedure imprimirVector(v: vector);
var
    i: integer;
begin
    for i := 1 to DIMF do begin
        // multiplico por 10 ya que el ':2:2' divide por 10
        writeln(i, ': ', 10 * v[i]:2:2)
    end;
end;

procedure inicializarVector(var v: vector);
var
    i: integer;
begin
    for i := 1 to DIMF do
        v[i] := 0;
end;

procedure maxPorGenero(l: lista; var v: vector);
begin
    inicializarVector(v);

    while(l <> nil) do begin
        if (l^.dato.puntaje > v[l^.dato.cod]) then
            v[l^.dato.cod] := l^.dato.puntaje;
        l := l^.sig;
    end;
end;

procedure incersion(var v: vector);
var
    i, j: integer;
    item: real;
begin
    for i := 2 to DIMF do begin
        item := v[i];
        j := i - 1;
        while (j > 0) and (v[j] > item) do begin
            v[j + 1] := v[j];
            j := j - 1;
        end;
        v[j + 1] := item;
    end;
end;

var
    l: lista;
    v: vector;
begin
    Randomize;
    cargarLista(l);
    imprimirLista(l);

    maxPorGenero(l, v);
	writeln('----------------------------------------');
	writeln('----------------VECTOR------------------');
	writeln('----------------------------------------');
    imprimirVector(v);

    incersion(v);
	writeln('----------------------------------------');
	writeln('------------VECTOR ORDENADO-------------');
	writeln('----------------------------------------');
    imprimirVector(v);

    // multiplico por 10 ya que el ':2:2' divide por 10
    // Agarro el valor mas grande del vector ya que esta ordenado de menor a mayor
    writeln('Maximo: ', 10 * v[DIMF]:2:2); 
end.