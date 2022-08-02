<%-- 
    Document   : agregar-producto
    Created on : 28-05-2022, 20:08:01
    Author     : john-
--%>

<%@page import="entidades.Empleado"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"
              name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Agregar Producto</title>
        <jsp:include page="/WEB-INF/jspf/frameworkUI.jspf"></jsp:include>
        <script type="text/javascript" class="init" src="/Proyecto-war/funciones/funciones.js"></script>
    </head>
    <body>
        <div class="bTitulo">
            <br>
            <h1 class="titulito">Agregar Producto</h1>
            <br>
        </div>
        <div class="container">
            <form action="agregar" method="post" >
                
                <div class="mb-3">
                    <label for="txt_nombre_producto" class="form-label">Nombre del producto:</label>
                    <input required onkeypress="return soloLetras(event)" type="text"class="form-control" placeholder="Ingrese el nombre del producto" id="txt_nombre_producto" name="txt_nombre_producto">
                    <div id="ayudaRazonSocial" class="form-text">Indique su razon social</div>
                </div>
                
                <div class="mb-3">
                    <label for="cbx_categoria" class="form-label">Categoria</label>
                    <select class="form-select" id="cbx_categoria" name="cbx_categoria" class="form-control">Categorias
                            <c:forEach items="${listaCategorias}" var="categoria">
                                <option value="${categoria.idCategoria}">${categoria.categoria}</option>
                            </c:forEach>    
                    </select>
                    <div id="ayudaCategoria" class="form-text">Indique la categoria del producto</div>
                </div>
                
                <div class="mb-3">
                    <label for="cbx_subcategoria" class="form-label" >Sub Categoria</label>
                    <select class="form-select" id="cbx_subcategoria" name="cbx_subcategoria" class="form-control">Sub Categorias
                            <c:forEach items="${listaSubCategorias}" var="subCategoria">
                                <option value="${subCategoria.idSubCategoria}">${subCategoria.subCategoria}</option>
                            </c:forEach>    
                    </select>
                </div>
                
                <div class="mb-3">
                    <label for="txt_peso" class="form-label">Peso:</label>
                    <input onkeypress="return validarNumero(event)" required type="number" step="any" class="form-control" placeholder="Ingrese el peso" id="txt_peso" name="txt_peso">
                    
                    <div id="ayudaPesoProducto" class="form-text">Indique el peso del producto</div>
                </div>
                
                <div class="mb-3">
                    <label for="txt_valor" class="form-label"> Valor </label>
                    <input required onkeypress="return validarNumero(event)" type="number" step="any" class="form-control" placeholder="Ingrese el valor" id="txt_valor" name="txt_valor">
                    <div id="ayudaValorProducto" class="form-text">Indique el valor del producto</div>
                </div>
                
                <div class="mb-3">
                    <label for="txt_stock" class="form-label"> Stock </label>
                    <input required type="number" class="form-control" placeholder="Ingrese el stock" id="txt_stock" name="txt_stock">
                    <div id="ayudaStockProducto" class="form-text">Indique el stock del producto</div>
                </div>
                
                <div class="mb-3">
                    <label for="txt_formato" class="form-label">Formato</label>
                    <input required onkeypress="return soloLetras(event)" type="text" class="form-control" placeholder="Ingrese el formato" id="txt_formato" name="txt_formato">
                    <div id="ayudaFormatoProducto" class="form-text">Indique el formato del producto</div>
                </div>
                <div>
                    <button type="submit" class="btn btn-info">Ingresar</button>
                </div>
            </form>
        </div>
        <br>
    </body>
    <jsp:include page="/WEB-INF/jspf/footer.jspf"></jsp:include>
</html>
