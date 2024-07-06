
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.Controladora;
import logica.Odontologo;
import logica.Turno;


@WebServlet(name = "SvFiltrarOdontologo", urlPatterns = {"/SvFiltrarOdontologo"})
public class SvFiltrarOdontologo extends HttpServlet {
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
        String idOdontologoString = request.getParameter("id_odontologo");
        Odontologo odontoSeleccionado = listaOdontologos.get(0);
        String fechaSeleccionada = request.getParameter("fecha_seleccionada");
        if (idOdontologoString!=null) {
            int idOdontologo = Integer.parseInt(idOdontologoString);
            odontoSeleccionado = control.traerOdontologo(idOdontologo);
        }
        if (fechaSeleccionada == null) {
            SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
            Date fechaActual = new Date();
            fechaSeleccionada = formato.format(fechaActual);
        }
            List<Turno> listaTurnos = control.getTurnos();
            misession.setAttribute("listaTurnos", listaTurnos);
            misession.setAttribute("fechaSeleccionada", fechaSeleccionada);
            misession.setAttribute("odontoSeleccionado", odontoSeleccionado);
        response.sendRedirect("verTurnosOdontologo.jsp");
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
