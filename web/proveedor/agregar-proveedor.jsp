<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar proovedor</title>
        <jsp:include page="/WEB-INF/jspf/frameworkUI.jspf"></jsp:include>
        <script type="text/javascript" class="init" src="/Proyecto-war/funciones/funciones.js"></script>
    </head>
    <body>
        <div class="bTitulo">
            <br>
            <h1 class="titulito">Agregar Proveedor</h1>
            <br>
        </div>
        <div class="container">
            <form name="frm_agregar_proveedor" action="agregar" method="post">  
                
                
                <div class="mb-3">
                    <label for="txt_rol_proveedor" class="form-label">Rol unico del proveedor </label>
                    <input required type="text" class="form-control" id="txt_rol_proveedor" name="txt_rol_proveedor" aria-describedby="ayudaRol">
                    <div id="ayudaRol" class="form-text">Indique el rol unico de la empresa ej:50654250-k</div>
                </div>
                 <div class="mb-3">
                    <label for="txt_razon_social" class="form-label">Razon Social </label>
                    <input required type="text"class="form-control" id="txt_razon_social" name="txt_razon_social" aria-describedby="ayudaRazonSocial">
                    <div id="ayudaRazonSocial" class="form-text">Indique su razon social</div>
                </div>
                
                
                <div class="mb-3">
                    <label for="txt_direccion_proveedor" class="form-label">Direccion </label>
                    <input required type="text" class="form-control" id="txt_direccion_proveedor" name="txt_direccion_proveedor" aria-describedby="ayudaDireccionProveedor">
                    <div id="ayudaDireccionProveedor" class="form-text">Indique su direccion, por ejm: san martin #1325</div>
                </div>
                
                <div class="mb-3">
                    <label for="txt_correo_proveedor" class="form-label">Correo </label>
                    <input required  type="email"class="form-control" id="txt_correo_proveedor" name="txt_correo_proveedor" aria-describedby="ayudaCorreoProveedor">
                    <div id="ayudaCorreoProveedor" class="form-text">Indique su correo, ejm: 123@hotmail.com</div>
                </div>

                <div class="mb-3">
                    <label for="txt_telefono_proveedor" class="form-label">Teléfono </label>
                    <input required onkeypress="return validarNumero(event)" type="number" class="form-control" id="txt_telefono_proveedor" name="txt_telefono_proveedor" aria-describedby="ayudaTelefonoProveedor">
                    <div id="ayudaTelefonoProveedor" class="form-text">Indique su telefono, ejem: 931467179</div>
                </div>
                
                <div class="mb-3">
                    <label for="txt_descripcion_proveedor" class="form-label">Descripción </label>
                    <input required type="text" class="form-control" id="txt_descripcion_proveedor" name="txt_descripcion_proveedor" aria-describedby="ayudaDescripcionProveedor">
                    <div id="ayudaDescripcionProveedor" class="form-text">Indique aqui la descripcion del proveedor</div>
                </div>
                
                
                
                <div class="mb-3">
                    <label for="txt_giro" class="form-label">Giro </label>
                    <input required onkeypress="return soloLetras(event)" type="text" class="form-control" id="txt_giro" name="txt_giro" aria-describedby="ayudaGiro">
                    <div id="ayudaGiro" class="form-text">Indique el giro de la empresa, por ejem: giro industrial</div>
                </div>
                <button type="submit" class="btn btn-primary">Agregar</button>
            </form>
        </div>
    </body>
    <jsp:include page="/WEB-INF/jspf/footer.jspf"></jsp:include>
</html>
