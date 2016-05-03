/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.Calculadora;
import java.util.ArrayList;
import java.util.LinkedList;

/**
 *
 * @author Foalster
 */
public class Control {

    Conexion conexionBD = new Conexion();

    public void conectar() throws Exception {
        try {
            conexionBD.conectar();
        } catch (Exception ex) {
            System.err.println("Conexión fallida: " + ex.getMessage());
        }
    }

    public void desconectar() throws Exception {
        try {
            conexionBD.desconectar();
        } catch (Exception ex) {
            System.err.println("Desconexión fallida: " + ex.getMessage());
        }
    }

    public boolean iniciarSesion(String usuario, String password) throws Exception {
        boolean b = false;
        try {
            b = conexionBD.iniciarSesion(usuario, password);
        } catch (Exception ex) {
            System.out.println("Error en la conexión: " + ex.getMessage());
        }
        return b;
    }

    public ArrayList getUsuarios() throws Exception {
        ArrayList usuarios = new ArrayList();
        try {
            usuarios = conexionBD.getUsuarios();
        } catch (Exception ex) {
            System.out.println("Error en la conexión: " + ex.getMessage());
        }
        return usuarios;
    }

    public LinkedList<Calculadora> getCalculadoras() throws Exception {
        LinkedList<Calculadora> calculadoras = new LinkedList<Calculadora>();
        try {
            calculadoras = conexionBD.getCalculadoras();
        } catch (Exception ex) {
            System.out.println("Error en la conexión: " + ex.getMessage());
        }
        return calculadoras;
    }

}
