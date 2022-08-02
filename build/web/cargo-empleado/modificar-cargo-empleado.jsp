
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Cargo</title>
        <jsp:include page="/WEB-INF/jspf/frameworkUI.jspf"></jsp:include>
         
    </head>
    <body>
        <div class="container">
            <div class="bTitulo">
            <br>
            <h1 class="titulito">Modificar Cargo</h1>
            <br>
        </div>
        <div class="container">
            <form name="frm_modificar_cargo_empleado" action="modificar" method="post">    
            <input type="hidden" id="hdn_id_cargo_empleado" name="hdn_id_cargo_empleado" value="${caremp.idCargoEmpleado}">
                 <div class="mb-3">
                    <label for="txt_sub_categoria" class="form-label"></label>
                    <input required onkeypress="return soloLetras(event)" type="text" value="${caremp.cargoEmpleado}" class="form-control" id="txt_cargo_empleado" name="txt_cargo_empleado" aria-describedby="ayudaNombreCargoEmpleado">
                    <div id="ayudaCargoEmpleadoa" class="form-text">Cargo, ej: Cajero</div>
                </div>
                <button type="submit" class="btn btn-primary">Modificar</button>
            </form>
        </div>
    </body>
    <jsp:include page="/WEB-INF/jspf/footer.jspf"></jsp:include>
</html>
