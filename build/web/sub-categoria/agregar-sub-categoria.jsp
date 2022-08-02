<%-- 
    Document   : agregar-sub-categoria
    Created on : 15-05-2022, 20:21:10
    Author     : john-
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CREATE Tipo De Documento</title>
        <jsp:include page="/WEB-INF/jspf/frameworkUI.jspf"></jsp:include>
    </head>
    <body>
        <div class="bTitulo">
            <br>
            <h1 class="titulito">Agregar Sub Categoria</h1>
            <br>
        </div>
        <div class="container">
            <form name="frm_agregar_sub_categoria" action="agregar" method="post">     
                 <div class="mb-3">
                    <label for="txt_sub_categoria" class="form-label">Subcategoría</label>
                    <input required onkeypress="return soloLetras(event)" type="text" class="form-control" id="txt_sub_categoria" name="txt_sub_categoria" aria-describedby="ayudaNombreSubCategoria">
                    <div id="ayudaNombreSubCategoria" class="form-text">Sub categoria, eje: Lomo Vetado</div>
                </div>
                <button type="submit" class="btn btn-primary">Enviar</button>
            </form>
        </div>
    </body>
    <jsp:include page="/WEB-INF/jspf/footer.jspf"></jsp:include>
</html>
