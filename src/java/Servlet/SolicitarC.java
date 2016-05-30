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
import Modelo.Usuario;
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
import javax.servlet.http.HttpSession;

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
        Control consulta = new Control();
        String tiempo = request.getParameter("tiempo");
        String lugar = request.getParameter("lugar");
        String motivo = request.getParameter("motivo");
        String id = request.getParameter("idCalculadora");
        String modelo = "";

        System.out.println("aqui");
        if (tiempo.length() != 0 && lugar.length() != 0 && motivo.length() != 0 && idCalculadora != 0) {
            //String email = co.correo();
            int idC = Integer.parseInt(id);
            int idP;

            String email = "";
            LinkedList<Calculadora> lista = consulta.getCalculadoras();
            ArrayList<Usuario> usuarios = consulta.getUsuarios();
            a:
            for (int i = 0; i < lista.size(); i++) {
                if (lista.get(i).getIdCalculadora() == idC) {
                    idP = lista.get(i).getIdPrestamista();
                    modelo = lista.get(i).getModelo();

                    for (int j = 0; j < usuarios.size(); j++) {
                        //  System.out.println("id Pres" + usuarios.get(j).getIdUsuario());
                        if (usuarios.get(j).getIdUsuario() == idP) {
                            HttpSession session = request.getSession();
                            int idA = (Integer) session.getAttribute("id");
                            if (usuarios.get(idP - 1).getIdUsuario() != idA) {
                                if (co.ocuparCalculadora(idC) && co.registrarPrestamo(-1, motivo, lugar, 0, 0, idC, idA, tiempo)) {

                                    email = usuarios.get(idP - 1).getEmail();
                                } else {
                                    response.sendRedirect("Inicio.jsp");
                                }
                            } else {
                                response.sendRedirect("Inicio.jsp");
                            }
                        }

                        break a;
                    }
                }
            }

            System.out.println("email: " + email);
            Email nuevo = new Email();
            nuevo.enviarCorreo("Foalster.PUMA@hotmail.com", "serchselacome14milgemas", email, "Se ha solicitado el objeto " + modelo + " \n con motivo " + motivo + " a entregarse en " + lugar + " por " + tiempo, "Solicitud Pendiente PUMA");
            response.sendRedirect("Inicio.jsp");
        } else {
            response.sendRedirect("Inicio.jsp");
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
