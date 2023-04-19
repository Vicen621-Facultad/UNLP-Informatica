program Ejer5P3;

type
    car = record
        model, brand: string;
        price: real;
    end;

procedure readCar(var c: car);
    begin
      WriteLn('Ingrese la marca del auto'); ReadLn(c.brand);
      WriteLn('Ingrese el modelo del auto'); ReadLn(c.model);
      WriteLn('Ingrese el precio del auto'); ReadLn(c.price);
    end;

procedure expensivestCar(c: car; var maxPrice: real; var maxModel, maxBrand: string);
    begin
        if (c.price > maxPrice) then begin
            maxPrice := c.price;
            maxModel := c.model;
            maxBrand := c.brand;
        end;
    end;

var
    avgPrice, maxPrice: real;
    maxModel, maxBrand, currentBrand: string;
    totalCars: integer;
    c: car;

// TODO: Testear
begin
    maxPrice := -1;

    readCar(c);
    while(c.brand <> 'ZZZ') do begin
        totalCars := 0;
        avgPrice := 0;
        currentBrand := c.brand;

        while((c.brand <> 'ZZZ') and (c.brand = currentBrand)) do begin
            totalCars := totalCars + 1;
            avgPrice := avgPrice + c.price;
            expensivestCar(c, maxPrice, maxModel, maxBrand);

            readCar(c);
        end;

        avgPrice := avgPrice / totalCars;
        writeln('Precio promedio de la marca ', currentBrand, ' ', avgPrice:0:2);
    end;
    writeln('El auto mas caro es: ', maxBrand, ' ', maxModel, ' (', maxPrice:0:2, ')')
end.