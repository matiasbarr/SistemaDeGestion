<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"
              name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Realizar Compra</title>
        <jsp:include page="/WEB-INF/jspf/frameworkUI.jspf"></jsp:include>
            
        </head>
        <body>
            <div class="titulo">
                <br>
                <h1 class="titulito">Realizar una Compra</h1>
                <br>
            </div>
            <div class="contenedor-principalCom">
                <div>
                    <div class="card">
                        <form action="agregar" method="post">
                            <input type="hidden" id="hdn_id_empleado" name="hdn_id_empleado" value="${emp.idEmpleado}">
                        <table class="table table-hover table-light">
                            <tr>
                                <td>Encargado: </td><td><label id="txt_empleado" name="txt_empleado"  >${emp.nombreEmpleado}</label> </td> 
                            </tr>
                            <tr>
                                <td>Rut del Encargado: </td>
                                <td><label type="number" id="txt_rut_empleado" name="txt_rut_empleado" value="${emp.rutEmpleado}">
                                        ${emp.rutEmpleado} </label>
                                    <label type="text" id="txt_dv_empleado" name="txt_dv_empleado" value="${emp.dvEmpleado}"  >
                                    </label>-${emp.dvEmpleado} </td>
                            </tr>
                            <tr>
                                <td>Cargo del empleado: </td>
                                <td><label type="text" id="txt_cargo_empleado" name="txt_cargo_empleado"  >
                                        ${emp.idCargoEmpleado.cargoEmpleado}</label> </td>
                            </tr>
                            <tr>
                                <td> <label for="txt_rol_proveedor" class="form-label">ROL poroveedor</label>  </td>
                                <td> <input required type="text" placeholder="Rol unico de la empresa"
                                            class="form-control" id="txt_rol_proveedor" name="txt_rol_proveedor" 
                                            |aria-describedby="ayudaRolProveedor"> </td>
                            </tr>
                            <tr>
                                <td>Proveedores: </td>
                                <td><select class="form-select" id="cbx_proveedor" name="cbx_proveedor" class="form-control">Proveedores
                                        <c:forEach items="${proveedores}" var="Proveedor">
                                            <option value="${Proveedor.idProveedor}">${Proveedor.razonSocial}</option>
                                        </c:forEach>    
                                    </select>
                                </td>
                            <tr>
                                <td></td>
                                <td><button type="submit" class="btn btn-info">Generar Compra</button></td>
                            </tr>
                        </table>
                        <input type="hidden" id="hdn_detalle" name="hdn_detalle" value="">
                        <input type="hidden" id="hdn_longitud" name="hdn_longitud" value="">

                        </div>
                        </div>      
                        <div>
                            <table id="listaProductos" onclick="getProductoCompra()"  class="table table-hover table-light">
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
                                        <th scope="col">PRODUCTO:</th>
                                        <th scope="col">CANTIDAD:</th>
                                        <th scope="col">PRECIO UNITARIO:</th>
                                        <th scope="col">TOTAL:</th>
                                    </tr>                        
                                </thead>
                                <tbody id="carrito">                          
                                </tbody>
                            </table>
                    </form>
                </div>
            </div>               
    </body>
    <jsp:include page="/WEB-INF/jspf/footer.jspf"></jsp:include>
</html>