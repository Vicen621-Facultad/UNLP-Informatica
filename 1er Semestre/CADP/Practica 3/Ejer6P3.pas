program Ejer6P3;

type
    processor = record
        brand, model: string;
        cores, transistors: integer;
        clock: real;
    end;

procedure readProcessor(var pro: processor);
    begin
        writeln('Ingrese la marca'); readln(pro.brand);
        writeln('Ingrese el modelo'); readln(pro.model);
        writeln('Ingrese la cantidad de nucleos'); readln(pro.cores);
        writeln('Ingrese los nm de los transistores'); readln(pro.transistors);
        WriteLn('Ingrese la velocidad del reloj en Ghz'); readln(pro.clock);
    end;

function twoCores22nm(cores, transistors: integer): boolean;
    begin
        twoCores22nm := (cores > 2) and (transistors >= 22);
    end;

// La primera variable es la cantidad de procesadores con transistores de 14 nm que tiene la marca
procedure twoMaximums(processors: integer; brand: string; var max1, max2: integer; var brandMax1, brandMax2: string);
    begin
        if (processors > max1) then begin
            max2 := max1;
            brandMax2 := brandMax1;

            max1 := processors;
            brandMax1 := brand;
        end
        else if (processors > max2) then begin
            max2 := processors;
            brandMax2 := brand;
        end;
    end;

function isMulticore2Ghz(brand: string; cores: integer; clock: real): boolean;
    begin
        isMulticore2Ghz := ((brand = 'Intel') or (brand = 'AMD')) and (cores > 1) and (clock >= 2);
    end;

var
    max1, max2, cant14nm, cantMulticore2Ghz: integer;
    currentBrand, brandMax1, brandMax2: string;
    pro: processor;

begin
    max1 := -1;
    cantMulticore2Ghz := 0;

    readProcessor(pro);
    while (pro.cores > 0) do begin
        cant14nm := 0;
        currentBrand := pro.brand;

        while (pro.cores > 0) and (pro.brand = currentBrand) do begin
            if (pro.cores > 2) and (pro.transistors >= 22) then
                writeln('Marca y linea del procesador con mas de 2 cores y transistores >= 22 nm: ', pro.brand, ' ', pro.model);
            
            if (pro.transistors > 14) then
                cant14nm := cant14nm + 1;
            
            if (isMulticore2Ghz(pro.brand, pro.cores, pro.clock)) then
                cantMulticore2Ghz := cantMulticore2Ghz + 1;

            readProcessor(pro);
        end;

        twoMaximums(cant14nm, currentBrand, max1, max2, brandMax1, brandMax1);
    end;

    writeln('Procesadores multicore Intel o AMD: ', cantMulticore2Ghz);
    WriteLn('Marcas con mas procesadores de 14nm: ', brandMax1, ' ', brandMax2, ' (', max1, ', ', max2, ')');
end.