# Ejercicio 12

1. El timer incrementa `CANT` cada 1 segundo. Tira un `INT 1` cada vez que `CANT = COMP`
2. 
   |  Registro  |  Direccion  |  Funcion  |
   | :--------: | :---------: | :-------: |
   | CANT       | 10h         | Cuenta los segundos transcurridos |
   | COMP       | 11h         | Cada vez que `CANT = COMP`, se ejecuta la `INT 0` |
