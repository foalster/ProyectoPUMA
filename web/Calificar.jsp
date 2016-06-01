<%-- 
    Document   : Solicitar
    Created on : Apr 26, 2016, 2:08:03 PM
    Author     : Foalster
--%>

<%@page import="Modelo.Prestamo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Servlet.SolicitarC"%>
<jsp:useBean id="consulta" class="Controlador.Conexion"></jsp:useBean>
<%@ page language="java" %>
<%@ page import = "Modelo.Calculadora"%> 
<%@ page import = "java.util.LinkedList"%> 
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <link href="css/styles.css" rel="stylesheet">
        <link href="css/header.css" rel="stylesheet">
        <link href="css/solicitar.css" rel="stylesheet">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
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
        <style>
            #count3{
                display:none; 
                visibility:hidden;
            }
        </style>
        <script  type="text/javascript">$(function () {
                $('input:button').click(function () {
                    $('#count').val($(this).data('quantity'));
                    $('#count2').val($(this).data('quantity'));
                    $('#count3').val($(this).data('quantity'));
                });
            });
        </script>

        <style>
            #formulario{
                color:#fff;
            }
        </style>

        <title>Formulario</title>
    </head>

    <body style="background:url('img/240.png'); background-attachment: fixed; background-size: cover; background-repeat: no-repeat;">
        <!--<p>Me ha llegado <%= request.getAttribute("idSeleccionada")%></p>-->
        <%
            HttpSession sessions = request.getSession(false);
            String usuario = (String) sessions.getAttribute("usuario");
            int id = (Integer) sessions.getAttribute("id");
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
                            <li><a href="Prestamo.jsp">Prestamo </a></li>
                            <li><a href="Calificar.jsp">Calificar </a></li>
                            <li><a href="CerrarSesionC">Cerrar Sesión </a></li>
                        </ul>
                    </div>
                </ul>   
            </nav>
        </div>

        <div class="container" style="height: 650px; background-color: rgba(0, 0, 0, 0.7); border-radius: 50px; color: #fff; margin-top: 3%;">
            <h2 style="text-align: center;">¡Es momento de calificar!</h2><br/>
            <ul class="nav nav-pills nav-justified">

                <li class="active"><a data-toggle="pill" href="#menu1">Califica Calculadoras Adquiridas</a></li>
                <li><a data-toggle="pill" href="#menu2">Califica Usuarios</a></li>
            </ul>

            <div class="tab-content">
                <div id="menu1" class="tab-pane fade in active"><br/><br/>
                        <%
                        int idcal = 0;
                        LinkedList<Calculadora> lista = consulta.getPrestamosCali(id);
                        for (int i = 1; i < lista.size(); i++) {
                            if (lista.get(i).getCalificarPrestamo() < 0) {
                                idcal = lista.get(i).getIdPrestamo();
                                out.println("<form method=\"post\" action=\"CalificarCC\">"
                                        + "Id del prestamo:  <input type=\"text\" name=\"idPrestamo\" style=\"color: #333;\" id=\"count\" value=\"0\" readonly><br/><br/>"
                                        + "<input type=\"submit\" value=\"Calificar\"/><br/><br/>"
                                        + "<table style=\"margin: auto;\" border=\"1\">"
                                        + "<tr>"
                                        + "<td>Id Prestamo</td>"
                                        + "<td>Id Calculadora</td>"
                                        + "<td>Marca</td>"
                                        + "<td>Modelo</td>"
                                        + "<td>Tiempo</td>"
                                        + "<td>Calificación</td>"
                                        + "</tr>");
                                out.println("<tr>");
                                out.println("<td>" + lista.get(i).getIdPrestamo() + "</td>");
                                out.println("<td>" + lista.get(i).getIdCalculadora() + "</td>");
                                out.println("<td>" + lista.get(i).getMarca() + "</td>");
                                out.println("<td>" + lista.get(i).getModelo() + "</td>");
                                out.println("<td>" + lista.get(i).getTiempo() + "</td>");
                                out.println("<td> <input id=\"input-1\" name=\"estrella\" class=\"rating rating-loading\" data-min=\"0\" data-max=\"5\" data-step=\"1\"  data-size=\"xs\"> </td>");
                                out.println("<td> <input type=\"button\" name=\"Solicitar\" style=\" color: #000;\" id=\"Solicitar\" value=\"Agregar Id\"/ data-quantity=" + idcal + " onClick = \"reply(this.id)\"> </td>\n");
                                out.println("</tr>");
                                out.println("</form>");
                            }else{
                            out.println("<p style=\"text-align: center; font-size: 200%; margin-top: 70px\">¡No tienes calculadoras pendientes a calificar</p>");
                            }
                        }

                    %>
                    </div>
                    <div id="menu2" class="tab-pane fade">
                        
                        <p>No.</p>
                        
                    </div>
                </div>
            </div>
    </body>
</html>