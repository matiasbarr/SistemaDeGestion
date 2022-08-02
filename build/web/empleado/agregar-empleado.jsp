<%-- 
    Document   : agregar-empleado
    Created on : 06-06-2022, 17:59:50
    Author     : john-
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <jsp:include page="/WEB-INF/jspf/frameworkUI.jspf"></jsp:include>
        <script type="text/javascript" class="init" src="/Proyecto-war/funciones/funciones.js"></script>
    </head>
    <body>
        <div class="bTitulo">
            <br>
            <h1 class="titulito">Agregar Empleado</h1>
            <br>
        </div>
        <br>
        <div class="container">
            <form action="agregar" method="post" >
                
                <div class="mb-3">
                    <label for="cbx_cargo_empleado" class="form-label">Cargo del Empleado</label>
                    <select class="form-select" id="cbx_cargo_empleado" name="cbx_cargo_empleado" class="form-control">Cargos
                            <c:forEach items="${listaCargoEmpleados}" var="cargoEmpleado">
                                <option value="${cargoEmpleado.idCargoEmpleado}">${cargoEmpleado.cargoEmpleado}</option>
                            </c:forEach>    
                    </select>
                    <div id="ayudaCargoEmpleado" class="form-text">Seleccione el cargo</div>
                </div>
                
                <div class="mb-3">
                    <label for="txt_rut_empleado" class="form-label">Rut</label>
                    <input required type="number" class="form-control" placeholder="Ingrese su Rut" id="txt_rut_empleado" name="txt_rut_empleado">
                    <div id="ayudaRutEmpleado" class="form-text">Indique el rut</div>
                </div>
                
                <div class="mb-3">
                    <label for="txt_dv_empleado" class="form-label">Digito verificador</label>
                    <input required type="text" class="form-control" placeholder="Ingrese el Digito Verificador" id="txt_dv_empleado" name="txt_dv_empleado">
                    <div id="ayudaDigitoVerificador" class="form-text">Indique el digito verificador</div>
                </div>
                
                <div class="mb-3">
                    <label for="txt_nombre_empleado" class="form-label">Nombre</label>
                    <input required onkeypress="return soloLetras(event)" type="text" class="form-control" placeholder="Ingrese sus nombres" id="txt_nombre_empleado" name="txt_nombre_empleado">
                    <div id="ayudaNombreEmpleado" class="form-text">Indique el nombre del empleado</div>
                </div>
                
                <div class="mb-3">
                    <label for="txt_apellido_paterno" class="form-label" > Apellido Paterno </label>
                    <input  required onkeypress="return soloLetras(event)" type="text" class="form-control" placeholder="Ingrese su apellido Paterno" id="txt_apellido_paterno" name="txt_apellido_paterno">
                    <div id="ayudaApellidoPaternoEmpleado" class="form-text">Indique el Apellido Paterno</div>
                </div>
                
                
                
                <div class="mb-3">
                    <label for="txt_apellido_materno" class="form-label" >Apellido Materno</label>
                    <input  required onkeypress="return soloLetras(event)" type="text" class="form-control" placeholder="Ingrese su apellido Materno" id="txt_apellido_materno" name="txt_apellido_materno">
                    <div id="ayudaApellidoMaternoEmpleado" class="form-text">Indique el Apellido Materno</div>
                </div>
                
                <div class="mb-3">
                    <label for="txt_telefono_empleado" class="form-label">Telefono</label>
                    <input required onkeypress="return validarNumero(event)" type="number" class="form-control" placeholder="Ingrese su numero de telefono" id="txt_telefono_empleado" name="txt_telefono_empleado"></td>
                    
                    <div id="ayudaTelefonoEmpleado" class="form-text">Indique el telefono del empleado</div>
                </div>
                
                <div class="mb-3">
                    <label for="txt_correo_empleado" class="form-label">Correo</label>
                    <input required  type="text" class="form-control" placeholder="Ingrese su correo electronico" id="txt_correo_empleado" name="txt_correo_empleado"></td>
                    
                    <div id="ayudaCorreoEmpleado" class="form-text">Indique el correo del empleado</div>
                </div>
                
                <div class="mb-3">
                    <label for="txt_password_empleado" class="form-label" >Contraseña</label>
                    <input required type="password" class="form-control" placeholder="Ingrese su contraseña" id="txt_password_empleado" name="txt_password_empleado" >
                    <div id="ayu    daContraseñaEmpleado" class="form-text">Indique la contraseña  del empleado</div>
                </div>
                <div>
                    <button type="submit" class="btn btn-info">Agregar</button>
                </div>
                <br>
            </form>
        </div>
    </body>
    <jsp:include page="/WEB-INF/jspf/footer.jspf"></jsp:include>
</html>