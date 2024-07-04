package logica;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
@Entity
public class Odontologo extends Persona implements Serializable{
    
    private String especialidad;
    @OneToMany(mappedBy="odonto")
    private List<Turno> lista_turnos;
    @OneToOne
    private Usuario un_usuario;
    @OneToOne
    private Horario un_horario;
    
    public Odontologo() {
    }

    public Odontologo(String especialidad, List<Turno> lista_turnos, Usuario un_usuario, Horario un_horario, int id, String dni, String nombre, String apellido, String telefono, String direccion, Date fechaNac) {
        super(id, dni, nombre, apellido, telefono, direccion, fechaNac);
        this.especialidad = especialidad;
        this.lista_turnos = lista_turnos;
        this.un_usuario = un_usuario;
        this.un_horario = un_horario;
    }

    public String getEspecialidad() {
        return especialidad;
    }

    public void setEspecialidad(String especialidad) {
        this.especialidad = especialidad;
    }

    public List<Turno> getLista_turnos() {
        return lista_turnos;
    }

    public void setLista_turnos(List<Turno> lista_turnos) {
        this.lista_turnos = lista_turnos;
    }

    public Usuario getUn_usuario() {
        return un_usuario;
    }

    public void setUn_usuario(Usuario un_usuario) {
        this.un_usuario = un_usuario;
    }

    public Horario getUn_horario() {
        return un_horario;
    }

    public void setUn_horario(Horario un_horario) {
        this.un_horario = un_horario;
    }

    
    
    
}
