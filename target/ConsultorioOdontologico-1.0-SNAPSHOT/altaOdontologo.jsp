
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="components/header.jsp"%>
<%@include file="components/bodyPrimeraParte.jsp"%>
<h1>Alta Odontólogos</h1>
<p>Ingrese los datos</p>
<form class="user" action="SvOdontologos" method="POST">
    <div class="form-group col">
        <div class="col-sm-6 mb-3">
            <input type="text" class="form-control form-control-user" id="dni_odontologo"
                   name="dni_odontologo" placeholder="DNI">
        </div>
        <div class="col-sm-6 mb-3">
            <input type="text" class="form-control form-control-user" id="nombre_odontologo"
                   name="nombre_odontologo" placeholder="Nombre">
        </div>
        <div class="col-sm-6 mb-3">
            <input type="text" class="form-control form-control-user" id="apellido_odontologo"
                   name="apellido_odontologo" placeholder="Apellido">
        </div>
        <div class="col-sm-6 mb-3">
            <input type="text" class="form-control form-control-user" id="telefono_odontologo"
                   name="telefono_odontologo" placeholder="Teléfono">
        </div>
        <div class="col-sm-6 mb-3">
            <input type="text" class="form-control form-control-user" id="direccion_odontologo"
                   name="direccion_odontologo" placeholder="Dirección">
        </div>
        <div class="col-sm-6 mb-3">
            <input type="date" class="form-control form-control-user" id="fecha_nac_odontologo"
                   name="fecha_nac_odontologo">
        </div>
        <div class="col-sm-6 mb-3">
            <input type="text" class="form-control form-control-user" id="especialidad_odontologo"
                   name="especialidad_odontologo" placeholder="Especialidad">
        </div>
        <div class="col-sm-6 mb-3">
            <input type="time" class="form-control form-control-user" id="hora_inicio_odontologo"
                   name="hora_inicio_odontologo">
        </div>
        <div class="col-sm-6 mb-3">
            <input type="time" class="form-control form-control-user" id="hora_fin_odontologo"
                   name="hora_fin_odontologo">
        </div>
        <!-- Acá va a ir horarios y usuarios>-->
    </div>
    <p>Ingrese los datos del usuario a crear</p>
<!--<form class="user" action="SvUsuarios" method="POST">-->
    <div class="form-group col">
        <div class="col-sm-6 mb-3">
            <input type="text" class="form-control form-control-user"
                   name="nombre_usuario" placeholder="Nombre Usuario">
        </div>
        <div class="col-sm-6 mb-3">
            <input type="password" class="form-control form-control-user" id="contrasenia" name="contrasenia"
                   placeholder="Contraseña">
        </div>
        <div class="col-sm-6 mb-3">
            <input type="hidden" class="form-control form-control-user" id="rol" name="rol"
                   value="Odontologo">
        </div>
    </div>
    
    <button class="btn btn-primary btn-user btn-block" type="submit" style="width: 50%;">
        Registrar
    </button>
<!--</form>
    <a href="#" class="btn btn-primary btn-user btn-block">
        Crear Odontólogo
    </a>-->
</form>
<%@include file="components/bodyFinal.jsp"%>
