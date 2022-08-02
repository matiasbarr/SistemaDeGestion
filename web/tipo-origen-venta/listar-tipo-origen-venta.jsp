<%-- 
    Document   : listar-tipo-origen-venta
    Created on : 13-05-2022, 16:05:09
    Author     : john-
--%>

<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de tipos de origen venta</title>
        <jsp:include page="/WEB-INF/jspf/frameworkUI.jspf"></jsp:include>
    </head>
    <body>
        <div class="bTitulo">
            <br>
            <h1 class="titulito">Ver Tipo de Origen Venta</h1>
            <br>
        </div>
        <br>
        <div class="container">
        <table id="myTable" class="table table-hover table-light">  
                <input  onkeypress="return validarNumero(event)" type="text" id="myInput" onkeyup="myFunction()" placeholder="Buscar por ID">
                <a href="agregar-tipo-origen-venta.jsp">
                    <input type="button" 
                       class="btn btn-success" 
                       id="btnAgregarTipoOrigenVenta" 
                       value="Agregar Tipo Origen Venta"
                       ></a>
            <br>
            <br>
            <thead class="thead-dark">
                <tr>
                    <th span="col"> ID  </th>
                    <th span="col"> NOMBRE </th>
                    <th span="col">   OPCIONES </th>
                </tr>
            </thead>
            <tbody> 
            <c:forEach items="${listaTipo_Origen_Venta}" var="TipoOrigenVenta"> 
                <tr>
                    <td>${TipoOrigenVenta.idTipoOrigenVenta}</td>
                    <td>${TipoOrigenVenta.tipoOrigen}</td>
                    <td> <a href="buscar?id=${TipoOrigenVenta.idTipoOrigenVenta}" class="btn btn-warning">Modificar</a></td>
                
                </tr>
        </c:forEach>
            </tbody>
        </table>
        </div>
    </body>
    <jsp:include page="/WEB-INF/jspf/footer.jspf"></jsp:include>
</html>	