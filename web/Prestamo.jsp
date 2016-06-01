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
        <style>
            #count3{
                display:none; 
                visibility:hidden;
            }
            
            #form {
              width: 250px;
              margin: 0 auto;
              height: 50px;
            }

            #form p {
                text-align: center;
            }

            #form label {
                font-size: 100px;
            }

            input[type="radio"] {
                display: none;
            }

            label {
                color: grey;
            }

            .clasificacion {
                direction: ltr;
                unicode-bidi: bidi-override;
            }

            label:hover,
            label:hover ~ label {
                color: orange;
            }

            input[type="radio"]:checked ~ label {
                color: orange;
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
            <h2 style="text-align: center;">¡Administra tu prestamos!</h2><br/>
            <ul class="nav nav-pills nav-justified">

                <li class="active"><a data-toggle="pill" href="#menu1">Prestamos Pendientes</a></li>
                <li><a data-toggle="pill" href="#menu2">Cancelar Prestamo</a></li>
                <li><a data-toggle="pill" href="#menu3">Historial de Prestamos</a></li>
                <li><a data-toggle="pill" href="#menu4">Poner en Linea</a></li>
            </ul>

            <div class="tab-content">
                <div id="menu1" class="tab-pane fade in active"><br/><br/>


                    <form method="post" action="AceptarC">                  
                        Id del prestamo:  <input type="text" name="idPrestar" style="color: #333;" id="count" value="0" readonly><br/><br/>
                        <input type="submit" value= "Prestar"/><br/><br/>   
                    </form>
                    <form method="post" action="RechazarC">         
                        <input type="text" name="idPrestar" style="color: #333;" id="count3" value="0" readonly><br/><br/>
                        <input type="submit" value= "Rechazar"/><br/><br/>     
                    </form>
                    <table style="margin: auto;" border="1">
                        <tr>
                            <td>Id Prestamo</td>
                            <td>Id Calculadora</td>
                            <td>Id Prestamista</td>
                            <td>Motivo</td>
                            <td>Tiempo</td>
                            <td>Lugar</td>
                            <td>Agregar</td>
                        </tr>
                        <%
                            int prestamo = 0;
                            LinkedList<Prestamo> lista = consulta.getPrestamos();
                            LinkedList<Calculadora> cal = consulta.getCalculadoras(id);
                            for (int i = 0; i < lista.size(); i++) {
                                for (int j = 0; j < cal.size(); j++) {
                                    if (cal.get(j).getIdCalculadora() == lista.get(i).getIdCalculadora()) {
                                        prestamo = lista.get(i).getIdPrestamo();
                                        out.println("<tr>");
                                        out.println("<td>" + lista.get(i).getIdPrestamo() + "</td>");
                                        out.println("<td>" + lista.get(i).getIdCalculadora() + "</td>");
                                        out.println("<td>" + lista.get(i).getIdConsumidor() + "</td>");
                                        out.println("<td>" + lista.get(i).getMotivo() + "</td>");
                                        out.println("<td>" + lista.get(i).getTiempo() + "</td>");
                                        out.println("<td>" + lista.get(i).getLugar() + "</td>");
                                        out.println("<td>" + "<input type=\"button\" name=\"Solicitar\" id=\"Solicitar\" value=\"Agregar Id\"/ data-quantity=" + prestamo + " onClick = \"reply(this.id)\"> \n"
                                                + "</form>"
                                                + "</td>");
                                        prestamo = 0;
                                        out.println("</tr>");
                                    }
                                }
                            }
                        %>  
                    </table>
                </div>
                <div id="menu2" class="tab-pane fade"><br/><br/>
                    <form method="post" action="CancelarC">                  
                        Id del prestamo:  <input type="text" name="idSacar" style="color: #333;" id="count2" value="0" readonly><br/><br/>
                        <input type="submit" value= "Cancelar"/><br/><br/>   
                    </form>
                    <table style="margin: auto;" border="1">
                        <tr>
                            <td>Marca</td>
                            <td>Modelo</td>
                            <td>Id Calculadora</td>
                            <td>Agregar</td>
                        </tr>
                        <%
                            for (int i = 0; i < cal.size(); i++) {
                                if (cal.get(i).getDisponible()) {
                                    prestamo = cal.get(i).getIdCalculadora();
                                    out.println("<tr>");
                                    out.println("<td>" + cal.get(i).getMarca() + "</td>");
                                    out.println("<td>" + cal.get(i).getModelo() + "</td>");
                                    out.println("<td>" + cal.get(i).getIdCalculadora() + "</td>");
                                    out.println("<td>" + "<input type=\"button\" name=\"Solicitar\" id=\"Solicitar\" value=\"Agregar Id\"/ data-quantity=" + prestamo + " onClick = \"reply(this.id)\"> \n"
                                            + "</form>"
                                            + "</td>");
                                    prestamo = 0;
                                    out.println("</tr>");
                                }
                            }
                        %>  
                    </table>
                </div>
                 
                    
                <div id="menu3" class="tab-pane fade"><br/><br/>
                    <form method="post" action="ConsultarC">
                        <%
                            LinkedList<Prestamo> prestamos = consulta.getPrestamos();

                            for (int i = 0; i < prestamos.size(); i++) {
                                    out.println("Prestamo: "+i+" <br>");
                                    out.println("Lugar de Prestamo: " + prestamos.get(i).getLugar() + " <br>");
                                    out.println("</br>" + "Motivo del Prestamo: " + prestamos.get(i).getMotivo() + " <br>");
                                    out.println("</br>" + "Tiempo del Prestamo: " + prestamos.get(i).getTiempo() + "<br>");  
                                    out.println("<form>"+
                                                        " <p class=\"clasificacion\">"+
                                                        "<input id=\"radio1\" type=\"radio\" name=\"estrellas\" value=\"5\"><!--"+
                                                         "--><label for=\"radio1\">★</label><!--"+
                                                         "--><input id=\"radio2\" type=\"radio\" name=\"estrellas\" value=\"4\"><!--"+
                                                         "--><label for=\"radio2\">★</label><!--"+
                                                         "--><input id=\"radio3\" type=\"radio\" name=\"estrellas\" value=\"3\"><!--"+
                                                         "--><label for=\"radio3\">★</label><!--"+
                                                         "--><input id=\"radio4\" type=\"radio\" name=\"estrellas\" value=\"2\"><!--"+
                                                         "--><label for=\"radio4\">★</label><!--"+
                                                         "--><input id=\"radio5\" type=\"radio\" name=\"estrellas\" value=\"1\"><!--"+
                                                         "--><label for=\"radio5\">★</label>"+
                                                         " </p>"+
                                                         " </form>");
                            }
                        %>
                    </form>  
                </div>   
                    
                    
                    
                <div id="menu4" class="tab-pane fade"><br/><br/>
                    <form method="post" action="RePonerC">                  
                        Id del post:  <input type="text" name="idPoner" style="color: #333;" id="count2" value="0" readonly><br/><br/>
                        <input type="submit" value= "Poner"/><br/><br/>   
                    </form><table style="margin: auto;" border="1">
                        <tr>
                            <td>Marca</td>
                            <td>Modelo</td>
                            <td>Id Calculadora</td>
                            <td>Agregar</td>
                            <%
                                boolean visto = false;
                                for (int i = 0; i < cal.size(); i++) {
                                    if (!cal.get(i).getDisponible()) {
                                        for (int j = 0; j < lista.size(); j++) {
                                            if (lista.get(j).getIdCalculadora() == cal.get(i).getIdCalculadora()) {
                                                visto = true;

                                            }
                                        }
                                        if (!visto) {
                                            prestamo = cal.get(i).getIdCalculadora();
                                            out.println("<tr>");
                                            out.println("<td>" + cal.get(i).getMarca() + "</td>");
                                            out.println("<td>" + cal.get(i).getModelo() + "</td>");
                                            out.println("<td>" + cal.get(i).getIdCalculadora() + "</td>");
                                            out.println("<td>" + "<input type=\"button\" name=\"Solicitar\" id=\"Solicitar\" value=\"Agregar Id\"/ data-quantity=" + prestamo + " onClick = \"reply(this.id)\"> \n"
                                                    + "</form>"
                                                    + "</td>");
                                            prestamo = 0;
                                            out.println("</tr>");
                                        }
                                    }

                                    visto = false;
                                }
                            %>
                        </tr>
                </div>        
                        
                
                        
            </div>
         
        </div>
                     
    </body>
</html>
