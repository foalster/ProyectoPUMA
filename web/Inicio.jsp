<%-- 
    Document   : Inicio
    Created on : Apr 10, 2016, 3:23:56 AM
    Author     : Foalster
--%>



<%@page import="Servlet.SolicitarC"%>
<jsp:useBean id="consulta" class="Controlador.Control"></jsp:useBean>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8" session="false"%>
<%@ page language="java" %>
<%@ page import = "Modelo.Calculadora"%> 
<%@ page import = "java.util.LinkedList"%> 
<%! public int idSeleccionada;%>

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
        <script  type="text/javascript">
            function reply(clicked_id) {
                idSeleccionada = clicked_id;
                //alert(idSeleccionada);
                //Servlet.start(clicked_id);

            }
        </script>
        <style>
            h1{
                text-align: center;
            }
        </style>
        <title>PUMA</title>
    </head>
    <body style = "background-color: #666">
        <%
            HttpSession sessions = request.getSession(false);
            String usuario = (String) sessions.getAttribute("usuario");
        %>
        <div class="menu">
            <nav>
                <ul>
                    <li><a href="InicioC">PUMA</a></li>

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
        <h1>Hola, <%=usuario%>!</h1>
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
                        <center><a href="SolicitarB.jsp"><img src="img/basica.jpg" width="460" height="345"></a></center>
                        <div class="carousel-caption">
                            <h3>Básicas</h3>
                            <p>Calculadoras básicas disponibles.</p>
                        </div>
                    </div>

                    <div class="item">
                        <center><a href="SolicitarC.jsp"><img src="img/cientifica.jpg" width="460" height="345"></a></center>
                        <div class="carousel-caption">
                            <h3>Cientifica</h3>
                            <p>Calculadoras cientificas disponibles.</p>
                        </div>
                    </div>

                    <div class="item">
                        <center><a href="SolicitarG.jsp"><img src="img/graficadora.jpg" width="460" height="345"></a></center>
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
    </body>
</html>
