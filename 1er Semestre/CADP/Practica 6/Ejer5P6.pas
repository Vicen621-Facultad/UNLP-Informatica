program Ejer5P6;
type
    product = record
        code, current, min: integer;
        description: string;
        price: real;
    end;

    list = ^node;
    node = record
        data: product;
        sig: list;
    end;

procedure loadProduct(var p: product);
begin
    readln(p.code);
    if (p.code <> -1) then begin
        readln(p.current);
        readln(p.min);
        readln(p.description);
        readln(p.price);
    end;
end;

procedure addBegin(var l: list; p: product);
var
    aux: list;
begin
    new(aux);
    aux^.data := p;
    aux^.sig := nil;

    if (l <> nil) then begin
        l := aux;
    end
    else begin
        aux^.sig := l;
        l := aux;
    end;
end;

procedure loadList(var l: list);
var
    p: product;
begin
    l := nil;
    loadProduct(p);
    while (p.code <> -1) do begin
        addBegin(l, p);
        loadProduct(p);
    end;
end;

function percentage(l: list): real;
var
    count, listCount: integer;
begin
    count := 0;
    listCount := 0;
    while (l <> nil) do begin
        if (l^.data.current < l^.data.min) then
            count := count + 1;
        
        listCount := listCount + 1;
        l := l^.sig;
    end;

    percentage := (count * 100) / listCount;
end;

function has3EvenDigits(i: integer): boolean;
var
    count, digit: integer;
begin
    count := 0;
    while (digit <> 0) do begin
        digit := i MOD 10;
        i := i DIV 10;

        if (digit MOD 2 = 0) then
            count := count + 1;
    end;

    has3EvenDigits := (count >= 3);
end;

procedure writeDescription(l: list);
begin
    while (l <> nil) do begin
        if (has3EvenDigits(l^.data.code)) then
            writeln(l^.data.code, ': ', l^.data.description);
        
        l := l^.sig;
    end;
end;

procedure minimums2(l: list; var min1C, min2C: integer);
var
    min1, min2: integer;
begin
    min1 := 999;
    min2 := 999;

    while(l <> nil) do begin
        if (l^.data.price < min1) then begin
            min2 := min1;
            min2C := min1C;
            min1 := l^.data.price;
            min1C := l^.data.code;
        end
        else if (l^.data.price < min2) then begin
            min2 := l^.data.price;
            min2C := l^.data.code;
        end;

        l := l^.sig;
    end;
end;

var
    l: list;
    p: product;
    min1C, min2C: integer;
begin
    loadList(l);
    writeln('Porcentaje de productos con stock actual por debajo de su minimo: ', percentage(l):2:0);
    writeDescription(l);
    minimums2(l, min1, min2);
    writeln('Codigo de los dos productos mas baratos: ', min1C, min2C);
end.