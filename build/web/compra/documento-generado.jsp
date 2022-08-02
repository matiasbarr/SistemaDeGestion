    <%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"
              name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Documento Generado Compra</title>
        <jsp:include page="/WEB-INF/jspf/frameworkUI.jspf"></jsp:include>
        
        </head>
        <body>
            <br>
            <div class="titulo">
                <br>
                <h1 class="titulito">Factura</h1>
                <br>
            </div>
            <br>
            <div class="container">
                <form name="frm_documento_generado" method="post">
                    <input type="hidden" id="id_tipo_documento_transaccion" name="id_tipo_documento_transaccion" 
                           value="${tipodoctrans.idTipoDocumentoTransaccion}">
                    <table class="table table-hover table-light">
                        
                        <tr>
                            <td>Distribuidor: </td><td><label id="txt_id_compra"
                             name="txt_id_compra"  >${tipodoctrans.idCompra.rolProveedor}</label> </td> 
                            
                        </tr> 
                    <tr>
                        <td>Facturado Por: </td><td> Carnes La Flor </td>
                    </tr>
                    <tr>
                        <td>Numero de Teléfono: </td><td> (45) 231 8300 </td>
                    </tr>
                    <tr>
                        <td>Dirección: </td><td> Av. Pablo Neruda 1675 </td>
                    </tr>
                    <tr>
                        <td>País: </td><td> Chile </td>
                    </tr>
                    <tr>
                        <td>Región: </td><td> Araucanía </td>
                    </tr>
                    <tr>
                        <td>Ciudad: </td><td> Temuco </td>
                    </tr>
                </table>
            </form>
        
                       
            <form>
                Detalle
                <table class="table table-hover table-light">
                    <thead class="thead-dark">
                        <tr>
                            <th> ID:  </th>
                            <th> PRODUCTO: </th>
                            <th> CANTIDAD:  </th>
                            <th> PRECIO UNITARIO: </th>                                            
                        </tr>
                    </thead >
                    <tbody> 
                        <c:forEach items="${detallesCompraActual}" var="detalle"> 
                            <tr>
                                <td>${detalle.idProducto.idProducto}</td>
                                <td>${detalle.idProducto.nombreProducto}</td>
                                <td>${detalle.cantidad}</td>
                                <td>${detalle.idProducto.valor}</td>                         
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </form>
                        
                <form name="frm_documento_generado" method="post">
                    <table class="table table-hover table-light">
                        <tr>
                            <td>Subtotal: </td><td> <label id="txt_monto_neto" name="txt_monto_neto"  >${tipodoctrans.montoNeto}</label> </td>
                        </tr>
                        <tr>
                            <td>IVA(19%): </td><td> <label id="txt_monto_impuesto" name="txt_monto_impuesto"  >${tipodoctrans.montoImpuesto}</label> </td>
                        </tr>
                        <tr>
                            <td>Total: </td><td> <label id="txt_monto_total" name="txt_monto_total"  >${tipodoctrans.montoTotal}</label> </td>
                        </tr>
                        <tr>
                            <td>Fecha de Factura: </td><td><label id="txt_fecha_transaccion" 
                                name="txt_fecha_transaccion"  >${tipodoctrans.fechaTransaccion}</label> </td> 
                            
                        </tr>
                        <tr>
                            <td>Nro° de Factura: </td><td><label id="txt_numero_documento"
                            name="txt_numero_documento"  >${tipodoctrans.numeroDocumento}</label> </td> 
                        </tr>
                    </table> 
                </form>
           </div>                      
    </body>
    <jsp:include page="/WEB-INF/jspf/footer.jspf"></jsp:include>
</html>
