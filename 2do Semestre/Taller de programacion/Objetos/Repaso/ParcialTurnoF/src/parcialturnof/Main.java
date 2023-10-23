package parcialturnof;

import PaqueteLectura.GeneradorAleatorio;
import parcialturnof.personas.Director;
import parcialturnof.personas.Encargado;

public class Main {

    public static void main(String[] args) {
        Empresa empresa = new Empresa(
                "Coca Cola", 
                "Calle 2, 3019", 
                new Director("Oscar Wilde", 46645435, 2019, 100000, 5700),
                20
        );
        
        for (int i = 1; i < 10; i += 2)
            empresa.addEncargado(new Encargado(
                    GeneradorAleatorio.generarString(20), 
                    GeneradorAleatorio.generarInt(45000000),
                    GeneradorAleatorio.generarInt(23) + 2000,
                    150000,
                    GeneradorAleatorio.generarInt(20) + 1
            ), i);
        
        System.out.println(empresa.toString());
    }
    
}
