<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MODIFICAR ORIGEN VENTA</title>
        <jsp:include page="/WEB-INF/jspf/frameworkUI.jspf"></jsp:include>
    </head>
    <body>
        <div class="container">
            <h1>Modificar Subcategoría</h1>
            <form name="frm_tipo_origen_venta" action="modificar" method="post">    
            <input type="hidden" id="hdn_tipo_origen_venta" name="hdn_tipo_origen_venta" value="${tipoorigenventa.idTipoOrigenVenta}">
                 <div class="mb-3">
                    <label for="txt_tipo_origen_venta" class="form-label">Subcategoría</label>
                    <input  required onkeypress="return soloLetras(event)" type="text" value="${tipoorigenventa.tipoOrigen}" class="form-control" id="txt_tipo_origen_venta" name="txt_tipo_origen_venta" aria-describedby="ayudaTipoOrigenVenta">
                    <div id="ayudaTipoOrigenVenta" class="form-text">Tipo del Origen de la venta, eje: Lomo Vetado</div>
                </div>
                <button type="submit" class="btn btn-primary">Enviar</button>
            </form>
        </div>
    </body>
    <jsp:include page="/WEB-INF/jspf/footer.jspf"></jsp:include>
</html>
