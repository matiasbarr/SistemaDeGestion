
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modficar Categoria </title>
        <jsp:include page="/WEB-INF/jspf/frameworkUI.jspf"></jsp:include>
        </head>
        <body>
            <div class="titulo">
                <br>
                <h1 class="titulito">Modificar Categoria</h1>
                <br>
            </div>

            <div class="container">

                <form name="frm_modificar_categoria" action="modificar" method="post">    
                    <input type="hidden" id="hdn_id_categoria" name="hdn_id_categoria" value="${cat.idCategoria}">
                <div class="mb-3">
                    <label for="txt_categoria" class="form-label">Nuevo nombre</label>
                    <input onkeypress="return soloLetras(event)" required type="text" value="${cat.categoria}" class="form-control" id="txt_categoria" name="txt_categoria" aria-describedby="ayudaNombreCategoria">
                    <div id="ayudaNombreCategoria" class="form-text">Sub categoria, eje: Lomo Vetado</div>
                </div>
                <button type="submit" class="btn btn-primary">Modificar</button>
            </form>
        </div>
    </body>
    <jsp:include page="/WEB-INF/jspf/footer.jspf"></jsp:include>
</html>
