package persistencia;

import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import logica.Horario;
import logica.Odontologo;
import logica.Paciente;
import logica.Responsable;
import logica.Secretario;
import logica.Turno;
import logica.Usuario;
import persistencia.exceptions.NonexistentEntityException;

public class ControladoraPersistencia {
    HorarioJpaController horarioJPA = new HorarioJpaController();
    OdontologoJpaController odontologoJPA = new OdontologoJpaController();
    PacienteJpaController pacienteJPA  = new PacienteJpaController();
    ResponsableJpaController responsableJPA = new ResponsableJpaController();
    SecretarioJpaController secretarioJPA = new SecretarioJpaController();
    TurnoJpaController turnoJPA = new TurnoJpaController();
    UsuarioJpaController usuarioJPA = new UsuarioJpaController();

    public void crearUsuario(Usuario usu) {
        usuarioJPA.create(usu);
    }

    public List<Usuario> getUsuarios() {
        return usuarioJPA.findUsuarioEntities();
    }

    public void borrarUsuario(int id) {
        try {
            usuarioJPA.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Usuario traerUsuario(int id) {
        return usuarioJPA.findUsuario(id);
    }

    public void editarUsuario(Usuario usu) {
        try {
            usuarioJPA.edit(usu);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void crearPaciente(Paciente paciente) {
        pacienteJPA.create(paciente);
    }

    public void crearResponsable(Responsable responsable) {
        responsableJPA.create(responsable);
    }

    public List<Paciente> getPacientes() {
       return pacienteJPA.findPacienteEntities();
    }

    public void borrarPaciente(int id) {
        try {
            pacienteJPA.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Paciente traerPaciente(int id) {
        return pacienteJPA.findPaciente(id);
    }

    public void editarResponsable(Responsable un_responsable) {
        try {
            responsableJPA.edit(un_responsable);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void editarPaciente(Paciente paciente) {
        try {
            pacienteJPA.edit(paciente);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void crearHorario(Horario hora) {
        horarioJPA.create(hora);
    }

    public void crearOdontologo(Odontologo odontologo) {
        odontologoJPA.create(odontologo);
    }

    public List<Odontologo> getOdontologos() {
        return odontologoJPA.findOdontologoEntities();
    }

    public void borrarOdontologo(int id) {
        try {
            odontologoJPA.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Odontologo traerOdontologo(int id) {
        return odontologoJPA.findOdontologo(id);
    }

    public void editarOdontologo(Odontologo odonto) {
        try {
            odontologoJPA.edit(odonto);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void editarHorario(Horario hora) {
        try {
            horarioJPA.edit(hora);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void crearSecretario(Secretario secretario) {
        secretarioJPA.create(secretario);
    }

    public List<Secretario> getSecretarios() {
        return secretarioJPA.findSecretarioEntities();
    }

    public Secretario traerSecretario(int id) {
        return secretarioJPA.findSecretario(id);
    }

    public void editarSecretario(Secretario sec) {
        try {
            secretarioJPA.edit(sec);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void borrarSecretario(int id) {
        try {
            secretarioJPA.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void crearTurno(Turno turno) {
        turnoJPA.create(turno);
    }

    public void borrarTurno(int id_turno) {
        try {
            turnoJPA.destroy(id_turno);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void borrarResponsable(int id) {
        try {
            responsableJPA.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void borrarHorario(int idHorario) {
        try {
            horarioJPA.destroy(idHorario);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<Turno> getTurnos() {
        return turnoJPA.findTurnoEntities();
    }

    public Turno traerTurno(int idTurno) {
        return turnoJPA.findTurno(idTurno);
    }

    
    
}
