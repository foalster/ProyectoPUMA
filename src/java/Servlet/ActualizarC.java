/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Controlador.Conexion;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Foalster
 */
public class ActualizarC extends HttpServlet {

    Conexion co = new Conexion();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        HttpSession session=request.getSession();
        int id = (Integer) session.getAttribute("id");
        String usuario = request.getParameter("usuario");
        String password = request.getParameter("password");
        String nombre = request.getParameter("nombre");
        String appat = request.getParameter("appat");
        String apmat = request.getParameter("apmat");
        String fechanac = request.getParameter("fechanac");
        String genero = request.getParameter("genero");
        String email = request.getParameter("email");

        if (usuario.length() != 0 && password.length() != 0 && nombre.length() != 0 && appat.length() != 0 &&
                apmat.length() != 0 && genero.length() != 0 && email.length() != 0) {
            if (!co.checarUsuario(usuario, email)){
                if(co.checkAlpha(nombre)){
                    if(co.checkAlpha(appat)){
                        if(co.checkAlpha(apmat)){
                            if (co.validarEmail(email)){
                                
                                co.editUsuario(id,usuario, password, nombre, appat, apmat, fechanac, genero, email);
                                session.setAttribute("usuario",usuario); 
                                request.getRequestDispatcher("Inicio.jsp").include(request, response);
                            }
                        }else{
                            request.getRequestDispatcher("Registrar.jsp").include(request, response);
                            out.println("<!DOCTYPE html>");
                            out.println("<html>");
                            out.println("<head>");
                            out.println("<title>Servlet NewServlet</title>");            
                            out.println("</head>");
                            out.println("<body>");
                            out.println("<div class=\"alert alert-danger\" role=\"alert\">\n" +
                                    "  <span class=\"glyphicon glyphicon-exclamation-sign\" aria-hidden=\"true\"></span>\n" +
                                    "  <span class=\"sr-only\">Error:</span>\n" +
                                    "  Apellido materno introducido no válido" +
                                    "</div>");
                            out.println("</body>");
                            out.println("</html>");
                        }
                    }else{
                        request.getRequestDispatcher("Registrar.jsp").include(request, response);
                        out.println("<!DOCTYPE html>");
                        out.println("<html>");
                        out.println("<head>");
                        out.println("<title>Servlet NewServlet</title>");            
                        out.println("</head>");
                        out.println("<body>");
                        out.println("<div class=\"alert alert-danger\" role=\"alert\">\n" +
                                "  <span class=\"glyphicon glyphicon-exclamation-sign\" aria-hidden=\"true\"></span>\n" +
                                "  <span class=\"sr-only\">Error:</span>\n" +
                                "  Apellido paterno introducido no válido" +
                                "</div>");
                        out.println("</body>");
                        out.println("</html>");
                    }
                }else{
                    request.getRequestDispatcher("Registrar.jsp").include(request, response);
                    out.println("<!DOCTYPE html>");
                    out.println("<html>");
                    out.println("<head>");
                    out.println("<title>Servlet NewServlet</title>");            
                    out.println("</head>");
                    out.println("<body>");
                    out.println("<div class=\"alert alert-danger\" role=\"alert\">\n" +
                            "  <span class=\"glyphicon glyphicon-exclamation-sign\" aria-hidden=\"true\"></span>\n" +
                            "  <span class=\"sr-only\">Error:</span>\n" +
                            "  Apellido paterno introducido no válido" +
                            "</div>");
                    out.println("</body>");
                    out.println("</html>");
                }
            }else{
                request.getRequestDispatcher("Registrar.jsp").include(request, response);
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Servlet NewServlet</title>");            
                out.println("</head>");
                out.println("<body>");
                out.println("<div class=\"alert alert-danger\" role=\"alert\">\n" +
                        "  <span class=\"glyphicon glyphicon-exclamation-sign\" aria-hidden=\"true\"></span>\n" +
                        "  <span class=\"sr-only\">Error:</span>\n" +
                        "  Nombre de usuario o email ya existentes" +
                        "</div>");
                out.println("</body>");
                out.println("</html>");
            }
        }else{
            request.getRequestDispatcher("Registrar.jsp").include(request, response);
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet NewServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<div class=\"alert alert-danger\" role=\"alert\">\n" +
                        "  <span class=\"glyphicon glyphicon-exclamation-sign\" aria-hidden=\"true\"></span>\n" +
                        "  <span class=\"sr-only\">Error:</span>\n" +
                        "  Por favor, completa el formulario." +
                        "</div>");
            out.println("</body>");
            out.println("</html>");
        }
    }
        // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
        /**
         * Handles the HTTP <code>GET</code> method.
         *
         * @param request servlet request
         * @param response servlet response
         * @throws ServletException if a servlet-specific error occurs
         * @throws IOException if an I/O error occurs
         */
        @Override
        protected void doGet
        (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            try {
                processRequest(request, response);
            } catch (Exception ex) {
                Logger.getLogger(RegistrarC.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        /**
         * Handles the HTTP <code>POST</code> method.
         *
         * @param request servlet request
         * @param response servlet response
         * @throws ServletException if a servlet-specific error occurs
         * @throws IOException if an I/O error occurs
         */
        @Override
        protected void doPost
        (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            try {
                processRequest(request, response);
            } catch (Exception ex) {
                Logger.getLogger(RegistrarC.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        /**
         * Returns a short description of the servlet.
         *
         * @return a String containing servlet description
         */
        @Override
        public String getServletInfo
        
            () {
        return "Short description";
        }// </editor-fold>

            public static void main(String[] args) {
                Conexion co = new Conexion();
                int id = 3;
                String usuario= "hi6721";
                String nombre= "prueba";
                String appat= "algo";
                String apmat= "alguien";
                String fechanac= "12/02/11";
                String genero= "Hombre";
                String email= "prueba@gmail.com";
                String password="hola123";
                co.editUsuario(id, usuario, password,nombre, appat, apmat, fechanac, genero,email);
                
                
        
            }
    }
