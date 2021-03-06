/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Controlador.Conexion;
import Controlador.Control;
import Modelo.Calculadora;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author SONY_VAIO
 */
public class ActualizarCalculadoraC extends HttpServlet {

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
        int idCalculadora = Integer.parseInt(request.getParameter("idCalculadora"));
        String marca = request.getParameter("marca");
        String modelo = request.getParameter("modelo");
        Control consulta = new Control();
        LinkedList<Calculadora> lista = consulta.getCalculadoras();
        Conexion co = new Conexion();
        for (int i = 0; i < lista.size(); i++) {
            if (lista.get(i).getIdCalculadora() == idCalculadora) {
                if(marca.length() == 0){
                    marca =lista.get(i).getMarca();
                }
                if(modelo.length() == 0){
                    modelo=lista.get(i).getModelo();
                }              
            }
        }
               if( co.editCalculadora(idCalculadora, marca, modelo)){
                out.println("<!DOCTYPE html>");
                    out.println("<html>");
                    out.println("<head>");
                    out.println("<title></title>");            
                    out.println("</head>");
                    out.println("<body>");
                    out.println("<div class=\"alert alert-success\" role=\"alert\">\n" +
                                "<strong>Bien hecho!</strong> Has actualizado tu información de la claucladora.\n" +
                                "</div>");
                    out.println("</body>");
                    out.println("</html>");
                request.getRequestDispatcher("Inicio.jsp").include(request, response);
            }else {
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Servlet NewServlet</title>");
                out.println("</head>");
                out.println("<body>");
                out.println("<div class=\"alert alert-danger\" role=\"alert\">\n"
                        + "  <span class=\"glyphicon glyphicon-exclamation-sign\" aria-hidden=\"true\"></span>\n"
                        + "  <span class=\"sr-only\">Error:</span>\n"
                        + "  Email no válido"
                        + "</div>");
                out.println("</body>");
                out.println("</html>");
                request.getRequestDispatcher("Inicio.jsp").include(request, response);
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
            Logger.getLogger(ActualizarCalculadoraC.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ActualizarCalculadoraC.class.getName()).log(Level.SEVERE, null, ex);
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
