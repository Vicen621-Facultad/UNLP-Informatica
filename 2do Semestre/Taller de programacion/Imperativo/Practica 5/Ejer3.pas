program ejer3;
const
    DimF = 10;
type
    rubros = 1..DimF;

    producto_sp = record
        cod, stock: integer;
    end;

    producto = record
        rubro: rubros;
        info: producto_sp;
        precio: real;
    end;

    arbol = ^nodoA;
    nodoA = record
        dato: producto;
        HI: arbol;
        HD: arbol;
    end;

    vector_sp = array[rubros] of producto_sp;
    vector_i = array[rubros] of integer;
    vector = array[rubros] of arbol;

procedure leerProducto(var p: producto);
begin
    write('Ingrese el codigo de producto: ');
    readln(p.info.cod);
    if (p.info.cod <> -1) then begin
        // p.rubro := Random(10) + 1;
        // writeln('Rubro: ', p.rubro);
        write('Ingrese el rubro: ');
        readln(p.rubro);

        p.info.stock := Random(10) + 1;
        writeln('Stock: ', p.info.stock);

        // Genero un real random entre el 0 y el 100
        p.precio := Random * 100;
        writeln('Precio x unidad: ', p.precio:3:2);
    end;
end;

procedure inicializarVector(var v: vector);
var
    i: integer;
begin
    for i := 1 to DimF do
        v[i] := nil;
end;

procedure agregarArbol(var a: arbol; p: producto);
begin
    if (a = nil) then begin
        new(a);
        a^.dato := p;
        a^.HI := nil;
        a^.HD := nil;
    end
    else if (p.info.cod <= a^.dato.info.cod) then
        agregarArbol(a^.HI, p)
    else
        agregarArbol(a^.HD, p);
end;

procedure cargarDatos(var v: vector);
var
    p: producto;
begin
    leerProducto(p);
    while (p.info.cod <> -1) do begin
        agregarArbol(v[p.rubro], p);
        leerProducto(p);
    end;
end;

function existeCodEnArbol(a: arbol; cod: integer): boolean;
begin
    if (a = nil) then
        existeCodEnArbol := false
    else if (a^.dato.info.cod = cod) then
        existeCodEnArbol := true
    else if (cod < a^.dato.info.cod) then
        existeCodEnArbol := existeCodEnArbol(a^.HI, cod)
    else
        existeCodEnArbol := existeCodEnArbol(a^.HD, cod);
end;

function existeCodEnRubro(v: vector; cod: integer; rubro: rubros): boolean;
begin
    existeCodEnRubro := existeCodEnArbol(v[rubro], cod);
end;

procedure maxCod(a: arbol; var max: producto_sp);
begin
    if (a <> nil) then begin
        if (a^.HD = nil) then
            max := a^.dato.info
        else
            maxCod(a^.HD, max);
    end;
end;

procedure maxCodRubros(v: vector; var maxV: vector_sp);
var
    i: integer;
begin
    for i := 1 to DimF do
        maxCod(v[i], maxV[i]);
end;

procedure imprimirVector(v: vector_i);
var
    i: integer;
begin
    for i := 1 to DimF do
        writeln(i, ': ', v[i]);
end;

function contarNodosEntre(a: arbol; codMin, codMax: integer): integer;
begin
    if (a = nil) then
        contarNodosEntre := 0
    else if (a^.dato.info.cod <= codMax) and (a^.dato.info.cod >= codMin) then
        contarNodosEntre := 1 + contarNodosEntre(a^.HI, codMin, codMax) + contarNodosEntre(a^.HD, codMin, codMax)
    else if (a^.dato.info.cod < codMin) then
        contarNodosEntre := contarNodosEntre(a^.HD, codMin, codMax)
    else if (a^.dato.info.cod > codMax) then
        contarNodosEntre := contarNodosEntre(a^.HI, codMin, codMax);
end;

procedure cantEntreCods(v: vector; codMin, codMax: integer; var cants: vector_i);
var
    i: integer;
begin
    for i := 1 to DimF do
        cants[i] := contarNodosEntre(v[i], codMin, codMax);
end;

var
    v: vector;
    v_sp: vector_sp;
    v_i: vector_i;
begin
    Randomize;

    cargarDatos(v);
    writeln('Existe el codigo 1 en el rubro 2?: ', existeCodEnRubro(v, 1, 2));

    maxCodRubros(v, v_sp);
    cantEntreCods(v, 2, 4, v_i);
    imprimirVector(v_i);
end.