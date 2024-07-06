
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="logica.Paciente"%>
<%@page import="logica.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="components/header.jsp"%>
<%@include file="components/bodyPrimeraParte.jsp"%>
<h1>Edición de Usuarios</h1>
<p>Modifique el usuario</p>
<% Paciente paci = (Paciente) request.getSession().getAttribute("paciEditar");
    SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
    String fechaPaciente = formato.format(paci.getFecha_nac());
%>
<form class="user" action="SvEditPacientes" method="POST">
    <div class="form-group col">
        <div class="col-sm-6 mb-3">
            <input type="text" class="form-control form-control-user"
                   id="nombre_paciente" name="nombre_paciente" value="<%=paci.getNombre()%>">
        </div>
        <div class="col-sm-6 mb-3">
            <input type="text" class="form-control form-control-user" id="apellido_paciente" name="apellido_paciente"
                   value="<%=paci.getApellido()%>">
        </div>
        <div class="col-sm-6 mb-3">
            <input type="text" class="form-control form-control-user" id="dni_paciente" name="dni_paciente"
                   value="<%=paci.getDni()%>">
        </div>
        <div class="col-sm-6 mb-3">
            <input type="text" class="form-control form-control-user" id="telefono_paciente" name="telefono_paciente"
                   value="<%=paci.getTelefono()%>">
        </div>
        <div class="col-sm-6 mb-3">
            <input type="text" class="form-control form-control-user" id="direccion_paciente" name="direccion_paciente"
                   value="<%=paci.getDireccion()%>">
        </div>
        <div class="col-sm-6 mb-3">
            <input type="text" class="form-control form-control-user" id="tipo_sangre_paciente" name="tipo_sangre_paciente"
                   value="<%=paci.getTipo_sangre()%>">
        </div>
        <div class="col-sm-6 mb-3">
            <input type="date" class="form-control form-control-user" id="fecha_nac_paciente" name="fecha_nac_paciente" 
                   value="<%=fechaPaciente%>">
        </div>
        <div class="col-sm-6 mb-3">
            <label for="tiene_os_paciente" style="width: 100%; text-align: center;">Tiene obra social?</label>
            <input type="checkbox" class="form-control form-control-user" id="tiene_os_paciente" name="tiene_os_paciente" 
                   <%if(paci.isTiene_OS()){%>checked="checked"<%}%>">
        </div>
    </div>
    <!--datos del responsable en caso de que el paciente sea menor-->
    <p>Si el paciente es menor de edad, ingrese los datos del responsable</p>
    <%if (paci.getUn_responsable()!= null) {
    String fechaResponsable = formato.format(paci.getUn_responsable().getFecha_nac());%>
    <div class="form-group col">
        <div class="col-sm-6 mb-3">
            <input type="text" class="form-control form-control-user"
                   id="nombre_responsable" name="nombre_responsable" value="<%=paci.getUn_responsable().getNombre()%>">
        </div>
        <div class="col-sm-6 mb-3">
            <input type="text" class="form-control form-control-user" id="apellido_responsable" name="apellido_responsable"
                   value="<%=paci.getUn_responsable().getApellido()%>">
        </div>
        <div class="col-sm-6 mb-3">
            <input type="text" class="form-control form-control-user" id="dni_responsable" name="dni_responsable"
                   value="<%=paci.getUn_responsable().getDni()%>">
        </div>
        <div class="col-sm-6 mb-3">
            <input type="text" class="form-control form-control-user" id="telefono_responsable" name="telefono_responsable"
                   value="<%=paci.getUn_responsable().getTelefono()%>">
        </div>
        <div class="col-sm-6 mb-3">
            <input type="text" class="form-control form-control-user" id="direccion_responsable" name="direccion_responsable"
                   value="<%=paci.getUn_responsable().getDireccion()%>">
        </div>
        <div class="col-sm-6 mb-3">
            <input type="date" class="form-control form-control-user" id="fecha_nac_responsable" name="fecha_nac_responsable" 
                   value="<%=fechaResponsable%>">
        </div>
        <div class="col-sm-6 mb-3">
            <input type="text" class="form-control form-control-user" id="tipo_resp" name="tipo_resp"
                   value="<%=paci.getUn_responsable().getTipoResp()%>">
        </div>
    </div>
    <%} else {%>
    <div class="form-group col">
        <div class="col-sm-6 mb-3">
            <input type="text" class="form-control form-control-user"
                   id="nombre_responsable" name="nombre_responsable" placeholder="Nombre del responsable">
        </div>
        <div class="col-sm-6 mb-3">
            <input type="text" class="form-control form-control-user" id="apellido_responsable" name="apellido_responsable"
                   placeholder="Apellido">
        </div>
        <div class="col-sm-6 mb-3">
            <input type="text" class="form-control form-control-user" id="dni_responsable" name="dni_responsable"
                   placeholder="DNI">
        </div>
        <div class="col-sm-6 mb-3">
            <input type="text" class="form-control form-control-user" id="telefono_responsable" name="telefono_responsable"
                   placeholder="Teléfono">
        </div>
        <div class="col-sm-6 mb-3">
            <input type="text" class="form-control form-control-user" id="direccion_responsable" name="direccion_responsable"
                   placeholder="Dirección">
        </div>
        <div class="col-sm-6 mb-3">
            <input type="date" class="form-control form-control-user" id="fecha_nac_responsable" name="fecha_nac_responsable">
        </div>
        <div class="col-sm-6 mb-3">
            <input type="text" class="form-control form-control-user" id="tipo_resp" name="tipo_resp"
                   placeholder="Tipo de responsabilidad">
        </div>
    </div>
    <%}%>
    <button class="btn btn-primary btn-user btn-block" type="submit" style="width: 50%;">
        Guardar Modificación
    </button>
</form>
<%@include file="components/bodyFinal.jsp"%>
