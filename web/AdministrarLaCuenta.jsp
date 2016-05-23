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
        <script  type="text/javascript">
            $(function () {
                $('input:button').click(function (){
                    $('#count').val($(this).data('quantity'));
                });
            });
        </script>
        <script  type="text/javascript">
            $(function () {
                $('input:button').click(function (){
                    $('#count2').val($(this).data('quantity'));
                });
            });
        </script>
        <script type="text/javascript">
            function init() {
                calendar.set("date");
            }
        </script>
        <title>PUMA</title>
    </head>
    <body onload="init()" style = "background-color: #666; font-weight: bold"color: #fff">
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


        <div id="accordion" role="tablist" aria-multiselectable="true">
            <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="headingOne">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                            Crear Calculadora
                        </a>
                    </h4>
                </div>
                <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
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
            </div>

            <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="headingTwo">
                    <h4 class="panel-title">
                        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                            Eliminar Calculadora
                        </a>
                    </h4>
                </div>
                <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                    <form method="post" action="EliminarC">
                        Id <input type="text" name="idCalculadora" style="color: #333;" id="count" value="0" readonly><br/><br/>
                        <input type="submit" style="color: #333;" value="Eliminar"/>
                    </form>
                    <table border="1">
                        <tr>
                            <td>Id</td>
                            <td>Marca</td>
                            <td>Modelo</td>
                            <td>Disponible</td>
                            <td>Eliminar</td>
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
                                if (lista.get(i).getDisponible()) {
                                    out.println("<td>" + "<input type=\"button\" name=\"Solicitar\" id=\"Solicitar\" value=\"Agregar Id\"/ data-quantity=" + nombre + " onClick = \"reply(this.id)\"> \n"
                                            + "</form>"
                                            + "</td>");
                                    nombre = 0;
                                    out.println("</tr>");
                                }else{
                                    out.println("<td>" + "<label> No disponible </label>"
                                            + "</td>");
                                    nombre = 0;
                                    out.println("</tr>");
                                }
                            }
                        %>            
                    </table>        
                </div>
            </div>


            <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="headingThree">
                    <h4 class="panel-title">
                        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseTwo">
                            Ver Caculadroas Publicadas
                        </a>
                    </h4>
                </div>
                <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                    <table border="1">
                        <tr>
                            <td>Id</td>
                            <td>Marca</td>
                            <td>Modelo</td>
                            <td>Disponible</td>
                        </tr>
                        <%
                            nombre = 0;
                            lista = consulta.getCalculadoras(id);

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
            </div>


            <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="headingFour">
                    <h4 class="panel-title">
                        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                            Actualizar Calculadora
                        </a>
                    </h4>
                </div>
                <div id="collapseFour" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFour">
                    <form method="post" action="ActualizarCalculadoraC">
                        Id <input type="text" name="calculadora" style="color: #333;" id="count2" value="0" readonly><br/><br/>
                        <input type="submit" style="color: #333;" value="Actualizar"/>
                    </form>
                    <table border="1">
                        <tr>
                            <td>Id</td>
                            <td>Marca</td>
                            <td>Modelo</td>
                            <td>Disponible</td>
                            <td>Eliminar</td>
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
                                }else{
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



            <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="headingFive">
                    <h4 class="panel-title">
                        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
                            Actualizar
                        </a>
                    </h4>
                </div>
                <div id="collapseFive" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFive">
                    <form method="post" action="ActualizarC">
                        <%
                           ArrayList<Usuario>  user= consulta.getUsuarios();
                            
                            for (int i = 0; i < user.size(); i++) {
                                if(user.get(i).getIdUsuario()==id){
                                    out.println("<p>"+"Fecha de nacimiento: "+"<input type=\"text\" name=\"fechanac\" id=\"date\" readonly value=" +user.get(i).getFechaNac()+" </p>");
                                    out.println("<p>"+"Password: "+"<input type=\"password\" name=\"password\" value=" +user.get(i).getPassword()+" </p>");
                                    out.println("<p>"+"Correo: "+"<input type=\"text\" name=\"email\" value=" +user.get(i).getEmail()+" </p>");
                                    
                                    
                                }
                                
                            }
                           %>
                           <br>
                           <b><input type="submit" value= "Actualizar"/></b><br/><br/>
                           <br/>
                    </form>  
                </div>
            </div>





            <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="headingSix">
                    <h4 class="panel-title">
                        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseSix" aria-expanded="false" aria-controls="collapseSix">
                            Información de la Cuenta
                        </a>
                    </h4>
                </div>
                <div id="collapseSix" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingSix">
                    <form method="post" action="ConsultarCuentaC">
                        <%
                           ArrayList<Usuario>  usuarios= consulta.getUsuarios();
                            
                            for (int i = 0; i < usuarios.size(); i++) {
                                if(usuarios.get(i).getIdUsuario()==id){
                                    out.println("Nombre : "+usuarios.get(i).getNombre()+"<br>");
                                    out.println("Apellido Paterno: "+usuarios.get(i).getApPat()+"<br>");
                                    out.println("Apellido Materno: "+usuarios.get(i).getApMat()+"<br>");
                                    out.println("Fecha de nacimiento: "+usuarios.get(i).getFechaNac()+"<br>");
                                    out.println("Genero:  "+usuarios.get(i).getGenero()+"<br>");
                                    out.println("Correo: "+usuarios.get(i).getEmail()+"<br>");
                                    
                                }
                                
                            }
                           %>
                    </form>    
                    
                </div>
            </div>


            <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="headingSeven">
                    <h4 class="panel-title">
                        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseSeven" aria-expanded="false" aria-controls="collapseSeven">
                            Borrar Cuenta
                        </a>
                    </h4>
                </div>
                <div id="collapseSeven" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingSeven">
                    Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                </div>
            </div>

        </div>



    </body>
</html>
