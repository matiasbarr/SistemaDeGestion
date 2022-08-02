<%-- 
    Document   : agregar-categoria
    Created on : 28-05-2022, 16:49:28
    Author     : john-
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Categoria</title>
        <jsp:include page="/WEB-INF/jspf/frameworkUI.jspf"></jsp:include>
    </head>
    <body>
        <div class="titulo">
            <br>
            <h1 class="titulito">Agregar Categoria</h1>
            <br>
        </div>
        <div class="container">
            <form name="frm_agregar_categoria" action="agregar" method="post">

                <div class="mb-3">
                    <label for="txt_categoria" class="form-label" >Nombre de la Categoría</label>
                    <input required onkeypress="return soloLetras(event)" type="text" class="form-control" id="txt_categoria" name="txt_categoria" aria-describedby="ayudaCategoria">
                    <div id="ayudaCategoria" class="form-text">tipo categoria, eje: carne de pollo</div>
                </div>
                <button type="submit" class="btn btn-primary">Crear</button>
            </form>
        </div>
    </body>
    <jsp:include page="/WEB-INF/jspf/footer.jspf"></jsp:include>
</html>