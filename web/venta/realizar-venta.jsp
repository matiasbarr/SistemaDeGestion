<%-- 
    Document   : realizar-venta
    Created on : 30-06-2022, 11:24:52
    Author     : Barriga
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Realizar Venta</title>
        <jsp:include page="/WEB-INF/jspf/frameworkUI.jspf"></jsp:include>
        </head>
        <body>
            <div class="titulo">
                <br>
                <h1 class="titulito">Realizar Venta</h1>
                <br>
            </div>
            <div class="contenedor-principalCom">
                <div>
                    <form action="agregar" method="post">
                    <input type="hidden" id="hdn_id_empleado" name="hdn_id_empleado" value="${emp.idEmpleado}">
                <table class="table table-hover table-light">
                    <tr>
                        <td>Encargado: </td>
                        <td><label id="txt_empleado" name="txt_empleado"  >${emp.nombreEmpleado}</label> </td> 
                    </tr>
                    <tr>
                        <td>Rut Encargado: </td>
                        <td><label type="number" id="txt_rut_empleado" name="txt_rut_empleado" value="${emp.rutEmpleado}" >${emp.rutEmpleado} </label> <label type="text" id="txt_dv_empleado" name="txt_dv_empleado" value="${emp.dvEmpleado}"  ></label>-${emp.dvEmpleado} </td>
                    </tr>
                    <tr>
                        <td>Cargo del empleado: </td>
                        <td><label type="text" id="txt_cargo_empleado" name="txt_cargo_empleado"  >${emp.idCargoEmpleado.cargoEmpleado} </label> </td>
                    </tr>
                    <tr>
                        <td> <label for="txt_rut_cliente" class="form-label">Rut del cliente</label>  </td>
                        <td> <input type="text" value="no" placeholder="Rol unico de la empresa" class="form-control" id="txt_rut_cliente" name="txt_rut_cliente"> </td>
                    </tr>                                                      
                    <tr>
                        <td>Cliente: </td>
                        <td><select class="form-select" id="cbx_cliente" name="cbx_cliente" class="form-control">Cliente:
                                <c:forEach items="${listaclientes}" var="cliente">
                                    <option value="${cliente.idCliente}">${cliente.nombreCliente} ${cliente.apellidoPaternoCliente} </option>
                                </c:forEach>    
                            </select>
                        </td>
                    </tr> 
                    <tr>
                        <td>Tipo de documento </td>
                        <td><select class="form-select" id="cbx_tipo_documento" name="cbx_tipo_documento" class="form-control">Cliente:
                                <c:forEach items="${tipodocumentos}" var="doc">
                                    <option value="${doc.idTipoDocumento}">${doc.tipoDocumento}</option>
                                </c:forEach>    
                            </select>
                        </td>
                    </tr>
                    <div class="buttoning">
                    <tr>
                        <td></td>
                        <td><button type="submit" class="btn btn-info">Ingresar</button></td>
                    </tr>
                    </div>
                </table>
                </div>
                

                <div>
                    <table id="listaProductos" onclick="getProductoVenta()"  class="table table-hover table-light">
                        <thead class="thead-dark">
                            <tr>
                                <th scope="col">Codigo</th>
                                <th scope="col">Producto</th>
                                <th scope="col">Valor</th>
                                <th scope="col">Stock</th>
                                <th scope="col">Formato</th>
                                <th scope="col">Acciones</th>
                            </tr>
                        </thead>

                        <tbody>
                            <c:forEach items="${productos}" var="producto">
                                <tr class="filas">
                                    <td>${producto.idProducto}</td>
                                    <td>${producto.nombreProducto}</td>
                                    <td>${producto.valor}</td>
                                    <td>${producto.stock}</td>
                                    <td>${producto.formato}</td>
                                    <td><a class="btn btn-warning">=></a></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>

                <div>
                    <table class="table table-hover table-light">
                        <thead class="thead-dark">                            
                            <tr>
                                <th scope="col">COD:</th>
                                <th scope="col">PRODUCTOS:</th>
                                <th scope="col">CANTIDAD:</th>
                                <th scope="col">PRECIO UNITARIO:</th>
                                <th scope="col">TOTAL:</th>
                            </tr>                        
                        </thead>
                        <tbody id="carrito">                          
                        </tbody>
                    </table>
                    <input  type="hidden" id="hdn_detalle" name="hdn_detalle" value="">
                    <input  type="hidden" id="hdn_longitud" name="hdn_longitud" value="">
                </div>
            </form>
        </div>
    </body>
     <jsp:include page="/WEB-INF/jspf/footer.jspf"></jsp:include>
    
</html>
