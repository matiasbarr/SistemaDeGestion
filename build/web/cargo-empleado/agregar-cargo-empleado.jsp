<%-- 
    Document   : agregar-cargo-empleado
    Created on : 15-05-2022, 18:37:14
    Author     : john-
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cargo de empleados</title>
        <jsp:include page="/WEB-INF/jspf/frameworkUI.jspf"></jsp:include>
        
    </head>
    <body>
        <div class="bTitulo">
            <br>
            <h1 class="titulito">Agregar Cargo de Empleado</h1>
            <br>
        </div>
        <div class="container">
            <table>
                <form name="frm_agregar_cargo_empleado" action="agregar" method="post">    
                    <div class="mb-3">
                        <div class="imgEmpleado">
                            <p align="center"><img align="center"src="/Proyecto-war/img/empleados.png" width="200" height="200" align="middle"></p>
                        </div>
                        <!-- comment <label for="txt_cargo_empleado" class="form-label">Cargo de empleado</label>-->
                        <input onkeypress="return soloLetras(event)" required type="text" class="form-control" id="txt_cargo_empleado" name="txt_cargo_empleado" aria-describedby="ayudaNombreCargoEmpleado">
                        <div id="ayudaNombreCargoEmpleado" class="form-text">tipo de cargo del empleado, eje: Carnicero</div>
                    </div> 
                     <button type="submit" class="btn btn-primary" >Agregar</button>
                </form>
            </table>
        </div>
    </body>
    <jsp:include page="/WEB-INF/jspf/footer.jspf"></jsp:include>
</html>