program Ejer6P2P2;

const
    PRODUCTS = 100;

procedure twoMinimums(var min1, min2: real; var min1Code, min2Code: integer; value: real; code: integer); 
    begin
        if (value < min1) then begin
            min2 := min1;
            min2Code := min1Code;

            min1 := value;
            min1Code := code;
        end
        else if (value < min2) then begin
            min2 := value;
            min2Code := code;
        end;
    end;

procedure maximum(var max: real; var codeMax: integer; value: real; code: integer);
    begin
        if (value > max) then begin
            max := value;
            codeMax := code;
        end;
    end;

function averagePrice(totalPrice: real; totalProducts: integer): real;
    begin
        averagePrice := totalPrice / totalProducts;
    end;

var
    min1, min2, maxPant, totalPrice, price: real;
    min1Code, min2Code, maxPantCode, code, i: integer;
    tipe: string;

begin
    min1 := 9999;
    min2 := 9999;
    maxPant := -1;
    totalPrice := 0;

    {Se inicializa la variable min1Code para que cuando se tenga 
    que hacer el traspaso del min1Code al min2Code no de error}
    min1Code := -1; 

    for i := 1 to PRODUCTS do begin
        readln(code);
        readln(price);
        readln(tipe);

        twoMinimums(min1, min2, min1Code, min2Code, price, code);

        if (tipe = 'pantalon') then
            maximum(maxPant, maxPantCode, price, code);

        totalPrice := totalPrice + price;
    end;

    writeln('Productos mas baratos: ', min1Code, ' ', min2Code, ' (', min1:0:2, ' | ', min2:0:2, ')');
    writeln('Pantalon mas caro: ', maxPantCode, ' (',maxPant:0:2,')');
    writeln('Precio promedio: ', averagePrice(totalPrice, PRODUCTS):0:2);
end.
