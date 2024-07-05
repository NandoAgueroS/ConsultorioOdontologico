package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
import logica.Odontologo;
import logica.Paciente;
import logica.Turno;

@WebServlet(name = "SvTurnos", urlPatterns = {"/SvTurnos"})
public class SvTurnos extends HttpServlet {

    Controladora control = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String fechaTurno = request.getParameter("dia_turno");
        SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
        HttpSession misession = request.getSession();
        System.out.println("Fecha en servlet: "+fechaTurno);
        if (fechaTurno != null) {            
            misession.setAttribute("fechaTurno", fechaTurno);
//        response.sendRedirect("SvTurnos");
        } else {
            fechaTurno = formato.format(new Date());
            misession.setAttribute("fechaTurno", fechaTurno);
        }
        response.sendRedirect("altaTurnos.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Odontologo odontoTurno = (Odontologo) request.getSession().getAttribute("odontologoTurno");
        Paciente pacienTurno = (Paciente) request.getSession().getAttribute("pacienteTurno");
        String afeccionPaciente = request.getParameter("afeccion");
        String hora = request.getParameter("horario_turno");
        String dia = request.getParameter("dia_turno");
        Turno agregarTurno = control.crearTurno(odontoTurno, pacienTurno, afeccionPaciente, hora, dia);

        pacienTurno.getLista_turnos().add(agregarTurno);

        control.editarPaciente(pacienTurno);
        odontoTurno = control.editarTurnosOdontologo(odontoTurno, agregarTurno);
        response.sendRedirect("index.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
