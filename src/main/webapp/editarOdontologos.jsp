
<%@page import="logica.Odontologo"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="logica.Paciente"%>
<%@page import="logica.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="components/header.jsp"%>
<%@include file="components/bodyPrimeraParte.jsp"%>
<h1>Edición de Odontologos</h1>
<p>Modifique el Odontologo</p>
<% Odontologo odonto = (Odontologo) request.getSession().getAttribute("odontoEditar");
    SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
    String fechaOdontologo = formato.format(odonto.getFecha_nac());
%>
<form class="user" action="SvEditOdontologos" method="POST">
    <div class="form-group col">
        <div class="col-sm-6 mb-3">
            <input type="text" class="form-control form-control-user" id="dni_odontologo"
                   name="dni_odontologo" value="<%=odonto.getDni()%>" >
        </div>
        <div class="col-sm-6 mb-3">
            <input type="text" class="form-control form-control-user" id="nombre_odontologo"
                   name="nombre_odontologo" value="<%=odonto.getNombre()%>" >
        </div>
        <div class="col-sm-6 mb-3">
            <input type="text" class="form-control form-control-user" id="apellido_odontologo"
                   name="apellido_odontologo" value="<%=odonto.getApellido()%>">
        </div>
        <div class="col-sm-6 mb-3">
            <input type="text" class="form-control form-control-user" id="telefono_odontologo"
                   name="telefono_odontologo" value="<%=odonto.getTelefono()%>">
        </div>
        <div class="col-sm-6 mb-3">
            <input type="text" class="form-control form-control-user" id="direccion_odontologo"
                   name="direccion_odontologo" value="<%=odonto.getDireccion()%>">
        </div>
        <div class="col-sm-6 mb-3">
            <input type="date" class="form-control form-control-user" id="fecha_nac_odontologo"
                   name="fecha_nac_odontologo" value="<%=fechaOdontologo%>">
        </div>
        <div class="col-sm-6 mb-3">
            <input type="text" class="form-control form-control-user" id="especialidad_odontologo"
                   name="especialidad_odontologo" value="<%=odonto.getEspecialidad()%>">
        </div>
        <div class="col-sm-6 mb-3">
            <input type="time" class="form-control form-control-user" id="hora_inicio_odontologo"
                   name="hora_inicio_odontologo" value="<%=odonto.getUn_horario().getHorario_inicio()%>">
        </div>
        <div class="col-sm-6 mb-3">
            <input type="time" class="form-control form-control-user" id="hora_fin_odontologo"
                   name="hora_fin_odontologo" value="<%=odonto.getUn_horario().getHorario_fin()%>">
        </div>
    </div>

    <button class="btn btn-primary btn-user btn-block" type="submit" style="width: 50%;">
        Guardar Modificación
    </button>
</form>
<%@include file="components/bodyFinal.jsp"%>
