<%-- 
    Document   : Solicitar
    Created on : Apr 26, 2016, 2:08:03 PM
    Author     : Foalster
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <title>Formulario</title>
    </head>
    
    <body>
        <!--<p>Me ha llegado <%= request.getAttribute("idSeleccionada") %></p>-->
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
                            <li><a href="CerrarSesionC">Cerrar Sesión </a></li>
                        </ul>
                    </div>

                </ul>   
            </nav>
        </div>
        <div class = "container">
            <div class="wrapper">
                <form method="post" action="SolicitarC">
                    <h1 class="form-signin-heading">Solicita</h1>
                    Tiempo de prestamo: <input type="text" name="tiempo"/><br/><br/>
                    Lugar de entrega: <input type="text" name="lugar"/><br/><br/>
                    Motivo: <br/><input type="text" name="motivo" id ="motivo"/><br/><br/><br/>
                    <input type="submit" value="Solicitar"/>
                </form>
            </div>
        </div>
    </body>
</html>
