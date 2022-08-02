<%-- 
    Document   : Login
    Created on : 05-07-2022, 19:20:20
    Author     : Barriga
--%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio</title>
        <jsp:include page="/WEB-INF/jspf/frameworkLogin.jspf"></jsp:include>
        <script type="text/javascript" class="init" src="/Proyecto-war/funciones/funciones.js"></script>
    </head>
    <body>
        <div class="container">
            <section class="vh-100">
            <div class="container-fluid h-custom">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-md-9 col-lg-6 col-xl-5">
                        <img src="/Proyecto-war/img/logoweb.png"
                             class="img-fluid" alt="Sample image">
                    </div>
                    <div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">
                        <form class="formularioLogin" method="post" action="/Proyecto-war/login/entrar">
                            <br>
                            <div class="form-outline mb-4">
                                <input required type="number" class="form-control" id="txtrutlogin" name="txtrutlogin" placeholder="Ingresa tu RUT"/>
                                <label class="form-label" for="form3Example3">Rut</label>
                            </div>
                            <div class="form-outline mb-3">
                                <input 
                                    required type="password" class="form-control" id="txtpasslogin" name="txtpasslogin" placeholder="Ingresa tu contraseña"/>
                                <label class="form-label" for="form3Example4">Password</label>
                            </div>
                            <div class="text-center text-lg-start mt-4 pt-2">
                                <button type="submit" class="btn btn-primary btn-lg"
                                        style="padding-left: 2.5rem; padding-right: 2.5rem;" id="btn-Login" >Entrar</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
        </div>
    </body>
    <jsp:include page="/WEB-INF/jspf/footer.jspf"></jsp:include>
</html>
