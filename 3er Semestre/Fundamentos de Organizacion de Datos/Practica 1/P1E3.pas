program P1E3;

type
    empleado = record
        num, edad, dni: integer;
        nombre, apellido: String[40];
    end;

    archEmpleados = file of empleado;

procedure leerEmpleado(var emp: empleado);
begin
    write('Ingrese numero de empleado: '); ReadLn(emp.num);
    write('Ingrese edad: '); ReadLn(emp.edad);
    write('Ingrese DNI: '); ReadLn(emp.dni);
    write('Ingrese nombre: '); ReadLn(emp.nombre);
    write('Ingrese Apellido (fin para terminar): '); ReadLn(emp.apellido);
end;

procedure imprimirEmpleado(emp: empleado);
begin
    WriteLn(
        'Nombre: ', emp.nombre, 
        ', apellido: ', emp.apellido, 
        ', numero de empleado: ', emp.num, 
        ', edad: ', emp.edad, 
        ', dni: ', emp.dni
    );
end;

procedure crearArchivoDeEmpleados(var arch: archEmpleados);
var
    emp: empleado;
begin
    Rewrite(arch);
    leerEmpleado(emp);
    while (emp.apellido <> 'fin') do begin
        write(arch, emp);
        leerEmpleado(emp);
    end;
    close(arch);
end;

procedure filtrarEmpleados(var arch: archEmpleados; opc: byte);
var
    filter: String[40];
    emp: empleado;
begin
    Write('Ingrese el string por el cual filtrar (case sensitive): '); ReadLn(filter);
    Reset(arch);
    WriteLn;
    WriteLn('Empleados: ');
    while (not eof(arch)) do begin
        Read(arch, emp);
        if ((opc = 1) and (emp.nombre = filter)) or ((opc = 2) and (emp.apellido = filter)) then
            imprimirEmpleado(emp)
    end;
    close(arch);
end;

procedure imprimirEmpleados(var arch: archEmpleados);
var
    emp: empleado;
begin
    WriteLn('Empleados: ');
    Reset(arch);
    while (not eof(arch)) do begin
        Read(arch, emp);
        imprimirEmpleado(emp)
    end;
    close(arch);
end;

procedure imprimirEmpleadosMayor70(var arch: archEmpleados);
var
    emp: empleado;
begin
    WriteLn('Empleados: ');
    Reset(arch);
    while (not eof(arch)) do begin
        Read(arch, emp);
        if (emp.edad > 70) then
            imprimirEmpleado(emp)
    end;
    close(arch);
end;

var
    opc: byte;
    fileName: String[40];
    arch: archEmpleados;
begin
    fileName := '';

    WriteLn('EMPLEADOS');

    repeat
        WriteLn;
        WriteLn('0. Terminar el programa');
        WriteLn('1. Crear un archivo binario de empleados');
        WriteLn('2. Mostrar empleados por nombre/apellido');
        WriteLn('3. Mostrar todos los empleados');
        WriteLn('4. Mostrar en pantalla los empleados mayores de 70 años');

        Write('Ingrese el numero de opcion: '); ReadLn(opc);
        
        if (opc <> 0) and (fileName = '') then begin
            WriteLn;
            Write('Ingrese el nombre del archivo: '); ReadLn(fileName);
            Assign(arch, fileName);
        end;

        case opc of 
            1: crearArchivoDeEmpleados(arch);
            2: begin
                WriteLn;
                WriteLn('1. Filtrar por nombre');
                WriteLn('2. Filtrar por apellido');
                write('Ingrese el numero de opcion: '); ReadLn(opc);
                filtrarEmpleados(arch, opc);
            end;
            3: imprimirEmpleados(arch);
            4: imprimirEmpleadosMayor70(arch);
        end;
    until(opc = 0);
end.