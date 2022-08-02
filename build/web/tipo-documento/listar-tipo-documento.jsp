<%-- 
    Document   : listar-tipo-documento
    Created on : 15-05-2022, 19:38:37
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
            <h1 class="titulito">Ver Tipos de Documentos</h1>
            <br>
        </div>
        <div class="container">
            <br>
            <table id="myTable" class="table table-hover table-light">
                <input onkeypress="return validarNumero(event)" type="text" id="myInput" onkeyup="myFunction()" placeholder="Buscar por ID">
                <a href="agregar-tipo-documento.jsp">
                    <input type="button" 
                       class="btn btn-success" 
                       id="btnAgregarSubCat" 
                       value="Agregar Tipo Documento"
                       ></a>
                <br>
                <br>
            <thead class="thead-dark">
                <tr>
                    <th span="col">ID</th>
                    <th span="col">TIPO DE DOCUMENTO</th>
                </tr>
            </thead>
            <tbody> 
            <c:forEach items="${listaTipo_Documento}" var="TipoDocumento"> 
                <tr>
                    <td>${TipoDocumento.idTipoDocumento}</td>
                    <td>${TipoDocumento.tipoDocumento}</td>
                </tr>
        </c:forEach>
            </tbody>
        </table>
            
        </div>
    </body>
    <jsp:include page="/WEB-INF/jspf/footer.jspf"></jsp:include>
</html>	