
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="components/header.jsp"%>
<%@include file="components/bodyPrimeraParte.jsp"%>
<h1>Alta Usuarios</h1>
<p>Ingrese los datos del usuario a crear</p>
<form class="user" action="SvUsuarios" method="POST">
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
            <input type="text" class="form-control form-control-user" id="rol" name="rol"
                   placeholder="Rol">
        </div>
    </div>
    
    <button class="btn btn-primary btn-user btn-block" type="submit">
        Crear Usuario
    </button>
</form>
<%@include file="components/bodyFinal.jsp"%>
