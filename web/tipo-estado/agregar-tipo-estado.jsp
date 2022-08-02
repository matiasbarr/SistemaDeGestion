<%-- 
    Document   : agregar-tipo-estado-venta
    Created on : 15-05-2022, 17:52:26
    Author     : john-
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Crear Estado</title>
        <jsp:include page="/WEB-INF/jspf/frameworkUI.jspf"></jsp:include>
    </head>
    <body>
        
        <div class="bTitulo">
            <br>
            <h1 class="titulito">Agregar Tipo Estado</h1>
            <br>
        </div>
        <br><!-- comment -->
        <div class="container">
            <form name="frm_agregar_tipo_estado" action="agregar" method="post">     
                 <div class="mb-3">
                    <label for="txt_tipo_estado" class="form-label">Tipo de estado</label>
                    <input required onkeypress="return soloLetras(event)" type="text" class="form-control" id="txt_tipo_estado" name="txt_tipo_estado" aria-describedby="ayudaNombreTipoEstado">
                    <div id="ayudaNombreTipoEstado" class="form-text">Tipo de estado indica: PAGADA</div>
                </div>
                <button type="submit" class="btn btn-primary">Agregar</button>
            </form>
        </div>
    </body>
    <jsp:include page="/WEB-INF/jspf/footer.jspf"></jsp:include>
</html>