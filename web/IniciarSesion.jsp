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
        <script>
            // initialize with defaults
            $("#input-id").rating();

// with plugin options
            $("#input-id").rating({min: 1, max: 10, step: 2, size: 'lg'});
        </script>
        <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.css" rel="stylesheet">
        <link href="css/star-rating.css" media="all" rel="stylesheet" type="text/css" />
        <!-- optionally if you need to use a theme, then include the theme file as mentioned below -->
        <link href="css/theme-krajee-svg.css" media="all" rel="stylesheet" type="text/css" />
        <script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.js"></script>
        <script src="js/star-rating.js" type="text/javascript"></script>
        <!-- optionally if you need translation for your language then include locale file as mentioned below -->
        <script src="js/star-rating_locale_{lang}.js"></script>
    </head>
    <body style="background:url('img/236.jpg'); background-attachment: fixed; background-size: cover; background-repeat: no-repeat;">
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
                    <p><input type="text" class="form-control" name="usuario" placeholder="Username" required="" autofocus="" /></p>
                    <input type="password" class="form-control" name="password" placeholder="Password" required=""/>
                    <button class="btn btn-lg btn-primary btn-block"  name="Submit" value="login" type="Submit">Login</button>
                </form>			
            </div>
        </div>
    </body>
</html>