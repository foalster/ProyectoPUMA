<%-- 
    Document   : Registrar
    Created on : Apr 25, 2016, 5:31:33 PM
    Author     : Foalster
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>¡Regístrate en PUMA!</title>
        <meta charset="UTF-8">
        <link href="css/styles.css" rel="stylesheet">
        <link href="css/header.css" rel="stylesheet">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link type="text/css" rel="stylesheet" href="css/calendar.css"/>
        <script type="text/javascript" src="js/calendar.js"></script>
        <script type="text/javascript">
            function init() {
                calendar.set("date");
            }
        </script>
    </head>
    
    <body onload="init()">
        
        <div class="menu">
            <nav>
                <ul>
                    <li><a href="index.jsp">PUMA</a></li>
                    <a href="IniciarSesion.jsp">Iniciar Sesión</a>
                                    
                </ul>
            </nav>
        </div>
        
        <div class = "container">
            <div class="wrapper">
                <form method="post" action="RegistrarC">
                    <h1 class="form-signin-heading">Regístrate</h1>
                    Usuario: <input type="text" name="usuario"/><br/><br/>
                    Contraseña: <input type="password" name="password"/><br/>
                    Nombre(s): <input type="text" name="nombre"/><br/><br/>
                    Apellido Paterno: <input type="text" name="appat"/><br/><br/>
                    Apellido Materno: <input type="text" name="apmat"/><br/><br/>
                    Fecha de Nacimiento: <input type="text" name="fechanac" id="date"><br/><br/>
                    Genero: <select name="genero" required="">
                        <option value="">Seleccione...</option>
                        <option value="H">Hombre</option>
                        <option value="M">Mujer</option>
                    </select><br/><br/>
                    Email: <input type="text" name="email"/><br/><br/>
                    <input type="submit" value="Registrar"/>
                </form>
            </div>
        </div>
    </body>
</html>
