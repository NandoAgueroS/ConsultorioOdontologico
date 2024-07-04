package logica;

import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.OneToOne;
@Entity
public class Secretario extends Persona{

    private String sector;
    @OneToOne
    private Usuario un_usuario;

    public Secretario() {
    }

    public Secretario(String sector, Usuario un_usuario, int id, String dni, String nombre, String apellido, String telefono, String direccion, Date fecha_nac) {
        super(id, dni, nombre, apellido, telefono, direccion, fecha_nac);
        this.sector = sector;
        this.un_usuario = un_usuario;
    }

    public String getSector() {
        return sector;
    }

    public void setSector(String sector) {
        this.sector = sector;
    }

    public Usuario getUn_usuario() {
        return un_usuario;
    }

    public void setUn_usuario(Usuario un_usuario) {
        this.un_usuario = un_usuario;
    }

}
