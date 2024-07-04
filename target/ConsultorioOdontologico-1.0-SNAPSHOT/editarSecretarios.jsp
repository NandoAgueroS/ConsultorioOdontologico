
<%@page import="logica.Secretario"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="components/header.jsp"%>
<%@include file="components/bodyPrimeraParte.jsp"%>
<h1>Edición de Secretarios</h1>
<p>Modifique el/la secretario/a</p>
<% Secretario sec = (Secretario) request.getSession().getAttribute("secEditar");
    SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
    String fechaSecretario = formato.format(sec.getFecha_nac());
%>
<form class="user" action="SvEditSecretarios" method="POST">
    <div class="form-group col">
        <div class="col-sm-6 mb-3">
            <input type="text" class="form-control form-control-user" id="dni_secretario"
                   name="dni_secretario" value="<%=sec.getDni()%>" >
        </div>
        <div class="col-sm-6 mb-3">
            <input type="text" class="form-control form-control-user" id="nombre_secretario"
                   name="nombre_secretario" value="<%=sec.getNombre()%>" >
        </div>
        <div class="col-sm-6 mb-3">
            <input type="text" class="form-control form-control-user" id="apellido_secretario"
                   name="apellido_secretario" value="<%=sec.getApellido()%>">
        </div>
        <div class="col-sm-6 mb-3">
            <input type="text" class="form-control form-control-user" id="telefono_secretario"
                   name="telefono_secretario" value="<%=sec.getTelefono()%>">
        </div>
        <div class="col-sm-6 mb-3">
            <input type="text" class="form-control form-control-user" id="direccion_secretario"
                   name="direccion_secretario" value="<%=sec.getDireccion()%>">
        </div>
        <div class="col-sm-6 mb-3">
            <input type="date" class="form-control form-control-user" id="fecha_nac_secretario"
                   name="fecha_nac_secretario" value="<%=fechaSecretario%>">
        </div>
        <div class="col-sm-6 mb-3">
            <input type="text" class="form-control form-control-user" id="sector_secretario"
                   name="sector_secretario" value="<%=sec.getSector()%>">
        </div>

    </div>

    <button class="btn btn-primary btn-user btn-block" type="submit" style="width: 50%;">
        Guardar Modificación
    </button>
</form>
<%@include file="components/bodyFinal.jsp"%>
