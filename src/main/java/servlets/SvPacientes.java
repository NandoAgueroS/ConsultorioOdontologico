package servlets;

import java.io.IOException;
import java.io.PrintWriter;
//import java.sql.Date;
import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.Controladora;
import logica.Paciente;
import logica.Responsable;

@WebServlet(name = "SvPacientes", urlPatterns = {"/SvPacientes"})
public class SvPacientes extends HttpServlet {

    Controladora control = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Paciente> listaPacientes = new ArrayList<Paciente>();
        listaPacientes = control.getPacientes();
        
        HttpSession misession = request.getSession();
        misession.setAttribute("listaPacientes", listaPacientes);
        response.sendRedirect("verPacientes.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nombrePaciente = request.getParameter("nombre_paciente");
        String apellidoPaciente = request.getParameter("apellido_paciente");
        String dniPaciente = request.getParameter("dni_paciente");
        String telefonoPaciente = request.getParameter("telefono_paciente");
        String direccionPaciente = request.getParameter("direccion_paciente");
        String tipoSangrePaciente = request.getParameter("tipo_sangre_paciente");
        String fechaNacPacienteString = request.getParameter("fecha_nac_paciente");
        String tieneOS = request.getParameter("tiene_os_paciente");

        SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
        
        Paciente paciente = new Paciente();
        
        if (tieneOS == null) {
            paciente.setTiene_OS(false);
        } else if (tieneOS.equals("on")) {
            paciente.setTiene_OS(true);
        }
        
        try {
            Date fechaNacPaciente = (Date) formato.parse(fechaNacPacienteString);
            paciente.setFecha_nac(fechaNacPaciente);
        } catch (ParseException ex) {
            Logger.getLogger(SvPacientes.class.getName()).log(Level.SEVERE, null, ex);
        }
        paciente.setNombre(nombrePaciente);
        paciente.setApellido(apellidoPaciente);
        paciente.setDni(dniPaciente);
        paciente.setTelefono(telefonoPaciente);
        paciente.setDireccion(direccionPaciente);
        paciente.setTipo_sangre(tipoSangrePaciente);

        String nombreResponsable = request.getParameter("nombre_responsable");
        String apellidoResponsable = request.getParameter("apellido_responsable");
        String dniResponsable = request.getParameter("dni_responsable");
        String telefonoResponsable = request.getParameter("telefono_responsable");
        String direccionResponsable = request.getParameter("direccion_responsable");
        String fechaNacResponsableString = request.getParameter("fecha_nac_responsable");
        String tipoResp = request.getParameter("tipo_resp");

        if (!nombreResponsable.isBlank() && !apellidoResponsable.isBlank() && !dniResponsable.isBlank()) {
            Responsable responsable = new Responsable();
            try {
                Date fechaNacResponsable = (Date) formato.parse(fechaNacResponsableString);
                responsable.setFecha_nac(fechaNacResponsable);
            } catch (ParseException ex) {
                Logger.getLogger(SvPacientes.class.getName()).log(Level.SEVERE, null, ex);
            }
            responsable.setNombre(nombreResponsable);
            responsable.setApellido(apellidoResponsable);
            responsable.setDni(dniResponsable);
            responsable.setTelefono(telefonoResponsable);
            responsable.setDireccion(direccionResponsable);
            responsable.setTipoResp(tipoResp);
            control.crearResponsable(responsable);

            paciente.setUn_responsable(responsable);
        }

        control.crearPaciente(paciente);
        response.sendRedirect("index.jsp");

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
