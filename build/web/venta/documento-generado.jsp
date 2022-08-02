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
                <h1 class="titulito">Documento</h1>
                <br>
            </div>
            <br>
            <div class="container">
                <input type="hidden" id="id_tipo_documento_transaccion" name="id_tipo_documento_transaccion" 
                           value="${tipodoctrans.idTipoDocumentoTransaccion}">
                    <table class="table table-hover table-light">
                        <tr>
                            <td>Venta realizada por: </td>
                            <td><label>${doctransvent.idVenta.idEmpleado.nombreEmpleado} ${doctransvent.idVenta.idEmpleado.apellidoPaterno}</label> </td> 
                                                 
                        </tr> 
                        <tr><td>Cliente: </td><td><label>${doctransvent.idVenta.idCliente.nombreCliente} ${doctransvent.idVenta.idCliente.apellidoPaternoCliente}</label> </td> </tr>
                        <tr><td>Origen de la venta</td><td><label >${doctransvent.idVenta.idTipoOrigenVenta.tipoOrigen}</label> </td> </tr>
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
                        <c:forEach items="${carritosVentaActual}" var="carrito"> 
                            <tr>
                                <td>${carrito.idProducto.idProducto}</td>
                                <td>${carrito.idProducto.nombreProducto}</td>
                                <td>${carrito.cantidad}</td>
                                <td>${carrito.idProducto.valor}</td>                         
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </form>
                <form name="frm_documento_generado" method="post">
                    <table class="table table-hover table-light">
                        <tr>
                            <td>Subtotal: </td><td> <label >${doctransvent.montoNeto}</label> </td>
                        </tr>
                        <tr>
                            <td>IVA(19%): </td><td> <label id="txt_monto_impuesto">${doctransvent.montoImpuesto}</label> </td>
                        </tr>
                        <tr>
                            <td>Total: </td><td> <label   >${doctransvent.montoTotal}</label> </td>
                        </tr>
                        <tr>
                            <td>Numero del documento: </td><td><label>${doctransvent.numeroDocumento}</label> </td>  
                        </tr>
                        <tr>
                            <td>Fecha del documento: </td><td><label>${doctransvent.fechaTransaccion}</label> </td>
                        </tr>
                    </table> 
                </form>
            </div>                   
    </body>
    <jsp:include page="/WEB-INF/jspf/footer.jspf"></jsp:include>
</html>