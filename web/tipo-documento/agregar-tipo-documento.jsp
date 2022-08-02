<%-- 
    Document   : agregar-tipo-documento
    Created on : 15-05-2022, 19:38:21
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
            <h1 class="titulito">Agregar Tipo Documento</h1>
            <br>
        </div>
        
        <div class="container">
            <form name="frm_agregar_tipo_documento" action="agregar" method="post">     
                 <div class="mb-3">
                    <label for="txt_tipo_documento" class="form-label">Tipo De Documento</label>
                    <input required onkeypress="return soloLetras(event)" type="text" class="form-control" id="txt_tipo_documento" name="txt_tipo_documento" aria-describedby="ayudaNombreTipoDocumento">
                    <div id="ayudaNombreTipoDocumento" class="form-text">tipo de cargo de documento, eje: boleta</div>
                </div>
                <button type="submit" class="btn btn-primary">Agregar</button>
            </form>
        </div>
    </body>
    <jsp:include page="/WEB-INF/jspf/footer.jspf"></jsp:include>
</html>
