<%-- 
    Document   : listar-tipo-estado-venta
    Created on : 15-05-2022, 18:05:06
    Author     : john-
--%>

<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de tipos de estado venta</title>
        <jsp:include page="/WEB-INF/jspf/frameworkUI.jspf"></jsp:include>
    </head>
    <body>
        <div class="bTitulo">
                    <br>
                    <h1 class="titulito">Estados</h1>
                    <br>
                </div>
        <div class="container">
        <table id="myTable" class="table table-hover table-light">
                    <input onkeypress="return validarNumero(event)" type="text" id="myInput" onkeyup="myFunction()" placeholder="Buscar por ID">
                    <a href="agregar-tipo-estado.jsp">
                        <input type="button" 
                               class="btn btn-success" 
                               id="btnAgregarEstado" 
                               value="Agregar Estado"
                               ></a>
                <br>
                <br>
            <thead>
                <tr>
                    <th col="span"> ID  </th>
                    <th colspan="1"> NOMBRE </th>
                    <th> OPCIONES </th>
                </tr>
            </thead>
            <tbody> 
            <c:forEach items="${listaTipo_Estado}" var="TipoEstado"> 
                <tr>
                    <td>${TipoEstado.idTipoEstado}</td>
                    <td>${TipoEstado.tipoEstado}</td>
                     <td> <a href="buscar?id=${TipoEstado.idTipoEstado}" class="btn btn-warning">Modificar</a></td>
              
                </tr>
        </c:forEach>
            </tbody>
        </table>
        </div>
    </body>
    <jsp:include page="/WEB-INF/jspf/footer.jspf"></jsp:include>
</html>	