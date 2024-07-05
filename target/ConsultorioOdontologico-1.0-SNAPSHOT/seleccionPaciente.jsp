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
                            <th>Tipo de sangre</th>
                            <th>Fecha de nac</th>
                            <th>Obra social</th>
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
                            <th>Tipo de sangre</th>
                            <th>Fecha de nac</th>
                            <th>Obra social</th>
                            <th style="width: 210px">Acción</th>
                        </tr>
                    </tfoot>
                    <%  List<Paciente> listaPacientes = (List) request.getSession().getAttribute("listaPacientes");
                        SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
                        
                    %>
                    <tbody>
                        <%for (Paciente pacien : listaPacientes) {
                        String fechaPaciente = formato.format(pacien.getFecha_nac());
                        %>
                        <tr>
                            <td id="id_odonto<%=pacien.getId()%>"><%=pacien.getId()%></td>
                            <td><%=pacien.getNombre()%></td>
                            <td><%=pacien.getApellido()%></td>
                            <td><%=pacien.getDni()%></td>
                            <td><%=pacien.getTelefono()%></td>
                            <td><%=pacien.getDireccion()%></td>
                            <td><%=pacien.getTipo_sangre()%></td>
                            <td><%=fechaPaciente%></td>
                            <td><%=pacien.isTiene_OS()%></td>

                            <td>
                            <form name="editar" action="SvSelectPaciente" method="POST">
                                    <button type="submit" class="btn btn-primary btn-user btn-block"; style="margin-left: 5px;">
                                        <i class="fas fa-pencil-alt"></i> Seleccionar
                                    </button>
                                    <input type="hidden" name="id_paciente" value="<%=pacien.getId()%>">

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