/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Controlador.Conexion;
import Controlador.Control;
import Modelo.Calculadora;
import Modelo.Email;
import Modelo.Prestamo;
import Modelo.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.print.DocFlavor;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author SONY_VAIO
 */
public class AceptarC extends HttpServlet {

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

        //System.out.println("aceptando");
        String idPr = request.getParameter("idPrestar");
        
        int idP = Integer.parseInt(idPr);
        
        if (idP != 0) {
            System.out.println("id = " + idP);
            int idCons;
            String email, modelo, motivo, lugar, tiempo;
            
            Control consulta = new Control();
            Conexion co = new Conexion();
            
            LinkedList<Prestamo> lista = co.getPrestamos();
            ArrayList<Usuario> usuarios = consulta.getUsuarios();
            LinkedList<Calculadora> cal = consulta.getCalculadoras();
            a:
            for (int i = 0; i < lista.size(); i++) {
                if (lista.get(i).getIdPrestamo() == idP) {
                    idCons = lista.get(i).getIdConsumidor();
                    //System.out.println(" 1 "+ idCons);
                    for (int j = 0; j < usuarios.size(); j++) {
                        //System.out.println("J "+j);
                        if (usuarios.get(j).getIdUsuario() == idCons) {
                            //System.out.println(" 2 ");
                            email = usuarios.get(j).getEmail();
                            lugar = lista.get(i).getLugar();
                            tiempo = lista.get(i).getTiempo();
                            motivo = lista.get(i).getMotivo();
                            //System.out.println(" 3 ");
                            for (int k = 0; k < cal.size(); k++) {
                                if (lista.get(i).getIdCalculadora() == cal.get(k).getIdCalculadora()) {
                                    modelo = cal.get(k).getModelo();
                                    //System.out.println("a punto de enviar correo con: " + email + motivo + lugar + modelo + tiempo);
                                    co.aceptarPrestamo(idP);
                                    
                                    Email nuevo = new Email();
                                    nuevo.enviarCorreo("Foalster.PUMA@hotmail.com", "serchselacome14milgemas", email, "Se ha acepatado su solicitud por el modelo " + modelo + " \n con motivo " + motivo + " a entregarse en " + lugar + " por " + tiempo, "Solicitud Aceptada PUMA");
                                    System.out.println("enviado");
                                    response.sendRedirect("Prestamo.jsp");
                                    break a;
                                }
                                
                            }
                            
                    out.println("<!DOCTYPE html>");
                    out.println("<html>");
                    out.println("<head>");
                    out.println("<title>Servlet NewServlet</title>");            
                    out.println("</head>");
                    out.println("<body>");
                    out.println("<div class=\"alert alert-success\" role=\"alert\">\n" +
                                "<strong>Bien hecho!</strong> Has enviado un correo al usuario.\n" +
                                "</div>");
                    out.println("</body>");
                    out.println("</html>");
                            response.sendRedirect("Inicio.jsp");
                            
            out.println("<!DOCTYPE html>");
                    out.println("<html>");
                    out.println("<head>");
                    out.println("<title>Servlet NewServlet</title>");            
                    out.println("</head>");
                    out.println("<body>");
                    out.println("<div class=\"alert alert-danger\" role=\"alert\">\n" +
                                "<strong></strong> No se a logrado aceptar con exito la solicitu.\n" +
                                "</div>");
                    out.println("</body>");
                    out.println("</html>");
                        }
                    }
                }
            }

            //response.sendRedirect("Inicio.jsp");
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
            Logger.getLogger(AceptarC.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(AceptarC.class.getName()).log(Level.SEVERE, null, ex);
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
