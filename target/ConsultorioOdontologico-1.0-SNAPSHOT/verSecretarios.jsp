
<%@page import="logica.Secretario"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="components/header.jsp"%>
<%@ include file="components/bodyPrimeraParte.jsp"%>
<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">Ver Secretarios</h1>
    <p class="mb-4">Lista de secretarios:</p>

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
                            <th>Sector</th>
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
                            <th>Sector</th>
                            <th style="width: 210px">Acción</th>
                        </tr>
                    </tfoot>
                    <%  List<Secretario> listaSecretarios = (List) request.getSession().getAttribute("listaSecretarios");
                        SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
                        
                    %>
                    <tbody>
                        <%for (Secretario sec : listaSecretarios) {
                        String fechaSecretario = formato.format(sec.getFecha_nac());
                        %>
                        <tr>
                            <td id="id_odonto<%=sec.getId()%>"><%=sec.getId()%></td>
                            <td><%=sec.getNombre()%></td>
                            <td><%=sec.getApellido()%></td>
                            <td><%=sec.getDni()%></td>
                            <td><%=sec.getTelefono()%></td>
                            <td><%=sec.getDireccion()%></td>
                            <td><%=fechaSecretario%></td>
                            <td><%=sec.getSector()%></td>
                            
                            <td style="display: flex; width: 230px;">
                                <form name="eliminar" action="SvElimSecretarios" method="POST">
                                    <button type="submit" class="btn btn-primary btn-primary btn-user btn-block" 
                                            style="background-color: red; margin-right: 5px;">
                                        <i class="fas fa-trash-alt"></i> Eliminar 
                                    </button>
                                    <input type="hidden" name="id" value="<%=sec.getId()%>">
                                </form>

                                <form name="editar" action="SvEditSecretarios" method="GET">
                                    <button type="submit" class="btn btn-primary btn-user btn-block"; style="margin-left: 5px;">
                                        <i class="fas fa-pencil-alt"></i> Editar
                                    </button>
                                    <input type="hidden" name="id" value="<%=sec.getId()%>">

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
