<%-- 
    Document   : Inicio
    Created on : Apr 10, 2016, 3:23:56 AM
    Author     : Foalster
--%>




<jsp:useBean id="consulta" class="Controlador.Control"></jsp:useBean>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8" session="false"%>
<%@ page language="java" %>
<!DOCTYPE html>

<html>
    <head>
        <meta charset="UTF-8">
        <link href="css/styles.css" rel="stylesheet">
        <link href="css/header.css" rel="stylesheet">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>PUMA</title>
    </head>
    <body>
        <%
            HttpSession sessions = request.getSession(false);
            String usuario = (String) sessions.getAttribute("usuario");
        %>
        <div class="menu">
            <nav>
                <ul>
                    <li><a href="index.jsp">PUMA</a></li>
                    
                    <div class="dropdown">
                        <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">
                            <%=usuario%>
                            <span class="caret"></span></button>
                        <ul class="dropdown-menu">
                            <li><a href="AdministrarLaCuenta.jsp">Administrar cuenta</a></li>
                            <li><a href="CerrarSesionC">Cerrar Sesión</a></li>
                        </ul>
                    </div>

                </ul>   
            </nav>
        </div>
        
    
    <div class = "container">
            <div class="wrapper">
                <form method="post" action="CrearObjeto">
                    <h1 class="form-signin-heading">Crear Objeto</h1>
                    Marca: <input type="text" name="marca"/><br/><br/>
                    Modelo: <input type="text" name="modelo"/><br/><br/>
                    Tipo: <select name="tipo" required="">
                        <option value=0>Seleccione...</option>
                        <option value=1 >Básica</option>
                        <option value=2>Científica</option>
                        <option value=3>Graficadora</option>
                    </select><br/><br/>
                    <input type="submit" value="Crear"/>
                </form>
            </div>
        </div>
    </body>
</html>
