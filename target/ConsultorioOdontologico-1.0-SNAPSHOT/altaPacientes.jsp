
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="components/header.jsp"%>
<%@include file="components/bodyPrimeraParte.jsp"%>
<h1>Alta Pacientes</h1>
<p>Ingrese los datos del paciente a crear</p>
<form class="user" action="SvPacientes" method="POST">
    <div class="form-group col">
        <div class="col-sm-6 mb-3">
            <input type="text" class="form-control form-control-user"
                   id="nombre_paciente" name="nombre_paciente" placeholder="Nombre">
        </div>
        <div class="col-sm-6 mb-3">
            <input type="text" class="form-control form-control-user" id="apellido_paciente" name="apellido_paciente"
                   placeholder="Apellido">
        </div>
        <div class="col-sm-6 mb-3">
            <input type="text" class="form-control form-control-user" id="dni_paciente" name="dni_paciente"
                   placeholder="DNI">
        </div>
        <div class="col-sm-6 mb-3">
            <input type="text" class="form-control form-control-user" id="telefono_paciente" name="telefono_paciente"
                   placeholder="Teléfono">
        </div>
        <div class="col-sm-6 mb-3">
            <input type="text" class="form-control form-control-user" id="direccion_paciente" name="direccion_paciente"
                   placeholder="Dirección">
        </div>
        <div class="col-sm-6 mb-3">
            <input type="text" class="form-control form-control-user" id="tipo_sangre_paciente" name="tipo_sangre_paciente"
                   placeholder="Tipo de sangre">
        </div>
        <div class="col-sm-6 mb-3">
            <input type="date" class="form-control form-control-user" id="fecha_nac_paciente" name="fecha_nac_paciente">
        </div>
        <div class="col-sm-6 mb-3">
            <label for="tiene_os_paciente" style="width: 100%; text-align: center;">Tiene obra social?</label>
            <input type="checkbox" class="form-control form-control-user" id="tiene_os_paciente" name="tiene_os_paciente">
        </div>
    </div>
    <!--datos del responsable en caso de que el paciente sea menor-->
    <p>Si el paciente es menor de edad, ingrese los datos del responsable</p>
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
    
    <button class="btn btn-primary btn-user btn-block" type="submit" style="width: 50%;">
        Crear paciente
    </button>
</form>
<%@include file="components/bodyFinal.jsp"%>
