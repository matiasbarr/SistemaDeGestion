<%-- 
    Document   : generar-documento
    Created on : 30-06-2022, 13:03:27
    Author     : Barriga
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ingresar Factura</title>
        <jsp:include page="/WEB-INF/jspf/frameworkUI.jspf"></jsp:include>
    </head>
    <body>
        <div class="bTitulo">
            <br>
            <h1 class="titulito">Generar Doc. Compra</h1>
            <br>
        </div>
        <div class="container">
            <form action="agregar-documento" method="post" >
                 <input type="hidden" id="hdn_id_compra" name="hdn_id_compra" value="${ultimaCompra.idCompra}">
                 <input type="hidden" id="hdn_id_tipo_documento" name="hdn_id_tipo_documento" value="${tipodoc.idTipoDocumento}">
                <table class="table table-hover table-light">
                    <tr>
                        <td>Empleado:</td>
                        <td><label  type="text" id="txt_empleado" name="txt_empleado">${emp.nombreEmpleado} ${emp.apellidoPaterno}</label></td>
                    </tr>
                    <tr>
                        <td>Numero del documento: </td>
                        <td><input required onkeypress="return validarNumero(event)" type="text" class="form-control" placeholder="No. de la factura de compra"
                                   id="txt_numero_documento" name="txt_numero_documento"></td>
                    </tr>
                    <tr>            
                        <td>Proveedor:</td>
                        <td><label required type="text" id="txt_proveedor" name="txt_proveedor">${ultimaCompra.idProveedor.razonSocial}</label></td>
                    </tr>
                    <tr>
                        <td>Tipo de documento: </td>
                        <td><label type="number" id="txt_tipo_documento" name="txt_tipo_documento"  >${tipodoc.tipoDocumento}</label></td>
                    </tr>
                      <tr>
                        <td>Tipo de pago: </td>
                        <td><select class="form-select" id="cbx_tipopago" name="cbx_tipopago" class="form-control">Tipo de pago
                            <c:forEach items="${listaTipoPagos}" var="tipoPago">
                                <option value="${tipoPago.idTipoPago}">${tipoPago.tipoPago}</option>
                            </c:forEach>    
                            </select>
                      </tr>      
                    <tr>
                        <td></td>
                        <td><button type="submit" class="btn btn-info">Generar</button></td>
                    </tr>
                    </div>
                </table>
            </form>
        </div>
    </body>
    <jsp:include page="/WEB-INF/jspf/footer.jspf"></jsp:include>
</html>
