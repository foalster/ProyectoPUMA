<%-- 
    Document   : Inicio
    Created on : Apr 10, 2016, 3:23:56 AM
    Author     : Foalster
--%>




<%@page import="Modelo.Usuario"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.Calculadora"%>
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
        <link href="css/acordeon.css" rel="stylesheet"> 
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
        <script  type="text/javascript">$(function () {
                $('input:button').click(function () {
                    $('#count').val($(this).data('quantity'));
                });
            });
        </script>
        <title>PUMA</title>
    </head>
    <body onload="init()" style = "font-weight: bold;">
        <%
            HttpSession sessions = request.getSession(false);
            String usuario = (String) sessions.getAttribute("usuario");
            int id = (Integer) sessions.getAttribute("id");//Obtener Id del Usuario.

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

        <div class="container">
            <h2>¡Administra tu perfil!</h2><br/>
            <ul class="nav nav-tabs nav-justified" >

                <li class="active"><a data-toggle="tab" href="#menu1">Información de Perfil</a></li>
                <li><a data-toggle="tab" href="#menu2">Crear Calculadora</a></li>
                <li><a data-toggle="tab" href="#menu3">Calculadoras Publicadas</a></li>
                <li><a data-toggle="tab" href="#menu4">Actualizar Calculadoras</a></li>
                <li><a data-toggle="tab" href="#menu4">Eliminar Calculadoras</a></li>
            </ul>

            <div class="tab-content">
                <div id="menu1" class="tab-pane fade in active"><br/><br/>
                    <form method="post" action="ConsultarCuentaC">
                        <%
                            ArrayList<Usuario> usuarios = consulta.getUsuarios();

                            for (int i = 0; i < usuarios.size(); i++) {
                                if (usuarios.get(i).getIdUsuario() == id) {
                                    out.println("Nombre : " + usuarios.get(i).getNombre() + "<br>");
                                    out.println("Apellido Paterno: " + usuarios.get(i).getApPat() + "<br>");
                                    out.println("Apellido Materno: " + usuarios.get(i).getApMat() + "<br>");
                                    out.println("Fecha de nacimiento: " + usuarios.get(i).getFechaNac() + "<br>");
                                    out.println("Genero:  " + usuarios.get(i).getGenero() + "<br>");
                                    out.println("Correo: " + usuarios.get(i).getEmail() + "<br>");

                                }
                            }
                        %>
                    </form>  
                </div>
                <div id="menu2" class="tab-pane fade">
                    <form method="post" action="CrearObjeto">
                        <br/>Marca: <input type="text" name="marca" style="text-align: center"/><br/><br/>
                        Modelo: <input type="text" name="modelo" style="text-align: center"/><br/><br/>
                        Tipo: <select name="tipo" required="">
                            <option value=0>Seleccione...</option>
                            <option value=1 >Básica</option>
                            <option value=2>Científica</option>
                            <option value=3>Graficadora</option>
                        </select><br/><br/>
                        <b><input type="submit" value="Crear"/></b><br/><br/>
                    </form>
                </div>
                <div id="menu3" class="tab-pane fade">
                    <table style="margin: auto;" border="1">
                        <tr>
                            <td>Id</td>
                            <td>Marca</td>
                            <td>Modelo</td>
                            <td>Disponible</td>
                        </tr>
                        <%
                            int nombre = 0;
                            LinkedList<Calculadora> lista = consulta.getCalculadoras(id);

                            for (int i = 0; i < lista.size(); i++) {
                                nombre = lista.get(i).getIdCalculadora();
                                lista.get(i).getIdCalculadora();
                                out.println("<tr>");
                                out.println("<td>" + lista.get(i).getIdCalculadora() + "</td>");
                                out.println("<td>" + lista.get(i).getMarca() + "</td>");
                                out.println("<td>" + lista.get(i).getModelo() + "</td>");
                                out.println("<td>" + lista.get(i).getDisponible() + "</td>");
                                out.println("</tr>");

                            }
                        %>            
                    </table>        
                </div>
                <div id="menu4" class="tab-pane fade">                    
                                    
                    <form method="post" action="EliminarC">                  
                        Id <input type="text" name="idCalculadora" style="color: #333;" id="count" value="0" readonly><br/><br/>    
                        <input type="submit" value= "ActualizarCalculadoraC"/><br/><br/>                      
                    </form>         
                    <table style="margin: auto;" border="1">
                        <tr>
                            <td>Id</td>
                            <td>Marca</td>
                            <td>Modelo</td>
                            <td>Disponible</td>
                            <td>Agregar</td>
                        </tr>
                        <%
                            for (int i = 0; i < lista.size(); i++) {
                                if (lista.get(i).getDisponible()) {
                                    nombre = lista.get(i).getIdCalculadora();
                                    lista.get(i).getIdCalculadora();
                                    out.println("<tr>");
                                    out.println("<td>" + lista.get(i).getIdCalculadora() + "</td>");
                                    out.println("<td>" + lista.get(i).getMarca() + "</td>");
                                    out.println("<td>" + lista.get(i).getModelo() + "</td>");
                                    out.println("<td>" + lista.get(i).getDisponible() + "</td>");
                                    if (lista.get(i).getDisponible()) {
                                        out.println("<td>" + "<input type=\"button\" name=\"Solicitar\" id=\"Solicitar\" value=\"Agregar Id\"/ data-quantity=" + nombre + " onClick = \"reply(this.id)\"> \n"
                                                + "</form>"
                                                + "</td>");
                                        nombre = 0;
                                        out.println("</tr>");
                                    } else {
                                        out.println("<td>" + "<label> No disponible </label>"
                                                + "</td>");
                                        nombre = 0;
                                        out.println("</tr>");
                                    }
                                }
                            }
                        %>            
                    </table>        
                </div>
                    
                    <div id="menu5" class="tab-pane fade">                    
                                    
                    <form method="post" action="EliminarC">                  
                        Id <input type="text" name="idCalculadora" style="color: #333;" id="count" value="0" readonly><br/><br/>    
                        <input type="submit" value= "Eliminar"/><br/><br/>                      
                    </form>         
                    <table style="margin: auto;" border="1">
                        <tr>
                            <td>Id</td>
                            <td>Marca</td>
                            <td>Modelo</td>
                            <td>Disponible</td>
                            <td>Agregar</td>
                        </tr>
                        <%
                            for (int i = 0; i < lista.size(); i++) {
                                if (lista.get(i).getDisponible()) {
                                    nombre = lista.get(i).getIdCalculadora();
                                    lista.get(i).getIdCalculadora();
                                    out.println("<tr>");
                                    out.println("<td>" + lista.get(i).getIdCalculadora() + "</td>");
                                    out.println("<td>" + lista.get(i).getMarca() + "</td>");
                                    out.println("<td>" + lista.get(i).getModelo() + "</td>");
                                    out.println("<td>" + lista.get(i).getDisponible() + "</td>");
                                    if (lista.get(i).getDisponible()) {
                                        out.println("<td>" + "<input type=\"button\" name=\"Solicitar\" id=\"Solicitar\" value=\"Agregar Id\"/ data-quantity=" + nombre + " onClick = \"reply(this.id)\"> \n"
                                                + "</form>"
                                                + "</td>");
                                        nombre = 0;
                                        out.println("</tr>");
                                    } else {
                                        out.println("<td>" + "<label> No disponible </label>"
                                                + "</td>");
                                        nombre = 0;
                                        out.println("</tr>");
                                    }
                                }
                            }
                        %>            
                    </table>        
                </div>

            </div>
        </div>





    </body>
</html>
