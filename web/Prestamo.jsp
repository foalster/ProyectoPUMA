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
        <script  type="text/javascript">$(function () {
                $('input:button').click(function () {
                    $('#count').val($(this).data('quantity'));
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

    <body style="background:url('img/240.png'); background-size: cover; background-repeat: no-repeat;">
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
                            <li><a href="CerrarSesionC">Cerrar Sesión </a></li>
                        </ul>
                    </div>
                </ul>   
            </nav>
        </div>
        <div class="container" style="height: 650px; background-color: rgba(0, 0, 0, 0.7); border-radius: 50px; color: #fff; margin-top: 3%;">
            <h2 style="text-align: center;">¡Administra tu prestamos!</h2><br/>
            <ul class="nav nav-pills nav-justified">

                <li class="active"><a data-toggle="pill" href="#menu1">Prestamos Pendientes</a></li>
                <li><a data-toggle="pill" href="#menu2">Cancelar Prestamo</a></li>
            </ul>

            <div class="tab-content">
                <div id="menu1" class="tab-pane fade in active"><br/><br/>
<table style="margin: auto;" border="1">
                        <tr>
                            <td>Id</td>
                            <td>Motivo</td>
                            <td>Tiempo</td>
                            <td>Disponible</td>
                       <td>Agregar</td>
                        </tr>
                        <%
                            int nombre = 0;
                            LinkedList<Prestamo> lista = consulta.getPrestamos();
                            for (int i = 0; i < lista.size(); i++) {
                                    out.println("<tr>");
                                    out.println("<td>" + lista.get(i).getIdCalculadora() + "</td>");
                                    out.println("<td>" + lista.get(i).getMotivo() + "</td>");
                                    out.println("<td>" + lista.get(i).getTiempo() + "</td>");
                                        out.println("<td>" + "<input type=\"button\" name=\"Solicitar\" id=\"Solicitar\" value=\"Agregar Id\"/ data-quantity=" + nombre + " onClick = \"reply(this.id)\"> \n"
                                                + "</form>"
                                                + "</td>");
                                        nombre = 0;
                                        out.println("</tr>");
                                    
                            }
                        %>        
                </div>
                <div id="menu2" class="tab-pane fade">
                    <form method="post" action="CrearObjeto">
                        <br/>Marca: <input type="text" name="marca" style="text-align: center"/><br/><br/>
                        Modelo: <input type="text" name="modelo" style="text-align: center"/><br/><br/>
                        Tipo: <select name="tipo" required="" id="tipo">
                            <option value=0>Seleccione...</option>
                            <option value=1 >Básica</option>
                            <option value=2>Científica</option>
                            <option value=3>Graficadora</option>
                        </select><br/><br/>
                        <b><input type="submit" value="Crear"/></b><br/><br/>
                    </form>
                </div>
            </div>
    </body>
</html>
