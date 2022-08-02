<%-- 
    Document   : modificar-proveedor
    Created on : 9 jun. 2022, 20:28:38
    Author     : john-
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MODIFICAR Proveedor</title>
        <jsp:include page="/WEB-INF/jspf/frameworkUI.jspf"></jsp:include>
    </head>
    <body>
        <div class="bTitulo">
            <br>
            <h1 class="titulito">Modificar Proveedor</h1>
            <br>
        </div>
        <div class="container">
            <form name="frm_modificar_proveedor" action="modificar" method="post">  
                <input type="hidden" id="hdn_id_proveedor" name="hdn_id_proveedor" value="${prov.idProveedor}">
                 
                 <div class="mb-3">
                    <label for="txt_razon_social" class="form-label">Razon Social </label>
                    <input type="text" value="${prov.razonSocial}" class="form-control" id="txt_razon_social" name="txt_razon_social" aria-describedby="ayudaRazonSocial">
                    <div id="ayudaRazonSocial" class="form-text">Indique su razon social</div>
                </div>

                <div class="mb-3">
                    <label for="txt_direccion_proveedor" class="form-label">Direccion </label>
                    <input type="text" value="${prov.direccionProveedor}" class="form-control" id="txt_direccion_proveedor" name="txt_direccion_proveedor" aria-describedby="ayudaDireccionProveedor">
                    <div id="ayudaDireccionProveedor" class="form-text">Indique su direccion, por ejm: san martin #1325</div>
                </div>
                
                <div class="mb-3">
                    <label for="txt_correo_proveedor" class="form-label">Correo </label>
                    <input type="text" value="${prov.correoProveedor}" class="form-control" id="txt_correo_proveedor" name="txt_correo_proveedor" aria-describedby="ayudaCorreoProveedor">
                    <div id="ayudaCorreoProveedor" class="form-text">Indique su correo, ejm: 123@hotmail.com</div>
                </div>

                <div class="mb-3">
                    <label for="txt_telefono_proveedor" class="form-label">Teléfono </label>
                    <input type="number" value="${prov.telefonoProveedor}" class="form-control" id="txt_telefono_proveedor" name="txt_telefono_proveedor" aria-describedby="ayudaTelefonoProveedor">
                    <div id="ayudaTelefonoProveedor" class="form-text">Indique su telefono, ejem: 931467179</div>
                </div>
                
                <div class="mb-3">
                    <label for="txt_descripcion_proveedor" class="form-label">Descripción </label>
                    <input type="txt" value="${prov.descripcionProveedor}" class="form-control" id="txt_descripcion_proveedor" name="txt_descripcion_proveedor" aria-describedby="ayudaDescripcionProveedor">
                    <div id="ayudaDescripcionProveedor" class="form-text">Indique aqui porque postulo a este trabajo</div>
                </div>

                <div class="mb-3">
                    <label for="txt_giro" class="form-label">Giro </label>
                    <input type="text" value="${prov.giro}" class="form-control" id="txt_giro" name="txt_giro" aria-describedby="ayudaGiro">
                    <div id="ayudaGiro" class="form-text">Indique el giro de la empresa, por ejem: giro industrial</div>
                </div>
                <button type="submit" class="btn btn-primary">Modificar</button>
            </form>
        </div>
    </body>
    <jsp:include page="/WEB-INF/jspf/footer.jspf"></jsp:include>
</html>