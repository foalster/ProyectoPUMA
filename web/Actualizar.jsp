<%-- 
    Document   : Actulizar
    Created on : 23/05/2016, 12:31:18 PM
    Author     : SONY_VAIO
--%>

<%@page import="Modelo.Calculadora"%>
<%@page import="java.util.LinkedList"%>
<jsp:useBean id="consulta" class="Controlador.Control"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <link href="css/styles.css" rel="stylesheet">
        <link href="css/header.css" rel="stylesheet">
        <link href="css/acordeon.css" rel="stylesheet"> 
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link type="text/css" rel="stylesheet" href="css/calendar.css"/>
        <script type="text/javascript" src="js/calendar.js"></script>
        <script  type="text/javascript">
            $(function () {
                $('input:button').click(function () {
                    $('#count').val($(this).data('quantity'));
                });
            });
        </script>
        <script type="text/javascript">
            function init() {
                calendar.set("date");
            }
        </script>
        <style>
            #actualizar{
                text-align: center;                
            }
        </style>
        <title>PUMA</title>
    </head>
    <body onload="init()" style = "background-color: #666; font-weight: bold"color: #fff">
          <%
              HttpSession sessions = request.getSession(false);
              String usuario = (String) sessions.getAttribute("usuario");
              int id = (Integer) sessions.getAttribute("id");//Obtener Id del Usuario.
              String calculadora = (String) sessions.getAttribute("calculadora");

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
        <div id="actualizar">
            <h1>Formulario de Actualizar Calculadora</h1>
            <form method="post" action="Actualizador">
                <%
                    int nombre = 0;
                    int cal = Integer.parseInt(calculadora);
                    LinkedList<Calculadora> lista = consulta.getCalculadoras(id);

                    for (int i = 0; i < lista.size(); i++) {
                        if (lista.get(i).getIdCalculadora() == cal) {
                            nombre = lista.get(i).getIdCalculadora();
                            out.println("<br/><br/> <p>" + "Marca: " + "<input type=\"text\" name=\"marca\" id=\"date\" readonly value=" + lista.get(i).getMarca() + " </p>");
                            out.println("<p>" + "Modelo: " + "<input type=\"text\" name=\"modelo\" value=" + lista.get(i).getModelo() + " </p> <br/><br/> ");
                        }
                    }
                %>
                <br>
                <b><input type="submit" value= "Actualizar"/></b><br/><br/>
                <br/>
            </form>  
        </div>
    </body>
</html>
