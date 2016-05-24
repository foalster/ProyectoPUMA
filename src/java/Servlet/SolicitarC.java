/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Controlador.Conexion;
import com.sun.xml.rpc.processor.modeler.j2ee.xml.string;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;

/**
 *
 * @author Foalster
 */
public class SolicitarC extends HttpServlet {

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
        //String tpm = Inicio.idSeleccionada;
        Integer variable = (Integer) request.getAttribute("seleccionada");

        int idCalculadora = Integer.parseInt(request.getParameter("idCalculadora"));
        String tiempo = request.getParameter("tiempo");
        String lugar = request.getParameter("lugar");
        String motivo = request.getParameter("motivo");

        System.out.println("aqui");
        if (tiempo.length() != 0 && lugar.length() != 0 && motivo.length() != 0 && idCalculadora != 0) {
            System.out.println(" aaaa");
            String para = "hola.tu.mauricio@gmail.com";
            String de = "mau_ricio1993@hotmail.com";
            String host = "localhost";
            Properties propiedades = System.getProperties();
            propiedades.setProperty("mail.smtp.host", host);
            Session sesion = Session.getDefaultInstance(propiedades);

            try {
                // Creamos un objeto mensaje tipo MimeMessage por defecto.
                MimeMessage mensaje = new MimeMessage(sesion);

                // Asignamos el “de o from” al header del correo.
                mensaje.setFrom(new InternetAddress(de));

                // Asignamos el “para o to” al header del correo.
                mensaje.addRecipient(Message.RecipientType.TO, new InternetAddress(para));

                // Asignamos el asunto
                mensaje.setSubject("Primer correo sencillo");

                // Asignamos el mensaje como tal
                mensaje.setText("El mensaje de nuestro primer correo");

                // Enviamos el correo
                Transport.send(mensaje);
                System.out.println("Mensaje enviado");
            } catch (MessagingException e) {
                System.out.println("error exepcion");
                e.printStackTrace();
            }

            response.sendRedirect("Inicio.jsp");
        } else {
            request.getRequestDispatcher("SolicitarB.jsp").include(request, response);
        }
    }

    //co.conectar();
    public static void start(int id) {
        //Solicitar.jsp;
        System.out.println(id + "5");
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
            Logger.getLogger(SolicitarC.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(SolicitarC.class.getName()).log(Level.SEVERE, null, ex);
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
