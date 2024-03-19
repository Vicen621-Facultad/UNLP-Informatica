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
    write('Ingrese Apellido (fin para terminar):'); ReadLn(emp.apellido);
end;

procedure crearArchivoDeEmpleados();
var
    nom: String[20];
    arch: archEmpleados;
    emp: empleado;
begin
    Write('Ingrese el nombre del archivo: '); ReadLn(nom);
    Assign(arch, nom);
    Rewrite(arch);
    leerEmpleado(emp);
    while (emp.apellido <> 'fin') do begin
        write(arch, emp);
        leerEmpleado(emp);
    end;
end;

var
    opc: Byte;

begin
    WriteLn('EMPLEADOS');
    WriteLn;
    WriteLn('0. Terminar el programa');
    WriteLn('1. Crear un archivo binario de empleados');
    WriteLn('2. Mostrar empleados por nombre/apellido');
    WriteLn('3. Mostrar todos los empleados');
    WriteLn('4. Mostrar en pantalla los empleados mayores de 70 años');
    repeat
        Write('Ingrese el numero de opcion: '); ReadLn(opc);
        crearArchivoDeEmpleados();
    until(opc = 0);
end.