<%-- 
    Document   : listar-productos
    Created on : 28-05-2022, 20:12:36
    Author     : john-
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"
              name="viewport" content="width=device-width, initial-scale=1.0">
        <jsp:include page="/WEB-INF/jspf/frameworkUI.jspf"></jsp:include>
    </head>
    <body>
        <div class="bTitulo">
            <br>
            <h1 class="titulito">Productos</h1>
            <br>
        </div>
        <br>
        <div class="container">
            <table id="myTable" class="table table-hover table-light">
                    <input onkeypress="return validarNumero(event)" type="text" id="myInput" onkeyup="myFunction()" placeholder="Buscar por ID">
                    <a href="poblar">
                        <input type="button" 
                               class="btn btn-success" 
                               id="btnAgregarSubCat" 
                               value="Agregar Producto"
                               ></a>
                <br>
                <br>
                <thead class="thead-dark">
                    <tr>
                        <th scope="col">Producto</th>
                        <th scope="col">Categoria</th>
                        <th scope="col">Sub Categoria</th>                    
                        <th scope="col">Peso</th>
                        <th scope="col">Valor</th>
                        <th scope="col">Stock</th>
                        <th scope="col">Formato</th>
                        <th scope="col">Acciones</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach items="${listaProductos}" var="producto">    
                    <tr>
                        <td>${producto.nombreProducto}</td>
                        <td>${producto.idCategoria.categoria}</td>
                        <td>${producto.idSubCategoria.subCategoria}</td>            
                        <td>${producto.peso}gr.</td>
                        <td>$${producto.valor}</td>
                        <td>${producto.stock}</td>
                        <td>${producto.formato}</td>
                        <td><a href="buscar?id=${producto.idProducto}" class="btn btn-warning">Modificar</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
<jsp:include page="/WEB-INF/jspf/footer.jspf"></jsp:include>
</html>