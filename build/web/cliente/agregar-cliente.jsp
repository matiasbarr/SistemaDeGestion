<%-- 
    Document   : agregar-cliente
    Created on : 15-05-2022, 20:45:50
    Author     : john-
--%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Cliente</title>
        <jsp:include page="/WEB-INF/jspf/frameworkUI.jspf"></jsp:include>
        <script type="text/javascript" class="init" src="/Proyecto-war/funciones/funciones.js"></script>    
    </head>
    <body>
        <div class="titulo">
            <br>
            <h1 class="titulito">Agregar Cliente</h1>
            <br>
        </div>
        
        <div class="container">
            <form name="frm_agregar_cliente" action="agregar" method="post">
                
                 <div class="mb-3">
                    <label for="txt_rut_cliente" class="form-label">Rut </label>
                    <input required onkeypress="return soloNumero(event)" type="number" class="form-control" id="txt_rut_cliente" name="txt_rut_cliente" aria-describedby="ayudaRutCliente">
                    <div id="ayudaRutCliente" class="form-text">Indique su rut sin puntos</div>
                </div>

                <div class="mb-3">
                    <label for="txt_dv_cliente" class="form-label">Digito Verificador </label>
                    <input required type="text" class="form-control" id="txt_dv_cliente" name="txt_dv_cliente" aria-describedby="ayudaDvCliente">
                    <div id="ayudaDvCliente" class="form-text">El digito verificador va despues del - ej:"11.111.111-DV"</div>
                </div>
                
                <div class="mb-3">
                    <label for="txt_nombres_cliente" class="form-label">Nombres</label>
                    <input onkeypress="return soloLetras(event)" required type="text" class="form-control" id="txt_nombres_cliente" name="txt_nombres_cliente" aria-describedby="ayudaNombresCliente">
                    <div id="ayudaNombresCliente" class="form-text">Ingrese sus nombres</div>
                </div>
                
                <div class="mb-3">
                    <label for="txt_apellido_paterno_cliente" class="form-label">Apellido Paterno</label>
                    <input required onkeypress="return soloLetras(event)" type="text" class="form-control" id="txt_apellido_paterno_cliente" name="txt_apellido_paterno_cliente" aria-describedby="ayudaApellidoPaternoCliente">
                    <div id="ayudaApellidoPaternoCliente" class="form-text">Ingrese su apeliido paterno</div>
                </div>

                  <div class="mb-3">
                    <label for="txt_apellido_materno_cliente" class="form-label">Apellido Materno</label>
                    <input onkeypress="return soloLetras(event)" required type="text" class="form-control" id="txt_apellido_materno_cliente" name="txt_apellido_materno_cliente" aria-describedby="ayudaApellidoMaternoCliente">
                    <div id="ayudaApellidoMaternoCliente" class="form-text">Ingrese su apellido materno</div>
                </div>

                  <div class="mb-3">
                    <label for="txt_direccion_cliente" class="form-label">Direccion</label>
                    <input required onkeypress="return soloLetras(event)" type="text" class="form-control" id="txt_direccion_cliente" name="txt_direccion_cliente" aria-describedby="ayudaDireccionCliente">
                    <div id="ayudaDireccionCliente" class="form-text">Ejemplo: "Villa dulce #123"</div>
                </div>

                <div class="mb-3">
                    <label for="txt_telefono_cliente" class="form-label">Numero de teléfono</label>
                    <input required onkeypress="return validarNumero(event)" type="number" class="form-control" id="txt_telefono_cliente" name="txt_telefono_cliente" aria-describedby="ayudaCelularCliente">
                    <div id="ayudaCelularCliente" class="form-text">Ingrese el numero de celular</div>
                </div>
                
                <div class="mb-3">
                    <label for="txt_correo_cliente" class="form-label">Correo electronico</label>
                    <input required type="text" class="form-control" id="txt_correo_cliente" name="txt_correo_cliente" aria-describedby="ayudaEmailCliente">
                    <div id="ayudaEmailCliente" class="form-text">Ingrese su correo electronico</div>
                </div>
                
                <div class="mb-3">
                    <label for="txt_password_cliente" class="form-label">password</label>
                    <input required type="password" class="form-control" id="txt_password_cliente" name="txt_password_cliente" aria-describedby="ayudaPasswordCliente">
                    <div id="ayudaPasswordCliente" class="form-text">Ingrese su contraseña</div>
                </div>
               
                <button type="submit" class="btn btn-primary">Enviar</button>
            </form>
        </div>
    </body>
    <jsp:include page="/WEB-INF/jspf/footer.jspf"></jsp:include>
</html>