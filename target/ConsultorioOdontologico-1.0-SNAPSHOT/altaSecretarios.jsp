
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="components/header.jsp"%>
<%@include file="components/bodyPrimeraParte.jsp"%>
<h1>Alta Secretarios/as</h1>
<p>Ingrese los datos</p>
<form class="user" action="SvSecretarios" method="POST">
    <div class="form-group col">
        <div class="col-sm-6 mb-3">
            <input type="text" class="form-control form-control-user" id="dni_secretario"
                   name="dni_secretario" placeholder="DNI">
        </div>
        <div class="col-sm-6 mb-3">
            <input type="text" class="form-control form-control-user" id="nombre_secretario"
                   name="nombre_secretario" placeholder="Nombre">
        </div>
        <div class="col-sm-6 mb-3">
            <input type="text" class="form-control form-control-user" id="apellido_secretario"
                   name="apellido_secretario" placeholder="Apellido">
        </div>
        <div class="col-sm-6 mb-3">
            <input type="text" class="form-control form-control-user" id="telefono_secretario"
                   name="telefono_secretario" placeholder="Teléfono">
        </div>
        <div class="col-sm-6 mb-3">
            <input type="text" class="form-control form-control-user" id="direccion_secretario"
                   name="direccion_secretario" placeholder="Dirección">
        </div>
        <div class="col-sm-6 mb-3">
            <input type="date" class="form-control form-control-user" id="fecha_nac_secretario"
                   name="fecha_nac_secretario">
        </div>
        <div class="col-sm-6 mb-3">
            <input type="text" class="form-control form-control-user" id="sector_secretario"
                   name="sector_secretario" placeholder="Sector">
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
                   value="Secretario/a">
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
