/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

/**
 *
 * @author SONY_VAIO
 */
public class Prestamo {
    private int idPrestamo;
    private String motivo;
    private String lugar;
    private int calificacionPrestamo;
    private int calificacionConsumidor;
    private int idCalculadora;
    private int idConsumidor;
    private String tiempo;

    /**
     * @return the idPrestamo
     */
    public int getIdPrestamo() {
        return idPrestamo;
    }

    /**
     * @param idPrestamo the idPrestamo to set
     */
    public void setIdPrestamo(int idPrestamo) {
        this.idPrestamo = idPrestamo;
    }

    /**
     * @return the motivo
     */
    public String getMotivo() {
        return motivo;
    }

    /**
     * @param motivo the motivo to set
     */
    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }

    /**
     * @return the lugar
     */
    public String getLugar() {
        return lugar;
    }

    /**
     * @param lugar the lugar to set
     */
    public void setLugar(String lugar) {
        this.lugar = lugar;
    }

    /**
     * @return the calificacionPrestamo
     */
    public int getCalificacionPrestamo() {
        return calificacionPrestamo;
    }

    /**
     * @param calificacionPrestamo the calificacionPrestamo to set
     */
    public void setCalificacionPrestamo(int calificacionPrestamo) {
        this.calificacionPrestamo = calificacionPrestamo;
    }

    /**
     * @return the calificacionConsumidor
     */
    public int getCalificacionConsumidor() {
        return calificacionConsumidor;
    }

    /**
     * @param calificacionConsumidor the calificacionConsumidor to set
     */
    public void setCalificacionConsumidor(int calificacionConsumidor) {
        this.calificacionConsumidor = calificacionConsumidor;
    }

    /**
     * @return the idCalculadora
     */
    public int getIdCalculadora() {
        return idCalculadora;
    }

    /**
     * @param idCalculadora the idCalculadora to set
     */
    public void setIdCalculadora(int idCalculadora) {
        this.idCalculadora = idCalculadora;
    }

    /**
     * @return the idConsumidor
     */
    public int getIdConsumidor() {
        return idConsumidor;
    }

    /**
     * @param idConsumidor the idConsumidor to set
     */
    public void setIdConsumidor(int idConsumidor) {
        this.idConsumidor = idConsumidor;
    }

    /**
     * @return the tiempo
     */
    public String getTiempo() {
        return tiempo;
    }

    /**
     * @param tiempo the tiempo to set
     */
    public void setTiempo(String tiempo) {
        this.tiempo = tiempo;
    }
    
}
