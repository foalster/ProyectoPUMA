<%-- 
    Document   : Usuarios
    Created on : Apr 9, 2016, 5:26:43 PM
    Author     : Foalster
--%>
<%@page import="java.sql.Date"%>
<%@page import="Modelo.Usuario"%>
<%@page import="java.util.ArrayList"%>
<jsp:useBean id="consulta" class="Controlador.Control"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Usuarios en el sistema</title>
    </head>
    <body>
        <%
            ArrayList usuarios = new ArrayList();
            
            consulta.conectar();
            usuarios = consulta.getUsuarios();
            consulta.desconectar();
            
            if(usuarios.size()>0){
                int id = 0;
                String usuario = null;
                String password = null;
                String nombre = null;
                String appat = null;
                String apmat = null;
                String fechanac = null;
                String genero = null;
                String email = null;
              
                for(int i = 0; i < usuarios.size(); i++){
                    id = ((Usuario)usuarios.get(i)).getIdUsuario();
                    usuario = ((Usuario)usuarios.get(i)).getUsuario();
                    password = ((Usuario)usuarios.get(i)).getPassword();
                    nombre = ((Usuario)usuarios.get(i)).getNombre();
                    appat = ((Usuario)usuarios.get(i)).getApPat();
                    apmat = ((Usuario)usuarios.get(i)).getApMat();
                    fechanac = ((Usuario)usuarios.get(i)).getFechaNac();
                    genero = ((Usuario)usuarios.get(i)).getGenero();
                    email = ((Usuario)usuarios.get(i)).getEmail();
                    out.write(id + " | " + usuario + " | " + password + " | " + nombre + " " + appat + " " +
                            apmat + " | " + fechanac + " | " + genero + " | "  + email + "<br/>");
                }
            }else{
                out.write("Error");
            }
        %>
    </body>
</html>