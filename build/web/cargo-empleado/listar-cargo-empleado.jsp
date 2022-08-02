<%-- 
    Document   : listar-cargo-empleado
    Created on : 15-05-2022, 18:40:28
    Author     : john-
--%>

<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de cargos de los empleados</title>
        <jsp:include page="/WEB-INF/jspf/frameworkUI.jspf"></jsp:include>

        </head>
        <body>
            <br>
            <div class="container">

                <div class="bTitulo">
                    <br>
                    <h1 class="titulito">CARGOS</h1>
                    <br>
                </div>
                <br><!-- comment -->
                <table id="myTable" class="table table-hover table-light">
                        <input onkeypress="return validarNumero(event)" type="text" id="myInput" onkeyup="myFunction()" placeholder="Buscar por ID">
                        <a href="agregar-cargo-empleado.jsp">
                            <input  type="button" 
                                   class="btn btn-success" 
                                   id="btnAgregarSubCat" 
                                   value="Agregar Cargo Empleado"
                                   ></a>
                    <br>
                    <br>
                    <thead class="thead-dark">
                        <tr>
                            <th scope="col"> ID  </th>
                            <th scope="col"> CARGO</th>
                            <th scope="col"> OPCIONES </th>
                        </tr>
                    </thead>
                    <tbody> 
                    <c:forEach items="${listaCargo_Empleado}" var="CargoEmpleado"> 
                        <tr>
                            <td>${CargoEmpleado.idCargoEmpleado}</td>
                            <td>${CargoEmpleado.cargoEmpleado}</td>
                            <td><a href="buscar?id=${CargoEmpleado.idCargoEmpleado}"class="btn btn-warning">Modificar</a></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </body>
    <jsp:include page="/WEB-INF/jspf/footer.jspf"></jsp:include>
</html>	