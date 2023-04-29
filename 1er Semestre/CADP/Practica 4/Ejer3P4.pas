program Ejer3P4;
const
    dimF = 100;
type
    vector = array[1..dimF] of integer;

procedure print(vec: vector; dimL: integer);
var
    i: integer;
begin
    for i := 1 to dimL do
        writeln(vec[i]);
end;

procedure reversePrint(vec: vector; dimL: integer);
var
    i: integer;
begin
    for i := 1 downto dimL do
        writeln(vec[i]);
end;

procedure printMid(vec: vector; dimL: integer);
var
    i: integer;
begin
    for i := (dimL DIV 2 + 1) to dimL do
        writeln(vec[i]);
    
    for i := (dimL DIV 2) downto 1 do
        writeln(vec[i])
end;

procedure printXY(vec: vector; x,y: integer);
var
    i: integer;
begin
    if (x > y) then begin
        for i := x downto y do
            writeln(vec[i]);
    end
    else
        for i := x to y do
            writeln(vec[i]);
end;

procedure printWithXY(vec: vector; dimL: integer);
var
    i: integer;
begin
    printXY(vec, 1, dimL)
end;

procedure reversePrintWithXY(vec: vector; dimL: integer);
var
    i: integer;
begin
    printXY(vec, dimL, 1)
end;

procedure printMidWithXY(vec: vector; dimL: integer);
var
    i: integer;
begin
    printXY(vec, (dimL DIV 2), 1);
    printXY(vec, (dimL DIV 2 + 1), dimL);
end;

begin
  
end.