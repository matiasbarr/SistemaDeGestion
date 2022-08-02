
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MODIFICAR TIPO ESTADO VENTA</title>
        <jsp:include page="/WEB-INF/jspf/frameworkUI.jspf"></jsp:include>
    </head>
    <body>
        
        
        <div class="container">
            <form name="frm_modificar_tipo_estado" action="modificar" method="post">    
            <input type="hidden" id="hdn_id_tipo_estado" name="hdn_id_tipo_estado" value="${TipoEstado.idTipoEstado}">
                 <div class="mb-3">
                    <label for="txt_sub_categoria" class="form-label">Estado de la venta</label>
                    <input type="text" value="${TipoEstado.tipoEstado}" class="form-control" id="txt_tipo_estado" name="txt_tipo_estado" aria-describedby="ayudaEstado">
                    <div id="ayudaEstado" class="form-text">Estado, ej: Pagada</div>
                </div>
                <button type="submit" class="btn btn-primary">Enviar</button>
            </form>
        </div>
    </body>
    <jsp:include page="/WEB-INF/jspf/footer.jspf"></jsp:include>
</html>
