<%-- 
    Document   : listar-empleado
    Created on : 06-06-2022, 18:00:09
    Author     : john-
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="/WEB-INF/jspf/frameworkUI.jspf"></jsp:include>
        
    </head>
    <body>
        <div class="bTitulo">
                    <br>
                    <h1 class="titulito">Ver Empleados</h1>
                    <br>
                </div>
        <div class="container">
            <table id="myTable" class="table table-hover table-light">
                    <input onkeypress="return validarNumero(event)" type="text" id="myInput" onkeyup="myFunction()" placeholder="Buscar por ID">
                    <a href="/Proyecto-war/empleado/poblar">
                        <input type="button" 
                               class="btn btn-success" 
                               id="btnAgregarSubCat" 
                               value="Agregar Empleado"
                               ></a>
                <br>
                <br>
                <thead class="thead-dark">
                    <tr>
                        <th scope="col">ID Empleado</th>
                        <th scope="col">Cargo de Empleado</th>
                        <th scope="col">Rut</th>
                        <th scope="col">DV</th>
                        <th scope="col">Nombres</th>
                        <th scope="col">Apellido Paterno</th>
                        <th scope="col">Apellido Materno</th>
                        <th scope="col">Telefono</th>
                        <th scope="col">Correo</th>
                        <th scope="col">Fecha de contrato</th>
                        <th scope="col">Acciones</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach items="${listaEmpleados}" var="empleado">
                    <tr>
                        <td>${empleado.idEmpleado}</td>
                        <td>${empleado.idCargoEmpleado.cargoEmpleado}</td>
                        <td>${empleado.rutEmpleado}</td>
                        <td>${empleado.dvEmpleado}</td>
                        <td>${empleado.nombreEmpleado}</td>
                        <td>${empleado.apellidoPaterno}</td>
                        <td>${empleado.apellidoMaterno}</td>
                        <td>${empleado.telefonoEmpleado}</td>
                        <td>${empleado.correoEmpleado}</td>
                        <td>${empleado.fechaContrato}</td>
                        <td><a href="buscar?id=${empleado.idEmpleado}" class="btn btn-warning">Modificar</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    </body>
    <jsp:include page="/WEB-INF/jspf/footer.jspf"></jsp:include>
</html>