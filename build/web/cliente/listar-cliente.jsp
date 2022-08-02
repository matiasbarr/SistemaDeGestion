        <%-- 
    Document   : listar-cliente
    Created on : 15-05-2022, 20:46:09
    Author     : john-
--%>

<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de clientes</title>
        <jsp:include page="/WEB-INF/jspf/frameworkUI.jspf"></jsp:include>
        <script type="text/javascript" class="init" src="/Proyecto-war/funciones/funciones.js"></script>
    </head>
    <body>
        <br>
        <div class="bTitulo">
            <br>
            <h1 class="titulito">Clientes</h1>
            <br>
        </div>
        <br>
        <div class="container">
        <table id="myTable" class="table table-hover table-light">
                <input type="text" id="myInput" onkeyup="myFunction()" placeholder="Buscar por ID">
                <a href="agregar-cliente.jsp">
                    <input type="button" 
                       class="btn btn-success" 
                       id="btnAgregarCliente" 
                       value="Agregar Cliente"
                       ></a>
            <br>
            <br>
            <thead class="thead-dark">
                <tr>
                    <th> ID  </th>
                    <th> RUT </th>
                    <th> DV  </th>
                    <th> NOMBRES </th>
                    <th> APELLIDO PATERNO </th>
                    <th> APELLIDO MATERNO </th>
                    <th> DIRECCION </th>
                    <th> TELEFONO </th>
                    <th> CORREO  </th> 
                    <th> FECHA DE REGISTRO </th>                    
                    <th> Funciones </th>
                </tr>
            </thead >
            <tbody> 
            <c:forEach items="${listaCliente}" var="Cliente"> 
                <tr>
                    <td>${Cliente.idCliente}</td>
                    <td>${Cliente.rutCliente}</td>
                    <td>${Cliente.dvCliente}</td>
                    <td>${Cliente.nombreCliente}</td>
                    <td>${Cliente.apellidoPaternoCliente}</td>
                    <td>${Cliente.apellidoMaternoCliente}</td>
                    <td>${Cliente.direccionCliente}</td>
                    <td>${Cliente.telefonoCliente}</td>
                    <td>${Cliente.correoCliente}</td>
                    <td>${Cliente.fechaRegistro}</td>   
                    <td> <a href="buscar?id=${Cliente.idCliente}" class="btn btn-warning">Modificar</a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
            
        </div>
    </body>
    <jsp:include page="/WEB-INF/jspf/footer.jspf"></jsp:include>
</html>	