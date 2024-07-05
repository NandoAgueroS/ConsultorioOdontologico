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

@WebServlet(name = "SvSelectOdontologo", urlPatterns = {"/SvSelectOdontologo"})
public class SvSelectOdontologo extends HttpServlet {

    Controladora control = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Odontologo> listaOdontologos = new ArrayList<Odontologo>();
        listaOdontologos = control.getOdontologos();
        HttpSession misession = request.getSession();
        misession.setAttribute("listaOdontologos", listaOdontologos);

        response.sendRedirect("seleccionOdontologo.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int idOdontologo = Integer.parseInt(request.getParameter("id_odontologo"));
        Odontologo odontologoTurno = control.traerOdontologo(idOdontologo);
        HttpSession misession = request.getSession();
        misession.setAttribute("odontologoTurno", odontologoTurno);
        response.sendRedirect("SvSelectPaciente");

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
