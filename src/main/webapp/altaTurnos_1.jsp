<%@page import="logica.Turno"%>
<%@page import="logica.Horario"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.time.LocalTime"%>
<%@page import="logica.Paciente"%>
<%@page import="logica.Odontologo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="components/header.jsp"%>
<%@ include file="components/bodyPrimeraParte.jsp"%>
<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">Ver Usuarios</h1>
    <p class="mb-4">Lista de usuarios:</p>

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

                            <th>Odontologo</th>
                            <th>Especialidad</th>
                            <th>Paciente</th>
                            <th>Afección</th>
                            <th>Dia</th>
                            <th>Hora</th>
                            <th style="width: 210px">Acción</th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                        </tr>
                    </tfoot>
                    <%                        Odontologo odonto = (Odontologo) request.getSession().getAttribute("odontologoTurno");
                        Paciente pacien = (Paciente) request.getSession().getAttribute("pacienteTurno");
                        LocalTime horarioInicio = LocalTime.parse(odonto.getUn_horario().getHorario_inicio());
                        LocalTime horarioFin = LocalTime.parse(odonto.getUn_horario().getHorario_fin());
                        List<Turno> turnosOcupados = new ArrayList<Turno>();
                        List<LocalTime> horariosOcupados = new ArrayList<LocalTime>();
                        turnosOcupados = odonto.getLista_turnos();
                        for (Turno turnoLista : turnosOcupados) {
                                horariosOcupados.add(LocalTime.parse(turnoLista.getHora_turno()));
                                System.out.println("ocupado: "+turnoLista.getHora_turno().toString());
                            }
                        System.out.println(horarioInicio);
                        System.out.println(horarioFin);
                    %>
                    <tbody>
                        <tr>
                            <td><%=odonto.getNombre()%> <%=odonto.getApellido()%></td>
                            <td><%=odonto.getEspecialidad()%></td>
                            <td><%=pacien.getNombre()%> <%=pacien.getApellido()%></td>
                    <form name="cargarTurno" action="SvTurnos" method="POST">
                        <td><input type="text" class="form-control form-control-user" id="afeccion"
                                   name="afeccion"></td>
                        <td><input type="date" class="form-control form-control-user" id="dia_turno"
                                   name="dia_turno"></td>
                        <td> <select name="horario_turno" id="horario_turno" class="form-control form-control-user">
                                <% LocalTime horarios = horarioInicio;
                                    while(!horarios.equals(horarioFin) && horarios.isBefore(horarioFin)){
                                    System.out.println(horarios.toString());
                                    if (!horariosOcupados.contains(horarios)) {
                                %>

                                <option value="<%=horarios.toString()%>"><%=horarios.toString() %> </option>
                                <%} horarios = horarios.plusMinutes(30);}%>
                        </td>
                        <td style="display: flex; width: 230px;">
                            <button type="submit" class="btn btn-primary btn-user btn-block"; style="margin-left: 5px;">
                                <i class="fas fa-pencil-alt"></i> Guardar Turno
                            </button>

                    </form>

                    </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

</div>

<%@ include file="components/bodyFinal.jsp"%>