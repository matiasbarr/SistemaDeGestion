<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ver Proveedores</title>
        <jsp:include page="/WEB-INF/jspf/frameworkUI.jspf"></jsp:include>
        </head>
        <body>
            <div class="bTitulo">
                <br>
                <h1 class="titulito">Ver Proveedores</h1>
                <br>
            </div>
            <br>
            <div class="container">
                <table id="myTable" class="table table-hover table-light" >
                        <input onkeypress="return validarNumero(event)" type="text" id="myInput" onkeyup="myFunction()" placeholder="Buscar por ID">
                        <a href="agregar-proveedor.jsp">
                            <input type="button" 
                                   class="btn btn-success" 
                                   id="btnAgregarProveedor" 
                                   value="Agregar Proveedor"
                                   ></a>
                    <br>
                    <br>
                    <thead class="thead-dark">
                        <tr>
                            <th> ID  </th>
                            <th> Razón Social </th>
                            <th> Dirección </th>
                            <th> Correo </th>
                            <th> Teléfono </th>
                            <th> Descripción </th>
                            <th> Giro  </th>
                            <th> Fecha de Registro </th>
                            <th> Funciones </th>
                        </tr>
                    </thead>
                    <tbody> 
                    <c:forEach items="${listaProveedor}" var="Proveedor"> 
                        <tr>
                            <td>${Proveedor.idProveedor}</td>
                            <td>${Proveedor.razonSocial}</td>
                            <td>${Proveedor.direccionProveedor}</td>
                            <td>${Proveedor.correoProveedor}</td> 
                            <td>${Proveedor.telefonoProveedor}</td>
                            <td>${Proveedor.descripcionProveedor}</td>
                            <td>${Proveedor.giro}</td>
                            <td>${Proveedor.fechaRegistro}</td>
                            <td> <a href="buscar?id=${Proveedor.idProveedor}" class="btn btn-warning">Modificar</a></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </body>
    <jsp:include page="/WEB-INF/jspf/footer.jspf"></jsp:include>
</html>	