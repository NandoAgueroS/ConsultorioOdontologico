package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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

@WebServlet(name = "SvEditPacientes", urlPatterns = {"/SvEditPacientes"})
public class SvEditPacientes extends HttpServlet {

    Controladora control = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Paciente paci = control.traerPaciente(id);
        HttpSession misession = request.getSession();
        misession.setAttribute("paciEditar", paci);
        response.sendRedirect("editarPacientes.jsp");
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
        
        Paciente paciente = (Paciente) request.getSession().getAttribute("paciEditar");
        
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

        if (paciente.getUn_responsable()==null && nombreResponsable != null && apellidoResponsable !=null 
                && fechaNacResponsableString != null && !fechaNacResponsableString.equals("")) {
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
        }else if (!fechaNacResponsableString.equals("")){
            try {
                Date fechaNacResponsable = (Date) formato.parse(fechaNacResponsableString);
                paciente.getUn_responsable().setFecha_nac(fechaNacResponsable);
            } catch (ParseException ex) {
                Logger.getLogger(SvPacientes.class.getName()).log(Level.SEVERE, null, ex);
            }
            paciente.getUn_responsable().setNombre(nombreResponsable);
            paciente.getUn_responsable().setApellido(apellidoResponsable);
            paciente.getUn_responsable().setDni(dniResponsable);
            paciente.getUn_responsable().setTelefono(telefonoResponsable);
            paciente.getUn_responsable().setDireccion(direccionResponsable);
            paciente.getUn_responsable().setTipoResp(tipoResp);
            control.editarResponsable(paciente.getUn_responsable());
        }
        control.editarPaciente(paciente);
        response.sendRedirect("SvPacientes");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
