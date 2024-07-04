package logica;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import persistencia.ControladoraPersistencia;

public class Controladora {

    ControladoraPersistencia controlPersis = new ControladoraPersistencia();

    public Usuario crearUsuario(String nombreUsuario, String contrasenia, String rol) {
        Usuario usu = new Usuario();
        usu.setNombre_usuario(nombreUsuario);
        usu.setContrasenia(contrasenia);
        usu.setRol(rol);
        controlPersis.crearUsuario(usu);
        return usu;
    }

    public List<Usuario> getUsuarios() {
        return controlPersis.getUsuarios();
    }

    public void borrarUsuario(int id) {
        controlPersis.borrarUsuario(id);
    }

    public Usuario traerUsuario(int id) {
        return controlPersis.traerUsuario(id);
    }

    public void editarUsuario(Usuario usu) {
        controlPersis.editarUsuario(usu);
    }

    public boolean validarIngreso(String usuario, String contrasenia) {
        List<Usuario> listaUsuarios = new ArrayList<Usuario>();
        listaUsuarios = controlPersis.getUsuarios();
        boolean ingreso = false;
        for (Usuario usu : listaUsuarios) {
            if (usu.getNombre_usuario().equals(usuario)) {
                if (usu.getContrasenia().equals(contrasenia)) {
                    ingreso = true;
                } else {
                    ingreso = false;
                }
            }
        }
        return ingreso;

    }

    public void crearPaciente(Paciente paciente) {
        controlPersis.crearPaciente(paciente);
    }

    public void crearResponsable(Responsable responsable) {
        controlPersis.crearResponsable(responsable);
    }

    public List<Paciente> getPacientes() {
        return controlPersis.getPacientes();
    }

    public void borrarPaciente(int id) {
        controlPersis.borrarPaciente(id);
    }

    public Paciente traerPaciente(int id) {
        return controlPersis.traerPaciente(id);
    }

    public void editarResponsable(Responsable un_responsable) {
        controlPersis.editarResponsable(un_responsable);
    }

    public void editarPaciente(Paciente paciente) {
        controlPersis.editarPaciente(paciente);
    }

    public void crearOdontologo(String dni, String nombre, String apellido, String telefono, String direccion, String fechaNac, String especialidad, Usuario usu, Horario hora) {
        Odontologo odontologo = new Odontologo();
        SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
        Date fechaOdontologo;
        try {
            fechaOdontologo = formato.parse(fechaNac);
        odontologo.setFecha_nac(fechaOdontologo);
        } catch (ParseException ex) {
            Logger.getLogger(Controladora.class.getName()).log(Level.SEVERE, null, ex);
        }
        odontologo.setNombre(nombre);
        odontologo.setApellido(apellido);
        odontologo.setDni(dni);
        odontologo.setTelefono(telefono);
        odontologo.setDireccion(direccion);
        odontologo.setEspecialidad(especialidad);
        odontologo.setUn_usuario(usu);
        odontologo.setUn_horario(hora);
        
        controlPersis.crearOdontologo(odontologo);
    }

    public Horario crearHorario(String horaInicio, String horaFin) {
        Horario hora = new Horario();
        hora.setHorario_inicio(horaInicio);
        hora.setHorario_fin(horaFin);
        controlPersis.crearHorario(hora);
        return hora;
    }

    public List<Odontologo> getOdontologos() {
        return controlPersis.getOdontologos();
    }

    public void borrarOdontologo(int id) {
        controlPersis.borrarOdontologo(id);
    }

    public Odontologo traerOdontologo(int id) {
        return controlPersis.traerOdontologo(id);
    }

    public void editarOdontologo(String dni, String nombre, String apellido, 
            String telefono, String direccion, String fechaNac, String especialidad, 
            Odontologo odonto, Horario hora) {
        
        odonto.setNombre(nombre);
        odonto.setApellido(apellido);
        odonto.setDni(dni);
        odonto.setTelefono(telefono);
        odonto.setDireccion(direccion);
        odonto.setEspecialidad(especialidad);
        odonto.setUn_horario(hora);
        SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
        Date fechaOdontologo;
        
        try {
            fechaOdontologo = formato.parse(fechaNac);
            odonto.setFecha_nac(fechaOdontologo);
        } catch (ParseException ex) {
            Logger.getLogger(Controladora.class.getName()).log(Level.SEVERE, null, ex);
        }
        controlPersis.editarOdontologo(odonto);
    }

    public Horario editarHorario(Horario hora, String horaInicio, String horaFin) {
        hora.setHorario_inicio(horaInicio);
        hora.setHorario_fin(horaFin);

        controlPersis.editarHorario(hora);
        
        return hora;
    }

    public void crearSecretario(String dni, String nombre, String apellido, String telefono, String direccion, String fechaNac, String sector, Usuario usu) {
        Secretario secretario = new Secretario();
        secretario.setDni(dni);
        secretario.setNombre(nombre);
        secretario.setApellido(apellido);
        secretario.setTelefono(telefono);
        secretario.setDireccion(direccion);
        secretario.setSector(sector);
        secretario.setUn_usuario(usu);
        
        SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
        Date fechaSecretario;
        try {
            fechaSecretario = formato.parse(fechaNac);
            secretario.setFecha_nac(fechaSecretario);
        } catch (ParseException ex) {
            Logger.getLogger(Controladora.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        controlPersis.crearSecretario(secretario);
    }

    public List<Secretario> getSecretarios() {
        return controlPersis.getSecretarios();
    }

    public Secretario traerSecretario(int id) {
        return controlPersis.traerSecretario(id);
    }

    public void editarSecretario(Secretario sec, String dni, String nombre, String apellido, String telefono, String direccion, String fechaNac, String sector) {
        sec.setDni(dni);
        sec.setNombre(nombre);
        sec.setApellido(apellido);
        sec.setTelefono(telefono);
        sec.setDireccion(direccion);
        sec.setSector(sector);
        
        SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
        try {
            Date fechaSecretario = formato.parse(fechaNac);
            sec.setFecha_nac(fechaSecretario);
        } catch (ParseException ex) {
            Logger.getLogger(Controladora.class.getName()).log(Level.SEVERE, null, ex);
        }
        controlPersis.editarSecretario(sec);
    }

    public void borrarSecretario(int id) {
        controlPersis.borrarSecretario(id);
    }
}
