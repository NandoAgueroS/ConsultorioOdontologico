
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.Controladora;
import logica.Secretario;


@WebServlet(name = "SvEditSecretarios", urlPatterns = {"/SvEditSecretarios"})
public class SvEditSecretarios extends HttpServlet {
    Controladora control = new Controladora();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Secretario sec = control.traerSecretario(id);
        
        HttpSession misession = request.getSession();
        misession.setAttribute("secEditar", sec);
        response.sendRedirect("editarSecretarios.jsp");
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String dni = request.getParameter("dni_secretario");
        String nombre = request.getParameter("nombre_secretario");
        String apellido = request.getParameter("apellido_secretario");
        String telefono = request.getParameter("telefono_secretario");
        String direccion = request.getParameter("direccion_secretario");
        String fechaNac = request.getParameter("fecha_nac_secretario");
        String sector = request.getParameter("sector_secretario");
        
        Secretario sec = (Secretario) request.getSession().getAttribute("secEditar");
        
        control.editarSecretario(sec, dni, nombre, apellido, telefono, direccion, 
                fechaNac, sector);
        response.sendRedirect("SvSecretarios");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
