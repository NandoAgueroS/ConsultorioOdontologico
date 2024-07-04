
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.Controladora;
import logica.Horario;
import logica.Odontologo;
import logica.Usuario;


@WebServlet(name = "SvOdontologos", urlPatterns = {"/SvOdontologos"})
public class SvOdontologos extends HttpServlet {
    Controladora control = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Odontologo> listaOdontologos = new ArrayList<Odontologo>();
        listaOdontologos=control.getOdontologos();
        HttpSession misession = request.getSession();
        misession.setAttribute("listaOdontologos", listaOdontologos);
        response.sendRedirect("verOdontologos.jsp");
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nombreUsu = request.getParameter("nombre_usuario");
        String contrasenia = request.getParameter("contrasenia");
        String rol = request.getParameter("rol");
        
        String dni = request.getParameter("dni_odontologo");
        String nombre = request.getParameter("nombre_odontologo");
        String apellido = request.getParameter("apellido_odontologo");
        String telefono = request.getParameter("telefono_odontologo");
        String direccion = request.getParameter("direccion_odontologo");
        String fechaNac = request.getParameter("fecha_nac_odontologo");
        String especialidad = request.getParameter("especialidad_odontologo");
        String horaInicio = request.getParameter("hora_inicio_odontologo");
        String horaFin = request.getParameter("hora_fin_odontologo");
        
        Usuario usu = control.crearUsuario(nombreUsu, contrasenia, rol);
        Horario hora = control.crearHorario(horaInicio, horaFin);
        control.crearOdontologo(dni, nombre, apellido, telefono, direccion, fechaNac, especialidad, usu, hora);

        response.sendRedirect("index.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
