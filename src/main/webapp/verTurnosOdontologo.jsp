
<%@page import="java.util.Date"%>
<%@page import="logica.Odontologo"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="logica.Turno"%>
<%@page import="logica.Usuario"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="components/header.jsp"%>
<%@ include file="components/bodyPrimeraParte.jsp"%>
<%                        List<Odontologo> listaOdontologos = (List) request.getSession().getAttribute("listaOdontologos");
    Odontologo odonto = (Odontologo) request.getSession().getAttribute("odontoSeleccionado");
    List<Turno> listaTurnos = odonto.getLista_turnos();
    String fechaSeleccionada = (String) request.getSession().getAttribute("fechaSeleccionada");
    SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
    Date dateSeleccionada = formato.parse(fechaSeleccionada);
    int cantidadTurnosDia=0;
    List<Turno> listaTodosLosTurnos = (List) request.getSession().getAttribute("listaTurnos");
    for (Turno turnosListados : listaTodosLosTurnos) {
            if (dateSeleccionada.equals(turnosListados.getFecha_turno())) {
                    cantidadTurnosDia++;
                }
        }
%>
<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">Ver todos los turnos</h1>
    <p class="mb-4">Lista de turnos:</p>
    <form name="elejir_odontologo" action="SvFiltrarOdontologo" method="GET" style="width:20%; margin-bottom:20px;">
        <select name="id_odontologo" id="id_odontologo" class="form-control form-control-user">
            <option value="<%=odonto.getId()%>"><%=odonto.getNombre()%> <%=odonto.getApellido()%></option>
            <%
            for (Odontologo odontoS : listaOdontologos) {
            if (odontoS.getId() != odonto.getId()) {
                    
                
                    %>
                    <option value="<%=odontoS.getId() %>"><%=odontoS.getNombre()%> <%=odontoS.getApellido()%></option>
                <%}}%>
        </select>
        <input type="date" class="form-control form-control-user" id="fecha_seleccionada" 
                                           name="fecha_seleccionada" value="<%=fechaSeleccionada%>" >
        <button type="submit" class="btn btn-primary btn-user btn-block" 
                style="background-color: green; margin-top:10px;">
             Elegir 
        </button>
    </form>

            <h4 class="m-0 font-weight-bold text-primary">Turnos de la fecha: <%= cantidadTurnosDia%></h4>
    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th>Fecha y hora</th>
                            <th>Paciente</th>
                            <th>Afección</th>
                            <th style="width: 210px">Acción</th>
                        </tr>
                    </thead>
                    <tfoot>
                    <th>Fecha y hora</th>
                    <th>Paciente</th>
                    <th>Afección</th>
                    <th style="width: 210px">Acción</th>
                    </tfoot>
                    <tbody>
                        <%for (Turno turno : listaTurnos) {

                        if (dateSeleccionada.equals(turno.getFecha_turno())) {
                                
                            
                            %>
                        <tr>
                            <td id="fecha_turno<%=turno.getHora_turno()%>"><%=turno.getHora_turno()%></td>
                            <td><%=turno.getPacien().getNombre()%> <%=turno.getPacien().getApellido()%></td>
                            <td><%=turno.getAfeccion()%></td>

                            <td style="display: flex; width: 230px;">
                                <form name="eliminar" action="SvVerElimTurnos" method="POST">
                                    <button type="submit" class="btn btn-primary btn-primary btn-user btn-block" 
                                            style="background-color: red; margin-right: 5px;">
                                        <i class="fas fa-trash-alt"></i> Eliminar 
                                    </button>
                                    <input type="hidden" name="id_turno" value="<%=turno.getId_turno()%>">
                                </form>

                            </td>
                        </tr>
                        <%}}%>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

</div>

<%@ include file="components/bodyFinal.jsp"%>
