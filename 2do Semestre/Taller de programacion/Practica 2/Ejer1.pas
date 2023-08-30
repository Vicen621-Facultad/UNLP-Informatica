program ejer1;
const
    DimF = 10;
type
    VectorCar = array[1..DimF] of char;

    lista = ^nodo;
    nodo = record
        dato: char;
        sig: lista;
    end;

procedure guardarEnVector(car: char; var v: VectorCar; var dimL: integer);
begin
    if (dimL + 1 <= DimF) then begin
        dimL := dimL + 1;
        v[dimL] := car;
    end;
end;

// Leer cars hasta '.' recursivo. dimL debe estar inicializado en 0
procedure leerCarsVector(var v: VectorCar; var dimL: integer);
var
    car: char;
begin
    readln(car);
    if (car <> '.') then begin
        guardarEnVector(car, v, dimL);
        leerCarsVector(v, dimL);
    end;
end;

// Impresion iterativo
procedure imprimirVector(v: VectorCar; dimL: integer);
var
    i: integer;
begin
    for i := 1 to dimL do
        writeln(i, ': ', v[i]);
end;

// Impresion recursivo
procedure imprimirVectorRec(v: vectorCar; dimL, i: integer);
begin
    if (i <= dimL) then begin
        writeln(i, ': ', v[i]);
        imprimirVectorRec(v, dimL, i + 1);
    end;
end;

// Contar caracteres ingresados hata '.' recursivo
function cantCars(caracteres: integer): integer;
var
    car: char;
begin
    readln(car);
    if (car <> '.') then
        caracteres := cantCars(caracteres + 1);

    cantCars := caracteres;
end;

procedure agregarAdelante(car: char; var l: lista);
var
    nue: lista;
begin
    new(nue);
    nue^.dato := car;
    nue^.sig := l;
    l := nue;
end;

procedure leerCarsLista(var l: lista);
var
    car: char;
begin
    readln(car);
    if (car <> '.') then begin
        agregarAdelante(car, l);
        leerCarsLista(l);
    end;
end;

procedure imprimirLista(l: lista);
begin
    if (l <> nil) then begin
        writeln(l^.dato);
        imprimirLista(l^.sig);
    end;
end;

procedure imprimirListaInverso(l: lista);
begin
    if (l^.sig <> nil) then
        imprimirListaInverso(l^.sig);
    
    writeln(l^.dato);
end;

var
    v: VectorCar;
    dimL: integer;
    l: lista;

begin
    dimL := 0;
    leerCarsVector(v, dimL);
    imprimirVectorRec(v, dimL, 1);

    writeln('Cantidad de caracteres leidos: ', cantCars(0))

    leerCarsLista(l);
    writeln('------- LISTA -------');
    imprimirListaInverso(l);
end.