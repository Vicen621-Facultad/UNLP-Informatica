program Ejer3P6;
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