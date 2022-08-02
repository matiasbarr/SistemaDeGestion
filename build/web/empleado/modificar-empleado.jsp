<%-- 
    Document   : modificar-empleado
    Created on : 06-06-2022, 18:00:20
    Author     : john-
--%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <jsp:include page="/WEB-INF/jspf/frameworkUI.jspf"></jsp:include>
    </head>
    <body>
        <br>
        <div class="titulo">
            <br>
            <h1 class="titulito">Modificar Empleado</h1>
            <br>
        </div>
        
        <div class="container">
            <form action="modificar" method="post" >
            <input type="hidden" id="hdn_id_empleado" name="hdn_id_empleado" value="${emp.idEmpleado}">
                <table class="table table-hover table-light">
                           <tr>
                        <td>Cargo de Empleado: </td>
                        <td><select class="form-select" id="cbx_cargo_empleado" name="cbx_cargo_empleado" class="form-control">Cargos
                            <c:forEach items="${listaCargoEmpleados}" var="cargoEmpleado">
                                <option value="${cargoEmpleado.idCargoEmpleado}">${cargoEmpleado.cargoEmpleado}</option>
                            </c:forEach>    
                            </select></td>
                    </tr>
                                        
                    <tr>
                        <td>Rut: </td>
                        <td><input type="number" value="${emp.rutEmpleado}" class="form-control" placeholder="Ingrese su Rut" id="txt_rut_empleado" name="txt_rut_empleado"></td>
                    </tr>
                    <tr>
                        <td>DV: </td>
                        <td><input type="text" value="${emp.dvEmpleado}" class="form-control" placeholder="Ingrese el Digito Verificador" id="txt_dv_empleado" name="txt_dv_empleado"></td>
                    </tr>
                    <tr>
                        <td>Nombres: </td>  
                        <td><input type="text" value="${emp.nombreEmpleado}" class="form-control" placeholder="Ingrese sus nombres" id="txt_nombre_empleado" name="txt_nombre_empleado"></td>
                    </tr>
                    <tr>
                        <td>Apellido Paterno: </td>
                        <td><input type="text" value="${emp.apellidoPaterno}" class="form-control" placeholder="Ingrese su apellido paterno" id="txt_apellido_paterno" name="txt_apellido_paterno"></td>
                    </tr> 
                    <tr>
                        <td>Apellido Materno: </td>
                        <td><input type="text" value="${emp.apellidoMaterno}" class="form-control" placeholder="Ingrese su apellido Materno" id="txt_apellido_materno" name="txt_apellido_materno"></td>
                    </tr> 
                    <tr>
                        <td>Telefono: </td>
                        <td><input type="number" value="${emp.telefonoEmpleado}" class="form-control" placeholder="Ingrese su numero de telefono" id="txt_telefono_empleado" name="txt_telefono_empleado"></td>
                    </tr> 
                    <tr>
                        <td>Correo: </td>
                        <td><input type="text"  value="${emp.correoEmpleado}"  class="form-control" placeholder="Ingrese su correo" id="txt_correo_empleado" name="txt_correo_empleado"></td>
                    </tr> 
                    <div class="button">
                    <tr>                        
                        <td><button type="submit" class="btn btn-info">Modificar</button></td>
                    </tr>
                    </div>
                </table>
            </form>
        </div>
    </body>
    <jsp:include page="/WEB-INF/jspf/footer.jspf"></jsp:include>
</html>
