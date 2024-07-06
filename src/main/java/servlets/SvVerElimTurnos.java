
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
import logica.Odontologo;
import logica.Paciente;
import logica.Turno;


@WebServlet(name = "SvVerElimTurnos", urlPatterns = {"/SvVerElimTurnos"})
public class SvVerElimTurnos extends HttpServlet {
    Controladora control = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Turno> listaTurnos = new ArrayList<Turno>();
        listaTurnos = control.getTurnos();
        HttpSession misession = request.getSession();
        misession.setAttribute("listaTurnos", listaTurnos);
        response.sendRedirect("verTurnosTodos.jsp");
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int idTurno = Integer.parseInt(request.getParameter("id_turno"));
        
        control.borrarTurno(idTurno);
        response.sendRedirect("SvVerElimTurnos");


    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
