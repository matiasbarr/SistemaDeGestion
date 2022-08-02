<%-- 
    Document   : error-login
    Created on : 06-07-2022, 20:43:27
    Author     : Barriga
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Carnes la Flor | Error</title>
        <jsp:include page="/WEB-INF/jspf/frameworkLogin.jspf"></jsp:include>
        <script type="text/javascript" class="init" src="/Proyecto-war/funciones/funciones.js"></script>
    </head>
    <body>
        <div class="container">
            
                <center>
                <br>
                <img src="/Proyecto-war/img/error-user.png" height="400px" width="400px">
                <h1>¡ Error, las credenciales son incorrectas !</h1>
                <br>
                <h2>Te recomendamos contactar a un Administrador o Supervisor, es posible de que no te encuentres registrado en nuestro sistema.</h2>
                <br>
                <form action="/Proyecto-war/login.jsp" method="post" >
                <button class="btn btn-primary" type="submit">Iniciar Sesión</button>
                </form>
            </center>
            
        </div>
    </body>
    <jsp:include page="/WEB-INF/jspf/footer.jspf"></jsp:include>
</html>
