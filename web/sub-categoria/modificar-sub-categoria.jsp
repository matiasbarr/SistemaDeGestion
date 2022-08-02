
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MODIFICAR SUB CATEGORIA</title>
        <jsp:include page="/WEB-INF/jspf/frameworkUI.jspf"></jsp:include>
    </head>
    <body>
        <div class="titulo">
            <br>
            <h1 class="titulito">Modificar Sub Categoria</h1>
            <br>
        </div>
        <div class="container">
            <form name="frm_modificar_sub_categoria" action="modificar" method="post">    
            <input type="hidden" id="hdn_id_sub_categoria" name="hdn_id_sub_categoria" value="${subcat.idSubCategoria}">
                 <div class="mb-3">
                    <label for="txt_sub_categoria" class="form-label">Nuevo nombre</label>
                    <input required onkeypress="return soloLetras(event)" type="text" value="${subcat.subCategoria}" class="form-control" id="txt_sub_categoria" name="txt_sub_categoria" aria-describedby="ayudaNombreSubCategoria">
                    <div id="ayudaNombreSubCategoria" class="form-text">Sub categoria, eje: Lomo Vetado</div>
                </div>
                <button type="submit" class="btn btn-primary">Modificar</button>
            </form>
        </div>
    </body>
    <jsp:include page="/WEB-INF/jspf/footer.jspf"></jsp:include>
</html>
