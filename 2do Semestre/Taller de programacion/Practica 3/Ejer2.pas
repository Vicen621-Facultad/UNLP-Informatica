
Program ejer2;

Type 
    venta =   Record
        cod, cant:   integer;
        fecha:   integer;
    End;

    arbol =   ^nodo;
    nodo =   Record
        dato:   venta;
        HI:   arbol;
        HD:   arbol;
    End;

Procedure agregarArbol(Var a: arbol; v: venta);
Begin
    If (a = Nil) Then
        Begin
            new(a);
            a^.dato := v;
            a^.HI := Nil;
            a^.HD := Nil;
        End
    Else If (v.cod <= a^.dato.cod) Then
             agregarArbol(a^.HI, v)
    Else
        agregarArbol(a^.HD, v);
End;

Procedure leerVenta(Var v: venta);
Begin
    write('Ingrese codigo de producto: ');
    readln(v.cod);
    If (v.cod <> 0) Then
        Begin
            v.cant := Random(50) + 1;
            writeln('Cant ventas: ', v.cant);
            v.fecha := random(31) + 1;
        End;
End;

Procedure cargarArbolVentas(Var a: arbol);

Var 
    v:   venta;
Begin
    leerVenta(v);
    While (v.cod <> 0) Do
        Begin
            agregarArbol(a, v);
            leerVenta(v);
        End;
End;

Function existe(a: arbol; val: integer):   boolean;
Begin
    If (a <> Nil) Then
        existe := (a^.dato.cod = val) Or existe(a^.HI, val) Or existe(a^.HD, val)
    Else
        existe := false;
End;

Function cantVentas(a: arbol; val: integer):   integer;
Begin
    If (a <> Nil) Then
        Begin
            If (a^.dato.cod = val) Then
                cantVentas := a^.dato.cant + cantVentas(a^.HI, val)
            Else
                cantVentas := cantVentas(a^.HI, val) + cantVentas(a^.HD, val);
        End
    Else
        cantVentas := 0;
End;

// Corte de control, Leer todos los del mismo cod, sumarlo y agregarlo a aVentas 
// Cuando cambia, pasar al siguiente corte de control
Procedure cargarArbolProductos(Var aProd: arbol; aVentas: arbol);

Var 
    v:   venta;
Begin
    If (aVentas <> Nil) And (Not existe(aProd, aVentas^.dato.cod)) Then
        Begin
            v.cod := aVentas^.dato.cod;
            v.cant := cantVentas(aVentas, aVentas^.dato.cod);
            agregarArbol(aProd, v);
        End;
End;

Procedure cargarArboles(Var aVentas, aProd: arbol);
Begin
    cargarArbolVentas(aVentas);
    cargarArbolProductos(aProd, aVentas);
End;

Function buscar(a: arbol; val: integer):   integer;
Begin
    If (a = Nil) Then buscar := 0
    Else If (a^.dato.cod = val) Then buscar := a^.dato.cant
    Else If (val > a^.dato.cod) Then buscar := buscar(a^.HD, val)
    Else buscar := buscar(a^.HI, val);
End;

Var 
    aProd, aVentas:   arbol;
Begin
    Randomize;
    cargarArboles(aVentas, aProd);
    writeln('Cantidad de ventas de producto 1: ', cantVentas(aVentas, 1));
    writeln('Cantidad de ventas de producto 2: ', buscar(aProd, 2));
End.
