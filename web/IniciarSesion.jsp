<%-- 
    Document   : IniciarSesion
    Created on : Apr 24, 2016, 4:52:47 PM
    Author     : Foalster
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>¡Inicia sesión en PUMA!</title>
        <meta charset="UTF-8">
        <link href="css/styles.css" rel="stylesheet">
        <link href="css/header.css" rel="stylesheet">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <div class="menu">
            <nav>
                <ul>
                    <li><a href="index.jsp">PUMA</a></li>
                    <a href="Registrar.jsp">Registrar</a>
                </ul>
            </nav>
        </div>
        
        <div class = "container">
            <div class="wrapper">
                <form action="IniciarSesionC" method="post" name="Login_Form" class="form-signin">       
                    <h3 class="form-signin-heading">¡Inicia sesión en PUMA!</h3>
                    <!--<hr class="colorgraph"><br>-->
                    <input type="text" class="form-control" name="usuario" placeholder="Username" required="" autofocus="" />
                    <input type="password" class="form-control" name="password" placeholder="Password" required=""/>
                    <button class="btn btn-lg btn-primary btn-block"  name="Submit" value="login" type="Submit">Login</button>  			
                </form>			
            </div>
        </div>
    </body>
</html>