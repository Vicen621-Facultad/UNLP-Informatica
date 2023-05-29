program Ejer6P6;
const
    dimF = 7;

type
    spectrumRange = 1..7;
    probe = record
        name: string;
        duration: integer;
        constructionCost, monthlyCost: real;
        spectrum: spectrumRange;
    end;

    countV = array[1..dimF] of integer;

    list = ^node;
    node = record
        data: probe;
        next: list;
    end;

procedure readProbe(var p: probe);
begin
    readln(p.name);
    readln(p.duration);
    readln(p.constructionCost);
    readln(p.monthlyCost);
    readln(p.spectrum);
end;

procedure addToList(var l: list; p: probe);
var
    aux: list;
begin
    new(aux);
    aux^.data := p;
    aux^.next := nil;

    if (l = nil) then
        l := aux
    else begin
        aux^.next := l;
        l := aux;
    end;
end;

procedure loadList(var list: list; var vec: countV; var avgDuration, avgCost: real);
var
    data: probe;
    count: integer;
begin
    list := nil;
    avgDuration := 0;
    avgCost := 0;
    count := 0;
    repeat
        readProbe(data);
        addToList(list, data);

        // Inciso B
        vec[data.spectrum] := vec[data.spectrum] + 1;

        // Inciso C
        avgDuration := avgDuration + data.duration;

        // Inciso D
        avgCost := avgCost + data.constructionCost;
        count := count + 1;
    until data.name <> 'GAIA'; 

    // Inciso C
    avgDuration := avgDuration / count;

    // Incuso D
    avgCost := avgCost / count;
end;

procedure recorrer(l: list; avgDuration, avgCost: real; var expensivestProbe: string; var countDuration: integer);
var
    max: real;
begin
    max := -1;
    while (l <> nil) do begin
        // Inciso A
        if (l^.data.constructionCost + l^.data.monthlyCost) > max then begin
            max := l^.data.constructionCost + l^.data.monthlyCost;
            s := l^.data.name;
        end;
        
        // Inciso C
        if (l^.data.duration > avgDuration) then
            countDuration := countDuration + 1;
        
        // Inciso D
        if (l^.data.constructionCost > avgCost) then
            write(l^.data.name, ', ');
        
        l := l^.next;
    end;
end;

procedure printVector(vec: countV);
var
    i: integer;
begin
    writeln('La cantidad de sondas que hay por rango son:');
    for i := 1 to dimF do
        writeln(i, ': ', vec[i]);
end;

var
    l: list;
    vec: countV;
    avgDuration, avgCost: real;
    expensivestName: string; 
    countDuration: integer;

begin
    loadList(l, vec, avgDuration, avgCost);
    recorrer(l, avgDuration, avgCost, expensivestName, countDuration);
    writeln('La sonda mas cara es: ', expensivestName);
    printVector(vec);
    writeln('Cantidad de sondas que su duracion estimada supera la duracion promedio de las sondas: ', countDuration);
end.