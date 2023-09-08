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

    arbolL = ^nodoL;
    nodoL = record
        dato: libro;
        HI: arbolL;
        HD: arbolL;
    end;

    arbolP = ^nodoP;
    nodoP = record
        dato: prestamo;
        HI: arbolP;
        HD: arbolP;
    end;



begin

end.