program Ejer4P4x4;
const
    cCodes = 2000;
    cCountries = 25;
type
    subCode = 1..cCodes;
    subCountry = 1..cCountries;
    employee = Record
        code: subCode;
        country: subCountry;
        years: Integer;
        salary: Real;
    end;
    vEmployees = array[1..cCodes] of employee;
    vCountries = array[1..cCountries] of Integer;
    vSalary = array[1..cCountries] of Real;

procedure readEmployee(var e: employee);
begin
    ReadLn(e.code);
    ReadLn(e.country);
    ReadLn(e.years);
    ReadLn(e.salary);
end;

procedure loadVector(var v: vEmployees; var dimL: integer; var countries: vCountries);
var
    val: employee;
begin
    dimL := 0;
    repeat
        readEmployee(val);
        dimL := dimL + 1;
        v[dimL] := val;
        countries[val.country] = countries[val.country] + 1;
    until val.code = 0;
end;

function moreEmployees(v: vEmployees; dimL: integer; countries: vCountries): subCountry;
var
    country: subCountry;
    i, max: integer;
begin
    max := -1;
    for i := 1 to cCountries do begin
        if (countries[i] > max) then begin
            max := countries[i];
            country := i;
        end;
    end;

    moreEmployees := country;
end;

procedure bestSalary(v: vEmployees; dimL: integer; var employees: vCountries);
var
    i: integer;
    country: subCountry;
    salaries: vSalary;
begin
    for i := 1 to cCountries do
        salaries[i] := -1;
    
    for i := 1 to dimL do begin
        country[i]  
    end;
end;

begin
    
end.
