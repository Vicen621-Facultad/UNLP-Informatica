program Ejer2;

type
    dias = 1..31;
    meses = 1..12;

    prestamo = record
        isbn, num, cantDias: integer;
        dia: dias;
        mes: meses;
    end;

    lista = ^nodoPres;
    nodoPres = record
        dato: prestamo;
        sig: lista;
    end;

    libro = record
        isbn: integer;
        prestamos: lista;
    end;

    libro_cant = record
        isbn: integer;
        cant: integer;
    end;

    arbolL = ^nodoL;
    nodoL = record
        dato: libro;
        HI: arbolL;
        HD: arbolL;
    end;

    arbolCL = ^nodoCL;
    nodoCL = record
        dato: libro_cant;
        HI, HD: arbolCL;
    end;

    arbolP = ^nodoP;
    nodoP = record
        dato: prestamo;
        HI: arbolP;
        HD: arbolP;
    end;

procedure leerPrestamo(var p: prestamo);
begin
    write('Ingrese ISBN: ');
    readln(p.isbn);
    if (p.isbn <> -1) then begin
        p.num := Random(10) + 1;
        writeln('Numero de socio: ', p.num);
        p.cantDias := Random(5) + 1;
        writeln('Cantidad de dias: ', p.cantDias);
        p.dia := Random(31) + 1;
        p.mes := Random(12) + 1;
        writeln('Dia del prestamo: ', p.dia, '/', p.mes);
        writeln(' ');
     end;
end;

procedure agregarArbolPrestamo(var a: arbolP; p: prestamo);
begin
    if (a = nil) then begin
        new(a);
        a^.dato := p;
        a^.HI := nil;
        a^.HD := nil;
    end
    else if (p.isbn <= a^.dato.isbn) then
        agregarArbolPrestamo(a^.HI, p)
    else
        agregarArbolPrestamo(a^.HD, p);
end;

procedure cargarArbolPrestamo(var a: arbolP);
var
    p: prestamo;
begin
    leerPrestamo(p);
    while (p.isbn <> -1) do begin
        agregarArbolPrestamo(a, p);
        leerPrestamo(p);
    end;
end;

// TODO: Preguntar si esta bien
function encontrarNodo(a: arbolL; isbn: integer): arbolL;
begin
    if (a = nil) or (a^.dato.isbn = isbn) then
        encontrarNodo := a
    else if (isbn < a^.dato.isbn) then
        encontrarNodo := encontrarNodo(a^.HI, isbn)
    else
        encontrarNodo := encontrarNodo(a^.HD, isbn);
end;

procedure agregarAdelante(l: lista; p: prestamo);
var
    nue: lista;
begin
    new(nue);
    nue^.dato := p;
    nue^.sig := l;
    l := nue;
end;

procedure agregarArbolLibro(var a: arbolL; l: libro);
begin
    if (a = nil) then begin
        new(a);
        a^.dato := l;
        a^.HI := nil;
        a^.HD := nil;
    end
    else if (l.isbn <= a^.dato.isbn) then
        agregarArbolLibro(a^.HI, l)
    else
        agregarArbolLibro(a^.HD, l);
end;

procedure cargarArbolLibros(var libros: arbolL; prestamos: arbolP);
var
    aux: arbolL;
    l: libro;
begin
    if (prestamos <> nil) then begin
        aux := encontrarNodo(libros, prestamos^.dato.isbn);
        if (aux = nil) then begin
            l.isbn := prestamos^.dato.isbn;
            l.prestamos := nil;
            agregarAdelante(l.prestamos, prestamos^.dato);
            agregarArbolLibro(libros, l);
        end
        else
            agregarAdelante(aux^.dato.prestamos, prestamos^.dato)
    end;
end;

procedure cargarArboles(var prestamos: arbolP; var libros: arbolL);
begin
    cargarArbolPrestamo(prestamos);
    cargarArbolLibros(libros, prestamos);
end;

function maxArbol(a: arbolP): integer;
begin
    if (a^.HD = nil) then
        maxArbol := a^.dato.isbn
    else
        maxArbol := maxArbol(a^.HD);
end;

function minArbol(a: arbolL): integer;
begin
    if (a^.HI = nil) then
        minArbol := a^.dato.isbn
    else
        minArbol := minArbol(a^.HI);
end;

function presPorSocio(a: arbolP; num: integer): integer;
var
    i: integer;
begin
    if (a <> nil) then begin
        i := 0;
        if (a^.dato.num = num) then
            i := 1;

        presPorSocio := i + presPorSocio(a^.HI, num) + presPorSocio(a^.HD, num);
    end
    else
        presPorSocio := 0;
end;

function contarListaNum(l: lista; num: integer): integer;
var
    cant: integer;
begin
    cant := 0;
    while (l <> nil) do begin
        if (l^.dato.num = num) then
            cant := cant + 1;

        l := l^.sig;
    end;
    contarLista := cant;
end;

function presPorSocioLibros(a: arbolL; num: integer): integer;
begin
    if (a <> nil) then
        presPorSocioLibros := contarListaNum(a^.dato.prestamos, num) + presPorSocioLibros(a^.HI, num) + presPorSocioLibros(a^.HD, num)
    else
        presPorSocioLibros := 0;
end;

procedure cargarArbolCantLibrosP(var a: arbolCL; isbn: integer);
begin
    if (a = nil) then begin
        new(a);
        a^.dato.isbn := isbn;
        a^.dato.cant := 1;
        a^.HI := nil;
        a^.HD := nil;
    end
    else if (isbn = a^.dato.isbn) then
        a^.dato.cant := a^.dato.cant + 1
    else if (isbn < a^.dato.isbn) then
        cargarArbolCantLibros(a^.HI, isbn)
    else
        cargarArbolCantLibros(a^.HD, isbn);
end;

function contarLista(l: lista): integer;
var
    cant: integer;
begin
    cant := 0;
    while (l <> nil) do begin
        cant := cant + 1;
        l := l^.sig;
    end;

    contarLista := cant;
end;

procedure cargarArbolCantLibrosL(var a: arbolCL; l: libro);
begin
    if (a = nil) then begin
        new(a);
        a^.dato.isbn := l.isbn;
        a^.dato.cant := contarLista(l.prestamos);
        a^.HI := nil;
        a^.HD := nil;
    end
    else if (isbn <= a^.dato.isbn) then
        cargarArbolCantLibros(a^.HI, l.isbn)
    else
        cargarArbolCantLibros(a^.HD, l.isbn);
end;

procedure generarArbolCantLibrosP(a: arbolCL; aPrestamos: arbolP);
begin
    if (a <> nil) then begin
        generarArbolCantLibros(a^.HI, aPrestamos);
        cargarArbolCantLibrosP(a, aPrestamos^.dato.isbn);
        generarArbolCantLibros(a^.HD, aPrestamos);
    end;
end;

procedure generarArbolCantLibrosL(a: arbolCL; aLibros: arbolL);
begin
    if (a <> nil) then begin
        generarArbolCantLibros(a^.HI, aPrestamos);
        cargarArbolCantLibrosL(a, aPrestamos^.dato.isbn);
        generarArbolCantLibros(a^.HD, aPrestamos);
    end;
end;

var
    prestamos: arbolP;
    libros: arbolL;
    cantLibrosP, cantLibrosL: arbolCL;
begin
    Randomize;
    cargarArboles(prestamos, libros);
    writeln('ISBN mas grande: ', maxArbol(prestamos));
    writeln('ISBN mas chico: ', minArbol(libros));
    writeln('Cantidad de prestamos para 4: ', presPorSocio(prestamos, 4));
    writeln('Cantidad de prestamos para 8: ', presPorSocioLibros(libros, 8));
    generarArbolCantLibrosP(cantLibrosP, prestamos);
    generarArbolCantLibrosL(cantLibrosL, libros);
end.
