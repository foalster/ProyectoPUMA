package Modelo;

/**
 *
 * @author Foalster
 */
public class Usuario {
    
    private int idusuario;
    private String usuario;
    private String password;
    private String nombre;
    private String appat;
    private String apmat;
    private String fechanac;
    private String genero;
    private String email;
     
    
    public int getIdUsuario() {
        return idusuario;
    }

    public void setIdUsuario(int idusuario) {
        this.idusuario = idusuario;
    }
    
    public String getUsuario(){
        return usuario;
    }
    
    public void setUsuario(String usuario){
        this.usuario = usuario;
    }
    
    public String getPassword(){
        return password;
    }
    
    public void setPassword(String password){
        this.password = password;
    }
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApPat() {
        return appat;
    }

    public void setApPat(String appat) {
        this.appat = appat;
    }
    
    public String getApMat() {
        return apmat;
    }

    public void setApMat(String apmat) {
        this.apmat = apmat;
    }

    public String getFechaNac() {
        return fechanac;
    }

    public void setFechaNac(String fechanac) {
        this.fechanac = fechanac;
    }        
    
    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }
    
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void getUsuario(String usuario) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
