<%-- 
    Document   : listar-sub-categoria
    Created on : 15-05-2022, 20:21:28
    Author     : john-
--%>

<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Tipo de documentos</title>
        <jsp:include page="/WEB-INF/jspf/frameworkUI.jspf"></jsp:include>   
    </head>
    <body>
        <div class="bTitulo">
            <br>
            <h1 class="titulito">SUB CATEGORIAS</h1>
            <br>
        </div>
        <br>
    </head>
        <br>
        <div class="container">
        <table id="myTable" class="table table-hover table-light">
                <input onkeypress="return validarNumero(event)" type="text" id="myInput" onkeyup="myFunction()" placeholder="Buscar por ID">
                <a href="agregar-sub-categoria.jsp">
                    <input type="button" 
                       class="btn btn-success" 
                       id="btnAgregarSubCat" 
                       value="Agregar Sub Categoria"
                       ></a>
            <br>
            <thead class="thead-dark">
                <tr>
                    <th scope="col"> ID  </th>
                    <th scope="col"> SUBCATEGORÍA </th>
                    <th scope="col"> OPCIONES </th>
                </tr>
            </thead>
            <tbody> 
                <c:forEach items="${listaSub_Categoria}" var="subCategoria"> 
                        <tr>
                            <td>${subCategoria.idSubCategoria}</td>
                            <td>${subCategoria.subCategoria}</td>
                            <td> <a href="buscar?id=${subCategoria.idSubCategoria}" class="btn btn-warning">Modificar</a></td>
                        </tr>
                </c:forEach>
            </tbody>
        </table>
        </div>
    </body>
    <jsp:include page="/WEB-INF/jspf/footer.jspf"></jsp:include>
</html>