program Ejer4P6;
type
    lista = ^nodo;
    nodo = record
        num : integer;
        sig : lista;
    end;

procedure agregarAtras(var L: lista; v: integer);
var
    aux : lista;
begin
    new(aux);
    aux^.num := v;
    aux^.sig := nil;

    if (L = nil) then begin
        L := aux;    
    end
    else begin
        while (L^.sig <> nil) do
            L := L^.sig;

        L^.sig := aux;
    end;
end;

procedure agregarAtras(var pri, ult: lista; v: integer);
var
    aux: lista;
begin
    new(aux);
    aux^.num := v;
    aux^.sig := nil;

    if (pri = nil) then begin
        pri := aux;
        ult := aux;
    end
    else begin
        ult^.sig := aux;
        ult := aux;
    end;
end;

function maximo(l: lista): integer;
var
    max: integer;
begin
    max := -999;
    while (l <> nil) do begin
        if (l^.num > max) then
            max := l^.num;
        l := l^.sig;
    end;
    maximo := max;
end;

function minimo(l: lista): integer;
var
    min: integer;
begin
    min := 999;
    while (l <> nil) do begin
        if (l^.num < min) then
            min := l^.num;
        l := l^.sig;
    end;
    minimo := min;
end;

function multiplos(l: lista; a: integer): integer;
var
    count: integer;
begin
    count := 0;
    while (l <> nil) do begin
        if ((l^.num MOD a) = 0) then
            count := count + 1;
        
        l := l^.sig;
    end;
    multiplos := count;
end;

var
    pri : lista;
    valor : integer;
begin
    pri := nil;
    writeln('Ingrese un numero');
    read(valor);
    while (valor <> 0) do begin
        armarNodo(pri, valor);
        writeln('Ingrese un numero');
        read(valor);
    end;
end.