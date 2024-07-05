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
import logica.Paciente;

@WebServlet(name = "SvSelectPaciente", urlPatterns = {"/SvSelectPaciente"})
public class SvSelectPaciente extends HttpServlet {

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
        
        response.sendRedirect("seleccionPaciente.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int idPaciente = Integer.parseInt(request.getParameter("id_paciente"));
        Paciente pacienteTurno = control.traerPaciente(idPaciente);
        HttpSession misession = request.getSession();
        
        misession.setAttribute("pacienteTurno", pacienteTurno);
        
        response.sendRedirect("SvTurnos");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
