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
        <style>
            #boton{
	padding: 10px;
	background: orange;
	width: 95px;
	cursor: pointer;
	margin-top: 10px;
	margin-bottom: 10px;
	box-shadow: 0px 0px 1px #000;
	display: inline-block;
}

#boton:hover{
	opacity: .8;
}

#caja{
	width: 100%;
	margin: auto;
	height: 0px;
	background: #000;
	box-shadow: 10px 10px 3px #D8D8D8;
	transition: height .4s;
}
        </style>
        <script>var clic = 1;
function divLogin(){ 
   if(clic==1){
   document.getElementById("caja").style.height = "100px";
   clic = clic + 1;
   } else{
       document.getElementById("caja").style.height = "0px";      
    clic = 1;
   }   
}
        </script>
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
            <div id="boton" onclick="divLogin()">
Mostrar/Ocultar
</div>
<div id="caja">
</div>
        </div>
    </body>
</html>
