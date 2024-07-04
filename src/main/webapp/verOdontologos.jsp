
<%@page import="logica.Odontologo"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="logica.Paciente"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="components/header.jsp"%>
<%@ include file="components/bodyPrimeraParte.jsp"%>
<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">Ver Pacientes</h1>
    <p class="mb-4">Lista de pacientes:</p>

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
                            <th>Id</th>
                            <th>Nombre</th>
                            <th>Apellido</th>
                            <th>DNI</th>
                            <th>Telefono</th>
                            <th>Dirección</th>
                            <th>Fecha de nac</th>
                            <th>Especialidad</th>
                            <th>Hora inicio</th>
                            <th>Hora fin</th>
                            <th style="width: 210px">Acción</th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <th>Id</th>
                            <th>Nombre</th>
                            <th>Apellido</th>
                            <th>DNI</th>
                            <th>Telefono</th>
                            <th>Dirección</th>
                            <th>Fecha de nac</th>
                            <th>Especialidad</th>
                            <th>Hora inicio</th>
                            <th>Hora fin</th>
                            <th style="width: 210px">Acción</th>
                        </tr>
                    </tfoot>
                    <%  List<Odontologo> listaOdontologos = (List) request.getSession().getAttribute("listaOdontologos");
                        SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
                        
                    %>
                    <tbody>
                        <%for (Odontologo odonto : listaOdontologos) {
                        String fechaOdontologo = formato.format(odonto.getFecha_nac());
                        %>
                        <tr>
                            <td id="id_odonto<%=odonto.getId()%>"><%=odonto.getId()%></td>
                            <td><%=odonto.getNombre()%></td>
                            <td><%=odonto.getApellido()%></td>
                            <td><%=odonto.getDni()%></td>
                            <td><%=odonto.getTelefono()%></td>
                            <td><%=odonto.getDireccion()%></td>
                            <td><%=fechaOdontologo%></td>
                            <td><%=odonto.getEspecialidad()%></td>
                            <td><%=odonto.getUn_horario().getHorario_inicio() %></td>
                            <td><%=odonto.getUn_horario().getHorario_fin() %></td>
                            
                            <td style="display: flex; width: 230px;">
                                <form name="eliminar" action="SvElimOdontologos" method="POST">
                                    <button type="submit" class="btn btn-primary btn-primary btn-user btn-block" 
                                            style="background-color: red; margin-right: 5px;">
                                        <i class="fas fa-trash-alt"></i> Eliminar 
                                    </button>
                                    <input type="hidden" name="id" value="<%=odonto.getId()%>">
                                </form>

                                <form name="editar" action="SvEditOdontologos" method="GET">
                                    <button type="submit" class="btn btn-primary btn-user btn-block"; style="margin-left: 5px;">
                                        <i class="fas fa-pencil-alt"></i> Editar
                                    </button>
                                    <input type="hidden" name="id" value="<%=odonto.getId()%>">

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
