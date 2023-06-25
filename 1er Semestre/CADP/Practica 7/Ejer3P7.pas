program Ejer3P7;
type
    viaje = record
        num, cod: integer;
        km: real;
        origen, destino: string[50];
    end;
    listaV = ^nodo;
    nodo = record
        dato: viaje;
        sig: listaV;
    end;

procedure cargarLista(var lista: listaV);
begin
    // Se dispone
end;

procedure insertarOrdenado(var lista: listaV; v: viaje);
var
    act, ant, nue: listaV;
begin
    new(nue);
    nue^.dato := v;

    act := lista;
    ant := lista;

    while (act <> nil) and (v.num > act^.dato.num) do begin
        ant := act;
        act := act^.sig;
    end;

    if (act = ant) then
        lista := nue
    else
        ant^.sig := nue;

    nue^.sig := act;
end;

procedure actualizarMaximos(km: real; cod: integer; var max1, max2: real; var cod1, cod2: integer);
begin
    if (km > max1) then begin
        max2 := max1;
        cod2 := cod1;

        max1 := km;
        cod1 := cod;
    end
    else if (km > max2) then begin
        max2 := km;
        cod2 := cod
    end;
end;

procedure recorrerLista(lista: listaV; var nLista: listaV; var cod1, cod2: integer);
var
    max1, max2, cantKm: real;
    codControl: integer;
begin
    max1 := -1;
    cantKm := 0;

    while (lista <> nil) do begin
        if (codControl = lista^.dato.cod) then
            cantKm := cantKm + lista^.dato.km
        else begin
            actualizarMaximos(cantKm, lista^.dato.cod, max1, max2, cod1, cod2);
            cantKm := lista^.dato.km;
            codControl := l^.dato.cod;
        end;

        if (l^.dato.km > 5) then
            insertarOrdenado(nLista, l^.dato);
    end;
end;

begin

end.