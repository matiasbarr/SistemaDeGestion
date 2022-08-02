<%-- 
    Document   : inicio
    Created on : 23-06-2022, 18:31:39
    Author     : Barriga
--%>

<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio</title>
        <jsp:include page="/WEB-INF/jspf/frameworkUI.jspf"></jsp:include>
        
    </head>
    <body>
        <div class="container">
            <form action="" method="post">
                <input type="hidden" id="hdn_emp_valid" name="hdn_emp_valid" value="${empleValidado.nombreEmpleado}">
                <input type="hidden" id="hdn_idemp_valid" name="hdn_idemp_valid" value="${empleValidado.idEmpleado}">
            </form>
            
            
            <label name="txtEmpValid">${empleValidado.nombreEmpleado}</label>
            <label>${empleValidado.idEmpleado}</label>
        </div>
        
        
        
    </body>
    <jsp:include page="/WEB-INF/jspf/footer.jspf"></jsp:include>
</html>
