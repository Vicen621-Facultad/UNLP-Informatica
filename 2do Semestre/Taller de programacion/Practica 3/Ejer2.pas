program ejer2;

type
    venta = record
        cod, cant: integer;
        fecha: integer;
    end;

    arbol = ^nodo;
    nodo = record
        dato: venta;
        HI: arbol;
        HD: arbol;
    end;

procedure agregarArbol(var a: arbol; v: venta);
begin
    if (a = nil) then begin
        new(a);
        a^.dato := v;
        a^.HI := nil;
        a^.HD := nil;
    end
    else if (v.cod <= a^.dato.cod) then
        agregarArbol(a^.HI, v)
    else
        agregarArbol(a^.HD, v);
end;

procedure leerVenta(var v: venta);
begin
    write('Ingrese codigo de producto: ');
    readln(v.cod);
    if (v.cod <> 0) then begin
        v.cant := Random(50) + 1;
        v.fecha := random(31) + 1;
    end;
end;

procedure cargarArboles(var aVentas, aProd: arbol);
var
    v: venta;
begin
    leerVenta(v);
    while (v.cod <> 0) do begin
        agregarArbol(aVentas, v);
        leerVenta(v);
    end;
end;
