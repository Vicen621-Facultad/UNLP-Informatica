package estacionamiento;

public class Auto {
    private String nombre, patente;

    public Auto(String nombre, String patente) {
        this.nombre = nombre;
        this.patente = patente;
    }
    
   public String getNombre() {
       return this.nombre;
   }
   
   public void setNombre(String nombre) {
       this.nombre = nombre;
   }
   
   public String getPatente() {
       return this.patente;
   }
   
   @Override
   public String toString() {
       return "Patente: " + getPatente() + ", nombre: " + getNombre();
   }
}
