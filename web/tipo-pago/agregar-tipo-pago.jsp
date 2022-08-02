<%-- 
    Document   : agregar-tipo-pago
    Created on : 15-05-2022, 19:20:23
    Author     : john-
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar tipo de pago</title>
        <jsp:include page="/WEB-INF/jspf/frameworkUI.jspf"></jsp:include>
        <script type="text/javascript" class="init" src="/Proyecto-war/funciones/funciones.js"></script>
    </head>
    <body>
        <div class="bTitulo">
            <br>
            <h1 class="titulito">Agregar Tipo de Pago</h1>
            <br>
        </div>
        <br><!-- comment -->
        <div class="container">
            <form name="frm_agregar_tipo_pago" action="agregar" method="post">     
                 <div class="mb-3">
                    <label for="txt_tipo_pago" class="form-label">Tipo de Pago</label>
                    <input required onkeypress="return soloLetras(event)" type="text" class="form-control" id="txt_tipo_pago" name="txt_tipo_pago" aria-describedby="ayudaNombreTipoPago" placeholder="Escribe el nombre del tipo de pago">
                    <div id="ayudaNombreTipoPago" class="form-text">El tipo de pago de la transaccion, eje: Efectivo</div>
                </div>
                <button type="submit" class="btn btn-primary">Agregar</button>
            </form>
        </div>
    </body>
    <jsp:include page="/WEB-INF/jspf/footer.jspf"></jsp:include>
</html>