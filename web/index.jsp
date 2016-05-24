<%-- 
    Document   : index
    Created on : Apr 24, 2016, 4:40:58 PM
    Author     : Foalster
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>¡Bienvenido a PUMA!</title> 
        <meta charset="UTF-8">
        <link href="css/styles.css" rel="stylesheet">
        <link href="css/header.css" rel="stylesheet">        
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
    </head>
    <body style = "background-color: #666;">
        
        
        <div class="menu">
            <nav>
                <ul>
                    <li><a href="index.jsp">PUMA</a></li>
                    <a href="Registrar.jsp">Registrar</a>
                    <a href="IniciarSesion.jsp">Iniciar Sesión</a>
                                    
                </ul>
            </nav>
        </div>
        
        
        <div class="container" style="text-align: left">
            <h1>¡Bienvenido a PUMA!</h1>     
        
            <div id="myCarousel" class="carousel slide" data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                    <li data-target="#myCarousel" data-slide-to="1"></li>
                    <li data-target="#myCarousel" data-slide-to="2"></li>
                </ol>

                <!-- Wrapper for slides -->
                <div class="carousel-inner" role="listbox" >

                    <div class="item active">
                        <center><img src="img/basica.jpg" width="460" height="345"></center>
                        <div class="carousel-caption">
                            <h3>Básicas</h3>
                            <p>Calculadoras básicas disponibles.</p>
                        </div>
                    </div>

                    <div class="item">
                        <center><img src="img/cientifica.jpg" width="460" height="345"></center>
                        <div class="carousel-caption">
                            <h3>Cientifica</h3>
                            <p>Calculadoras cientificas disponibles.</p>
                        </div>
                    </div>

                    <div class="item">
                        <center><img src="img/graficadora.jpg" width="460" height="345"></center>
                        <div class="carousel-caption">
                            <h3>Gráficadora</h3>
                            <p>Gráficadoras disponibles.</p>
                        </div>
                    </div>

                </div>

                <!-- Left and right controls -->
                <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>  
    </body>
</html>