program Ejer1P6;

procedure imprimirLista(L: lista);
begin
    while (L <> nil) do begin
        println(L^.num);
        L := L^.sig;
    end;
end;

procedure incremetnarLista(var L: lista; i: integer);
begin
    while (L <> nil) do begin
        L^.num := L^.num * i;
        L := L^.sig;
    end;
end;

begin

end.