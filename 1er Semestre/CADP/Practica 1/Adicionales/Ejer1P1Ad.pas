PROGRAM Ejer1P1Ad;

VAR
  code, codeMax, investCount, company50000, i: integer;
  avgInvest, maxInvest, value: real;
  invest50000: boolean;

BEGIN
  maxInvest := -1;
  company50000 := 0;

  repeat
    write('Ingrese un codigo de empresa: '); read(code);
    write('Ingrese la cantidad de inversiones: '); read(investCount);
    writeln('Ingrese el monto de cada inversion: ');
    
    avgInvest := 0;
    invest50000 := false;

    for i := 1 to investCount do begin
      readln(value);
      avgInvest := avgInvest + value;

      if (value > 50000) then
        invest50000 := true;
    end;

    writeln('Resultado del analisis de empresa: ', code, ' monto promedio ', avgInvest/investCount);

    if (invest50000) then
      company50000 := company50000 + 1;
    
    if (avgInvest > maxInvest) then begin
      maxInvest := avgInvest;
      codeMax := code;
    end;
  until code = 100;

  writeln('La empresa ', codeMax, ' es la que mas dinero invirtio (', maxInvest, ')');
  writeln('Hay ', company50000, ' empresas con inversiones mayores a 50000');
END.