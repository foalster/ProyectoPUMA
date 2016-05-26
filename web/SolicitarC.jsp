<%-- 
    Document   : Solicitar
    Created on : Apr 26, 2016, 2:08:03 PM
    Author     : Foalster
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Servlet.SolicitarC"%>
<jsp:useBean id="consulta" class="Controlador.Control"></jsp:useBean>
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
                            <li><a href="CerrarSesionC">Cerrar Sesión </a></li>
                        </ul>
                    </div>

                </ul>   
            </nav>
        </div>
        <div class="container" style="background-color: rgba(0, 0, 0, 0.7); border-radius: 100px; color: #fff; margin-top: 3%;">
            <br/><h1 class="form-signin-heading">Solicitud de Calculadoras Científicas</h1><br/><br/>
            <div style="margin-left: 10%; position: relative; float: left;">
                <form id="formulario" method="post" action="SolicitarC" >                 
                    <div id="caja">
                        Id <input type="text" name="idCalculadora" style="color: #333;" id="count" value="0"><br/><br/>
                    </div>
                    Tiempo de prestamo: <input type="text"  name="tiempo"/><br/><br/>
                    Lugar de entrega: <input type="text"  name="lugar"/><br/><br/>
                    Motivo: <br/><textarea name="motivo" style="color: #333;" rows="10" cols="40"></textarea><br/><br/><br/>
                    <input type="submit" value="Solicitar"/><br/><br/><br/><br/>
                </form>
            </div>
            <div id="container-rigth" style="position: relative; float: right; margin-right: 15%">
                <table class="table" style="margin:auto; background-color: #000; border-color: #444" border="1">
                    <tr>
                        <td>Marca</td>
                        <td>Modelo</td>
                        <td>Id</td>
                        <td>Solicitar</td>
                    </tr>
                    <%
                        int nombre = 0;
                        LinkedList<Calculadora> lista = consulta.getCalculadoras();
                        consulta.conectar();
                        consulta.desconectar();

                        for (int i = 0; i < lista.size(); i++) {
                            if (lista.get(i).getDisponible() && (lista.get(i).getIdTipo() == 2)) {
                                nombre = lista.get(i).getIdCalculadora();
                                lista.get(i).getIdCalculadora();
                                out.println("<tr>");
                                out.println("<td>" + lista.get(i).getMarca() + "</td>");
                                out.println("<td>" + lista.get(i).getModelo() + "</td>");
                                out.println("<td>" + lista.get(i).getIdCalculadora() + "</td>");
                                out.println("<td>" + "<input type=\"button\" name=\"Solicitar\" style=\" color: #000;\" id=\"Solicitar\" value=\"Agregar Id\"/ data-quantity=" + nombre + " onClick = \"reply(this.id)\"> \n"
                                        + "</form>"
                                        + "</td>");
                                nombre = 0;
                                out.println("</tr>");
                            }
                        }

                    %>
                </table>
            </div>
        </div>
    </body>
</html>
