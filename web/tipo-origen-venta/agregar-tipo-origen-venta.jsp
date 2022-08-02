<%-- 
    Document   : agregar-tipo-origen-venta
    Created on : 13-05-2022, 16:04:36
    Author     : john-
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CREATE Origen Ventas</title>
        <jsp:include page="/WEB-INF/jspf/frameworkUI.jspf"></jsp:include>
    </head>
    <body>
        <div class="bTitulo">
            <br>
            <h1 class="titulito">Tipo Origen Venta</h1>
            <br>
        </div>
        <br>
        <div class="container">
            <form name="frm_agregar_tipo_origen_venta" action="agregar" method="post">     
                 <div class="mb-3">
                    <label for="txt_tipo_origen_venta" class="form-label">Nuevo nombre</label>
                    <input required onkeypress="return soloLetras(event)" type="text" class="form-control" id="txt_tipo_origen_venta" name="txt_tipo_origen_venta" aria-describedby="ayudaNombreTipoOrigenVenta">
                    <div id="ayudaNombreTipoOrigenVenta" class="form-text">El tipo de origen es donde se genero la venta. ej:ONLINE</div>
                </div>
                <button type="submit" class="btn btn-primary">Enviar</button>
            </form>
        </div>
    </body>
    <jsp:include page="/WEB-INF/jspf/footer.jspf"></jsp:include>
</html>