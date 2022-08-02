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
        <title>Lista de tipos de pagos</title>
        <jsp:include page="/WEB-INF/jspf/frameworkUI.jspf"></jsp:include>
        
    </head>
    <body>
        <div class="bTitulo">
            <br>
            <h1 class="titulito">Tipos de Pago</h1>
            <br>
        </div>  
        <div class="container">
            <table id="myTable" class="table table-hover table-light">
                <div class="container">
                    <input onkeypress="return validarNumero(event)" type="text" id="myInput"  placeholder="Buscar por ID">
                    <a href="agregar-tipo-pago.jsp">
                        <input type="button" 
                               class="btn btn-success" 
                               id="btnAgregarTipoPago" 
                               value="Agregar Tipo de Pago"
                    ></a>   
                </div>
                <br>
                <thead>
                    <tr>
                        <th> ID  </th>
                        <th> NOMBRE DEL PAGO </th>
                    </tr>
                </thead>
                <tbody> 
                <c:forEach items="${listaTipo_Pago}" var="TipoPago"> 
                    <tr>
                        <td>${TipoPago.idTipoPago}</td>
                        <td>${TipoPago.tipoPago}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    </body>
    <jsp:include page="/WEB-INF/jspf/footer.jspf"></jsp:include>
</html>	