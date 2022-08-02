<%-- 
    Document   : listar-categoria
    Created on : 28-05-2022, 16:53:14
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
                <h1 class="titulito">Categorias</h1>
                <br>
            </div>
            <br>
                <div class="container">
                    <table id="myTable" class="table table-hover table-light" >
                            <input onkeypress="return validarNumero(event)" type="text" id="myInput" onkeyup="myFunction()" placeholder="Buscar por ID">
                            <a href="agregar-categoria.jsp">
                                <input type="button" 
                                       class="btn btn-success" 
                                       id="btnAgregarSubCat" 
                                       value="Agregar Categoria"
                                       ></a>  
                        <br>
                        <thead class="thead-light" >
                            <tr>
                                <th scope="col"> ID  </th>
                                <th scope="col"> CATEGORÍA </th>
                                <th scope="col"> OPCIONES </th>
                            </tr>
                        </thead>
                        <tbody> 
                        <c:forEach items="${listaCategoria}" var="categoria"> 
                            <tr>
                                <td>${categoria.idCategoria}</td>
                                <td>${categoria.categoria}</td>
                                <td> <a href="buscar?id=${categoria.idCategoria}" class="btn btn-warning">Modificar</a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
    </body>
    <jsp:include page="/WEB-INF/jspf/footer.jspf"></jsp:include>
</html>	