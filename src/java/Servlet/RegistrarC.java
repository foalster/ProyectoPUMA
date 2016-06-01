/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Controlador.Conexion;
import Modelo.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
public class RegistrarC extends HttpServlet {

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

        String usuario = request.getParameter("usuario");
        String password = request.getParameter("password");
        String nombre = request.getParameter("nombre");
        String appat = request.getParameter("appat");
        String apmat = request.getParameter("apmat");
        String fechanac = request.getParameter("fechanac");
        String genero = request.getParameter("genero");
        String email = request.getParameter("email");
        ArrayList usu = new ArrayList();
        int id = 0;

        if (usuario.length() != 0 && password.length() != 0 && nombre.length() != 0 && appat.length() != 0
                && apmat.length() != 0 && genero.length() != 0 && email.length() != 0) {
            if (!co.checarUsuario(usuario, email)) {
                if (co.checkAlpha(nombre)) {
                    if (co.checkAlpha(appat)) {
                        if (co.checkAlpha(apmat)) {
                            if (co.validarEmail(email)) {
                                if (co.ValidarFecha(fechanac)) {
                                    co.registrar(usuario, password, nombre, appat, apmat, fechanac, genero, email);
                                    co.conectar();
                                    usu = co.getId(usuario);
                                    for (int i = 0; i < usu.size(); i++) {
                                        id = ((Usuario) usu.get(i)).getIdUsuario();
                                    }
                                    HttpSession session = request.getSession();
                                    session.setAttribute("usuario", usuario);
                                    session.setAttribute("id",id);
                                    request.getRequestDispatcher("Inicio.jsp").include(request, response);
                                } else {
                                    out.println("<!DOCTYPE html>");
                                    out.println("<html>");
                                    out.println("<head>");
                                    out.println("<title>Servlet NewServlet</title>");
                                    out.println("</head>");
                                    out.println("<body>");
                                    out.println("<div class=\"alert alert-danger\" role=\"alert\">\n"
                                            + "  <span class=\"glyphicon glyphicon-exclamation-sign\" aria-hidden=\"true\"></span>\n"
                                            + "  <span class=\"sr-only\">Error:</span>\n"
                                            + "  Fecha de naciemiento inválida. Por favor, introduce una fecha válida. "
                                            + "</div>");
                                    out.println("</body>");
                                    out.println("</html>");
                                    request.getRequestDispatcher("Registrar.jsp").include(request, response);
                                }
                            } else {
                                out.println("<!DOCTYPE html>");
                                out.println("<html>");
                                out.println("<head>");
                                out.println("<title>Servlet NewServlet</title>");
                                out.println("</head>");
                                out.println("<body>");
                                out.println("<div class=\"alert alert-danger\" role=\"alert\">\n"
                                        + "  <span class=\"glyphicon glyphicon-exclamation-sign\" aria-hidden=\"true\"></span>\n"
                                        + "  <span class=\"sr-only\">Error:</span>\n"
                                        + "  Correo electrónico inválido."
                                        + "</div>");
                                out.println("</body>");
                                out.println("</html>");
                                request.getRequestDispatcher("Registrar.jsp").include(request, response);
                            }
                        } else {
                            out.println("<!DOCTYPE html>");
                            out.println("<html>");
                            out.println("<head>");
                            out.println("<title>Servlet NewServlet</title>");
                            out.println("</head>");
                            out.println("<body>");
                            out.println("<div class=\"alert alert-danger\" role=\"alert\">\n"
                                    + "  <span class=\"glyphicon glyphicon-exclamation-sign\" aria-hidden=\"true\"></span>\n"
                                    + "  <span class=\"sr-only\">Error:</span>\n"
                                    + "  Apellido materno introducido no válido. Vuelve a introducirlo."
                                    + "</div>");
                            out.println("</body>");
                            out.println("</html>");
                            request.getRequestDispatcher("Registrar.jsp").include(request, response);
                        }
                    } else {
                        out.println("<!DOCTYPE html>");
                        out.println("<html>");
                        out.println("<head>");
                        out.println("<title>Servlet NewServlet</title>");
                        out.println("</head>");
                        out.println("<body>");
                        out.println("<div class=\"alert alert-danger\" role=\"alert\">\n"
                                + "  <span class=\"glyphicon glyphicon-exclamation-sign\" aria-hidden=\"true\"></span>\n"
                                + "  <span class=\"sr-only\">Error:</span>\n"
                                + "  Apellido paterno introducido no válido. Vuelve a introducirlo."
                                + "</div>");
                        out.println("</body>");
                        out.println("</html>");
                        request.getRequestDispatcher("Registrar.jsp").include(request, response);
                    }
                } else {
                    out.println("<!DOCTYPE html>");
                    out.println("<html>");
                    out.println("<head>");
                    out.println("<title>Servlet NewServlet</title>");
                    out.println("</head>");
                    out.println("<body>");
                    out.println("<div class=\"alert alert-danger\" role=\"alert\">\n"
                            + "  <span class=\"glyphicon glyphicon-exclamation-sign\" aria-hidden=\"true\"></span>\n"
                            + "  <span class=\"sr-only\">Error:</span>\n"
                            + "  El Nombre introducido no es válido."
                            + "</div>");
                    out.println("</body>");
                    out.println("</html>");
                    request.getRequestDispatcher("Registrar.jsp").include(request, response);
                }
            } else {
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Servlet NewServlet</title>");
                out.println("</head>");
                out.println("<body>");
                out.println("<div class=\"alert alert-danger\" role=\"alert\">\n"
                        + "  <span class=\"glyphicon glyphicon-exclamation-sign\" aria-hidden=\"true\"></span>\n"
                        + "  <span class=\"sr-only\">Error:</span>\n"
                        + "  Nombre de usuario o email ya existentes en el sistema."
                        + "</div>");
                out.println("</body>");
                out.println("</html>");
                request.getRequestDispatcher("Registrar.jsp").include(request, response);
            }
        } else {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet NewServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<div class=\"alert alert-danger\" role=\"alert\">\n"
                    + "  <span class=\"glyphicon glyphicon-exclamation-sign\" aria-hidden=\"true\"></span>\n"
                    + "  <span class=\"sr-only\">Error:</span>\n"
                    + "  Por favor, completa todo el formulario."
                    + "</div>");
            out.println("</body>");
            out.println("</html>");
            request.getRequestDispatcher("Registrar.jsp").include(request, response);
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
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
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
