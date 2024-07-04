
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
import logica.Secretario;
import logica.Usuario;

@WebServlet(name = "SvSecretarios", urlPatterns = {"/SvSecretarios"})
public class SvSecretarios extends HttpServlet {
    Controladora control = new Controladora();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Secretario> listaSecretarios = new ArrayList<Secretario>();
        listaSecretarios = control.getSecretarios();
        HttpSession misession = request.getSession();
        misession.setAttribute("listaSecretarios", listaSecretarios);
        response.sendRedirect("verSecretarios.jsp");
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nombreUsu = request.getParameter("nombre_usuario");
        String contrasenia = request.getParameter("contrasenia");
        String rol = request.getParameter("rol");
        
        String dni = request.getParameter("dni_secretario");
        String nombre = request.getParameter("nombre_secretario");
        String apellido = request.getParameter("apellido_secretario");
        String telefono = request.getParameter("telefono_secretario");
        String direccion = request.getParameter("direccion_secretario");
        String fechaNac = request.getParameter("fecha_nac_secretario");
        String sector = request.getParameter("sector_secretario");
        
        Usuario usu = control.crearUsuario(nombreUsu, contrasenia, rol);
        control.crearSecretario(dni, nombre, apellido, telefono, direccion, fechaNac,sector , usu);
        
        response.sendRedirect("index.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
