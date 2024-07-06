
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="logica.Paciente"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="components/header.jsp"%>
<%@ include file="components/bodyPrimeraParte.jsp"%>
<%  List<Paciente> listaPacientes = (List) request.getSession().getAttribute("listaPacientes");
    SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
    int cantidadConObraSocial = 0;
    int cantidadSinObraSocial = 0;
    for (Paciente pacienteListado : listaPacientes) {
        if (pacienteListado.isTiene_OS()) {
            cantidadConObraSocial++;
        } else {

            cantidadSinObraSocial++;
        }
    }
%>
<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">Ver Pacientes</h1>
    <p class="mb-4">Lista de pacientes:</p>

            <h4 class="m-0 font-weight-bold text-primary">Con Obra Social: <%= cantidadConObraSocial%> <hr>
                Sin Obra Social: <%= cantidadSinObraSocial%></h4>
                <hr>
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
                            <th>Responsable</th>
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
                            <th>Responsable</th>
                            <th style="width: 210px">Acción</th>
                        </tr>
                    </tfoot>
                    <tbody>
                        <%for (Paciente paci : listaPacientes) {
                                String fechaPaciente = formato.format(paci.getFecha_nac());
                        %>
                        <tr>
                            <td id="id_paci<%=paci.getId()%>"><%=paci.getId()%></td>
                            <td><%=paci.getNombre()%></td>
                            <td><%=paci.getApellido()%></td>
                            <td><%=paci.getDni()%></td>
                            <td><%=paci.getTelefono()%></td>
                            <td><%=paci.getDireccion()%></td>
                            <td><%=paci.getTipo_sangre()%></td>
                            <td><%=fechaPaciente%></td>
                            <td><%=paci.isTiene_OS()%></td>
                            <%if (paci.getUn_responsable() != null) {%>
                            <td><%=paci.getUn_responsable().getNombre()%> <%=paci.getUn_responsable().getApellido()%></td>
                            <%} else {%>
                            <td>No tiene</td>
                            <%};%>
                            <td style="display: flex; width: 230px;">
                                <form name="eliminar" action="SvElimPacientes" method="POST">
                                    <button type="submit" class="btn btn-primary btn-primary btn-user btn-block" 
                                            style="background-color: red; margin-right: 5px;">
                                        <i class="fas fa-trash-alt"></i> Eliminar 
                                    </button>
                                    <input type="hidden" name="id" value="<%=paci.getId()%>">
                                </form>

                                <form name="editar" action="SvEditPacientes" method="GET">
                                    <button type="submit" class="btn btn-primary btn-user btn-block"; style="margin-left: 5px;">
                                        <i class="fas fa-pencil-alt"></i> Editar
                                    </button>
                                    <input type="hidden" name="id" value="<%=paci.getId()%>">

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
