
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="logica.Turno"%>
<%@page import="logica.Usuario"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="components/header.jsp"%>
<%@ include file="components/bodyPrimeraParte.jsp"%>
<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">Ver todos los turnos</h1>
    <p class="mb-4">Lista de turnos:</p>

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
                            <th>Odontologo</th>
                            <!--<th>Fecha y hora</th>-->
                            <th>Afección</th>
                            <th style="width: 210px">Acción</th>
                        </tr>
                    </thead>
                    <tfoot>
                            <th>Fecha y hora</th>
                            <th>Paciente</th>
                            <th>Odontologo</th>
                            <!--<th>Fecha y hora</th>-->
                            <th>Afección</th>
                            <th style="width: 210px">Acción</th>
                    </tfoot>
                    <%
                        SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
                        List<Turno> listaTurnos = (List) request.getSession().getAttribute("listaTurnos");
                    %>
                    <tbody>
                        <%for (Turno turno : listaTurnos) {%>
                        <tr>
                            <td id="fecha_turno<%=formato.format(turno.getFecha_turno())%> <%=turno.getHora_turno()%>"><%=formato.format(turno.getFecha_turno())%> <%=turno.getHora_turno()%></td>
                            <td><%=turno.getPacien().getNombre()%> <%=turno.getPacien().getApellido()%></td>
                            <td><%=turno.getOdonto().getNombre()%> <%=turno.getOdonto().getApellido()%></td>
                            <!--<td></td>-->
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
                        <%}%>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

</div>

<%@ include file="components/bodyFinal.jsp"%>
