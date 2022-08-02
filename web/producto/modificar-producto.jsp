<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="/WEB-INF/jspf/frameworkUI.jspf"></jsp:include>
        <title>Modificar Producto</title>
    </head>
    <body>
        <div class="bTitulo">
            <br>
            <h1 class="titulito">Modificar Producto</h1>
            <br>
        </div>
        <div class="container" text-align="center">
            <form action="modificar" method="post" >
            <input type="hidden" id="hdn_id_producto" name="hdn_id_producto" value="${produ.idProducto}">
                <table class="table table-hover table-light">
                    <tr>
                        <td>Producto: </td>
                             <td><input required onkeypress="return soloLetras(event)" type="text" class="form-control" placeholder="${produ.nombreProducto}" id="txt_producto" name="txt_producto"></td>
                             
                    </tr>
                    <tr>
                        <td>Categoria: </td>
                        <td><select class="form-select" id="cbx_categoria" name="cbx_categoria" class="form-control">Categorias
                                <c:forEach items="${categorias}" var="categoria">
                                    <option value="${categoria.idCategoria}">${categoria.categoria}</option>
                                </c:forEach>    
                            </select></td>
                    </tr>
                    <tr>
                        <td>Sub Categoria: </td>
                        <td><select class="form-select" id="cbx_subcategoria" name="cbx_subcategoria" class="form-control">Sub Categorias
                            <c:forEach items="${subcategorias}" var="subCategoria">
                                <option value="${subCategoria.idSubCategoria}">${subCategoria.subCategoria}</option>
                            </c:forEach>    
                            </select></td>
                    </tr>
                    <tr>
                        <td>Peso(gr.): </td>
                        <td><input required onkeypress="return validarNumero(event)" type="text" step="any" class="form-control" placeholder="${produ.peso}" id="txt_peso" name="txt_peso"></td>
                    </tr>
                    <tr>
                        <td>Valor: </td>
                        <td><input required type="text" step="any"class="form-control" placeholder="${produ.valor}" id="txt_valor" name="txt_valor"></td>
                    </tr>                
                    <tr>
                        <td>Formato: </td>
                        <td><input required="" type="text" class="form-control" placeholder="${produ.formato}" id="txt_formato" name="txt_formato"></td>
                    </tr>
                    
                    <div class="button">
                    <tr>
                        
                        <td><input type="submit" class="btn btn-primary" value="Modificar"></td>
                    </tr>
                    </div>
                </table>
            </form>
        </div>
        
    </body>
    <jsp:include page="/WEB-INF/jspf/footer.jspf"></jsp:include>
</html>