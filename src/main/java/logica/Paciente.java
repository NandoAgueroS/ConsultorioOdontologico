package logica;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
@Entity
public class Paciente extends Persona implements Serializable{
    
    private boolean tiene_OS;
    private String tipo_sangre;
    @OneToOne
    private Responsable un_responsable;
    @OneToMany(mappedBy="pacien")
    private List<Turno> lista_turnos;
    
    public Paciente() {
    }

    public Paciente(boolean tiene_OS, String tipo_sangre, Responsable un_responsable, List<Turno> lista_turnos, int id, String dni, String nombre, String apellido, String telefono, String direccion, Date fecha_nac) {
        super(id, dni, nombre, apellido, telefono, direccion, fecha_nac);
        this.tiene_OS = tiene_OS;
        this.tipo_sangre = tipo_sangre;
        this.un_responsable = un_responsable;
        this.lista_turnos = lista_turnos;
    }

    public boolean isTiene_OS() {
        return tiene_OS;
    }

    public void setTiene_OS(boolean tiene_OS) {
        this.tiene_OS = tiene_OS;
    }

    public String getTipo_sangre() {
        return tipo_sangre;
    }

    public void setTipo_sangre(String tipo_sangre) {
        this.tipo_sangre = tipo_sangre;
    }

    public Responsable getUn_responsable() {
        return un_responsable;
    }

    public void setUn_responsable(Responsable un_responsable) {
        this.un_responsable = un_responsable;
    }

    public List<Turno> getLista_turnos() {
        return lista_turnos;
    }

    public void setLista_turnos(List<Turno> lista_turnos) {
        this.lista_turnos = lista_turnos;
    }

    

}
