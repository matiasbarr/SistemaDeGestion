<%-- 
    Document   : generar-documento-venta
    Created on : 30-06-2022, 11:25:15
    Author     : Barriga
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <jsp:include page="/WEB-INF/jspf/frameworkUI.jspf"></jsp:include>
        
    </head>
    <body>
        <div class="bTitulo">
            <br>
            <h1 class="titulito">Generar Doc. Venta</h1>
            <br>
        </div>
        <div class="container">
            <div>
                  <form action="agregar-documento" method="post" >
                <input type="hidden" id="hdn_id_venta" name="hdn_id_venta" value="${ultimaVenta.idVenta}">
            <input type="hidden" id="hdn_id_tipo_documento" name="hdn_id_tipo_documento" value="${tipodoc.idTipoDocumento}">
            <table class="table table-hover table-light">    
                <tr>
                    <td>Empleado:</td>
                    <td><label type="text" id="txt_empleado" name="txt_empleado">${emp.nombreEmpleado} ${emp.apellidoPaterno}</label></td>
                </tr>
                <tr>
                    <td>Numero del documento: </td>
                    <td><input onkeypress="return validarNumero(event)" type="text" class="form-control" placeholder="No. de la factura de compra" id="txt_numero_documento" name="txt_numero_documento"></td>
                </tr>
                <tr>
                    <td>Origen de la venta:</td>
                    <td><label type="text" id="txt_origen_venta" name="txt_origen_venta">${ultimaVenta.idTipoOrigenVenta.tipoOrigen}</label></td>
                </tr>
                <tr>
                    <td>Cliente:</td>
                    <td><label type="text" id="txt_cliente" name="txt_cliente">${ultimaVenta.idCliente.nombreCliente}</label></td>
                </tr>
                <tr>
                    <td>Tipo de documento: </td>
                    <td><label type="text" id="txt_tipo_documento" name="txt_tipo_documento">${tipodoc.tipoDocumento}</label></td>
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
                <div></div>
    </div>
</body>
<jsp:include page="/WEB-INF/jspf/footer.jspf"></jsp:include>
</html>
