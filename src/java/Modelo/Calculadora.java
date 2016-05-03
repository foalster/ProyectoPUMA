/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

/**
 *
 * @author Foalster
 */
public class Calculadora {
    
    private int idCalculadora;
    private String marca;
    private String modelo;
    private int idPrestamista;
    private boolean disponible;
    
    public int getIdCalculadora() {
        return idCalculadora;
    }

    public void setId(int idCalculadora) {
        this.idCalculadora = idCalculadora;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public boolean getDisponible() {
        return disponible;
    }

    public void setDisponible(boolean disponible) {
        this.disponible = disponible;
    }
    
    public int getIdPrestamista(){
        return idPrestamista;    
    }
    
    public void setIdPrestamista (int idPrestamista){
        this.idPrestamista = idPrestamista;
    }
}
