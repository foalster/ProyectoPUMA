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
                            function reply(clicked_id){
                                idSeleccionada = clicked_id;
                                //alert(idSeleccionada);
                                //Servlet.start(clicked_id);
                    
                }
                            </script>
        <title>PUMA</title>
    </head>
    <body>
        <%
            HttpSession sessions = request.getSession(false);
            String usuario = (String) sessions.getAttribute("usuario");
        %>
        <div class="menu">
            <nav>
                <ul>
                    <li><a href="index.jsp">PUMA</a></li>
                    
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
        

        <table border="1">
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
                lista = consulta.getCalculadoras();
                consulta.desconectar();
                
                for (int i = 0; i < lista.size(); i++) {
                    nombre = lista.get(i).getIdCalculadora();
                    lista.get(i).getIdCalculadora();
                    out.println("<tr>");
                    out.println("<td>" + lista.get(i).getMarca() + "</td>");
                    out.println("<td>" + lista.get(i).getModelo() + "</td>");
                    out.println("<td>" + lista.get(i).getIdCalculadora() + "</td>");
                    if (lista.get(i).getDisponible()) {
                        out.println("<td>" + "<form action=\"Solicitar.jsp\"  method=\"post\">\n"
                                + "<input type=\"submit\" value=\"Solicitar\"/ id=" + nombre + " onClick = \"reply(this.id)\"> \n"
                                + "</form>"
                                + "</td>");
                        /**
                         out.println("<td><form action=\"SolicitarC\" method=\"post\">\n"
                                + "<input name =\"" + lista.get(i).getIdCalculadora() + "\"type=\"submit\" value=\"Solicitar\"/>\n"
                                + "</form></td>");
                                */

                    nombre = 0;
                    out.println("</tr>");
                }
                //System.out.println("A");
                //SolicitarC.start(boton);
                }
            %>
                                
                                
                   
            
            
            
        </table>
            <%request.setAttribute("seleccionada", new Integer(idSeleccionada));%>
            
    <form action="">
    <input type="hidden" name="hidden" value=""idSeleccionada >
    <input type="submit" value="submit"></form>
    </body>
</html>
