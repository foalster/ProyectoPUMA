package Controlador;

import Modelo.Calculadora;
import Modelo.Prestamo;
import java.sql.PreparedStatement;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import Modelo.Usuario;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.LinkedList;
import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Conexion {

    private Connection con;
    private Statement stmt;
    private ResultSet rs;
    private String url = "jdbc:postgresql://localhost:5432/PUMA";
    private String user = "IS1";
    private String pass = "hola123";
    private String drive = "org.postgresql.Driver";
    private static final String PATTERN_EMAIL = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
            + "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
    //private PreparedStatement pst;
    //private Control ctrl;

    public Conexion() {
        try {
            Class.forName(drive);
            con = DriverManager.getConnection(url, user, pass);
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println("Exception: " + ex.getMessage());
        }
    }

    public Connection getConexion() {
        return con;
    }

    public void conectar() throws Exception {
        try {
            Class.forName(drive);
            con = DriverManager.getConnection(url, user, pass);
        } catch (Exception ex) {
            System.out.println("Exception: " + ex.getMessage());
        }
    }

    public void desconectar() throws Exception {
        try {
            con.close();
        } catch (Exception ex) {
            System.out.println("Exception: " + ex.getMessage());
        }
    }

    public static boolean validarEmail(String email) {

        // Compiles the given regular expression into a pattern.
        Pattern pattern = Pattern.compile(PATTERN_EMAIL);

        // Match the given input against this pattern
        Matcher matcher = pattern.matcher(email);
        return matcher.matches();

    }

    public static boolean isFechaValida(String fecha) {
        try {
            SimpleDateFormat formatoFecha = new SimpleDateFormat("dd/MM/yyyy", Locale.getDefault());
            formatoFecha.setLenient(false);
            formatoFecha.parse(fecha);
        } catch (ParseException e) {
            return false;
        }
        return true;
    }

    public static boolean checkAlpha(String str) {
        boolean respuesta = false;
        if ((str).matches("\\w+\\.?")) {
            respuesta = true;
        }
        return respuesta;
    }

    public boolean iniciarSesion(String usuario, String password) throws Exception {
        try {
            ArrayList usuarios = new ArrayList();
            PreparedStatement pst = con.prepareStatement("SELECT * FROM USUARIO WHERE USUARIO = '" + usuario + "' AND PASSWORD = '" + password + "'");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Usuario u = new Usuario();
                u.setUsuario(rs.getString(2));
                u.setPassword(rs.getString(3));
                usuarios.add(u);
            }
            if (!usuarios.isEmpty()) {
                return true;
            }
        } catch (Exception ex) {
            System.out.println("Exception: " + ex.getMessage());
        }
        return false;
    }

    public ArrayList getUsuarios() throws Exception {
        ArrayList usuarios = new ArrayList();
        try {
            stmt = con.createStatement();
            rs = stmt.executeQuery("SELECT * FROM USUARIO");
            while (rs.next()) {
                Usuario u = new Usuario();
                u.setIdUsuario(rs.getInt(1));
                u.setUsuario(rs.getString(2));
                u.setPassword(rs.getString(3));
                u.setNombre(rs.getString(4));
                u.setApPat(rs.getString(5));
                u.setApMat(rs.getString(6));
                u.setFechaNac(rs.getString(7));
                u.setGenero(rs.getString(8));
                u.setEmail(rs.getString(9));
                usuarios.add(u);
            }
        } catch (Exception ex) {
            System.out.println("Error al recuperar los datos de la entidad usuario "
                    + ex.getMessage());
        }
        return usuarios;
    }

    public ArrayList getId(String usuario) throws Exception {
        ArrayList idUsuario = new ArrayList();
        try {
            stmt = con.createStatement();
            rs = stmt.executeQuery("SELECT IDUSUARIO FROM USUARIO WHERE USUARIO = '" + usuario + "'");
            while (rs.next()) {
                Usuario u = new Usuario();
                u.setIdUsuario(rs.getInt(1));
                idUsuario.add(u);
            }
        } catch (Exception ex) {
            System.out.println("Error al recuperar los datos de la entidad usuario "
                    + ex.getMessage());
        }
        return idUsuario;
    }

    public LinkedList<Calculadora> getCalculadoras() {
        LinkedList<Calculadora> listaContactos = new LinkedList<Calculadora>();
        try {
            stmt = con.createStatement();
            rs = stmt.executeQuery("SELECT * FROM CALCULADORA");
            while (rs.next()) {
                Calculadora contacto = new Calculadora();
                contacto.setId(rs.getInt("idcalculadora"));
                contacto.setMarca(rs.getString("marca"));
                contacto.setModelo(rs.getString("modelo"));
                contacto.setDisponible(rs.getBoolean("disponible"));
                contacto.setIdTipo(rs.getInt("idTipo"));
                contacto.setIdPrestamista(rs.getInt("idPrestamista"));
                listaContactos.add(contacto);
            }
            rs.close();
            stmt.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listaContactos;
    }

    public LinkedList<Prestamo> getPrestamos() {
        LinkedList<Prestamo> listadeprestamos = new LinkedList<>();
        try {
            stmt = con.createStatement();
            rs = stmt.executeQuery("SELECT * FROM PRESTAMO");
            while (rs.next()) {
                Prestamo contacto = new Prestamo();
                contacto.setIdPrestamo(rs.getInt("idPrestamo"));
                contacto.setMotivo(rs.getString("motivo"));
                contacto.setLugar(rs.getString("lugarentrega"));
                contacto.setCalificacionPrestamo(rs.getInt("calificarprestamo"));
                contacto.setCalificacionConsumidor(rs.getInt("calificarconsumidor"));
                contacto.setIdCalculadora(rs.getInt("idcalculadora"));
                contacto.setIdConsumidor(rs.getInt("idconsumidor"));
                contacto.setTiempo(rs.getString("tiempo_prestamo"));
                listadeprestamos.add(contacto);
                System.out.println();
            }
            rs.close();
            stmt.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listadeprestamos;
    }

    public boolean checarUsuario(String usuario, String email) throws Exception {
        try {
            ArrayList usuarios = new ArrayList();
            PreparedStatement pst = con.prepareStatement("SELECT USUARIO, EMAIL FROM USUARIO WHERE USUARIO = '" + usuario + "' OR EMAIL = '" + email + "'");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Usuario u = new Usuario();
                u.setUsuario(rs.getString(1));
                u.setEmail(rs.getString(2));
                usuarios.add(u);
            }
            if (usuarios.isEmpty()) {
                return false;
            }
        } catch (Exception ex) {
            System.out.println("Exception: " + ex.getMessage());
        }
        return true;
    }

    public boolean registrar(String usuario, String password, String nombre, String appat, String apmat, String fechanac, String genero, String email) throws Exception {
        try {
            ArrayList usuarios = new ArrayList();
            PreparedStatement pst = con.prepareStatement("INSERT INTO USUARIO (USUARIO, PASSWORD, NOMBRE, APPAT, APMAT, FECHANAC, GENERO, EMAIL) VALUES ('" + usuario
                    + "', '" + password + "', '" + nombre + "', '" + appat + "', '" + apmat + "', '" + fechanac + "', '" + genero + "', '" + email + "')");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Usuario u = new Usuario();
                u.setUsuario(rs.getString(1));
                u.setPassword(rs.getString(2));
                u.setNombre(rs.getString(3));
                u.setApPat(rs.getString(4));
                u.setApMat(rs.getString(5));
                u.setFechaNac(rs.getString(6));
                u.setGenero(rs.getString(7));
                u.setEmail(rs.getString(8));
                usuarios.add(u);
            }
            if (usuarios.isEmpty()) {
                return false;
            }
        } catch (Exception ex) {
            System.out.println("Exception: " + ex.getMessage());
        }
        return true;
    }

    public boolean crear(String marca, String modelo, int idUsuario, int tipo) {
        try {
            ArrayList calculadora = new ArrayList();
            PreparedStatement pst = con.prepareStatement("INSERT INTO calculadora (marca, modelo, disponible, idprestamista, idtipo) VALUES('" + marca + "','" + modelo + "',TRUE," + idUsuario + "," + tipo + ");");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Calculadora u = new Calculadora();
                u.setMarca(rs.getString(1));
                u.setModelo(rs.getString(2));
                u.setDisponible(rs.getBoolean(3));
                u.setIdPrestamista(rs.getInt(4));
                u.setIdTipo(rs.getInt(5));
                calculadora.add(u);
            }
            if (calculadora.isEmpty()) {
                return false;
            }
        } catch (Exception ex) {
            System.out.println("Error: " + ex.getMessage());
        }
        return true;
    }

    public LinkedList<Calculadora> getCalculadoras(int idprestamista) throws SQLException {
        LinkedList<Calculadora> calculadoras = new LinkedList<Calculadora>();
        try {
            stmt = con.createStatement();
            rs = stmt.executeQuery("SELECT * FROM CALCULADORA NATURAL JOIN TIPO WHERE IDPRESTAMISTA = " + idprestamista);
            while (rs.next()) {
                Calculadora contacto = new Calculadora();
                contacto.setId(rs.getInt("idcalculadora"));
                contacto.setMarca(rs.getString("marca"));
                contacto.setModelo(rs.getString("modelo"));
                contacto.setDisponible(rs.getBoolean("disponible"));
                calculadoras.add(contacto);
            }
            rs.close();
            stmt.close();
        } catch (Exception ex) {
            System.out.println("Error al recuperar los datos de la entidad calculadoras "
                    + ex.getMessage());
        }
        return calculadoras;
    }

    public boolean eliminaCalculadora(int idcalculadora) throws SQLException {
        boolean b = false;
        try {
            String seleccio = "DELETE FROM calculadora WHERE idcalculadora=" + idcalculadora;
            PreparedStatement ps = con.prepareStatement(seleccio);
            ps.executeUpdate();
            b = true;
        } catch (Exception ex) {
            System.out.println("Error al elminar calculadora: " + ex.getMessage());
        }
        return b;
    }

    public boolean editCalculadora(int id, String marca, String modelo) {
        boolean b = false;
        try {
            String sql = "Update calculadora SET marca = '" + marca + "', modelo = '" + modelo + "' where idcalculadora =" + id;
            PreparedStatement ps = con.prepareStatement(sql);
            ps.executeUpdate();
            b = true;
        } catch (Exception ex) {
            System.out.println("Error al recuperar los datos de la entidad calculadora "
                    + ex.getMessage());
        }
        return b;
    }

    public ArrayList getUsuarioId(String idUsuario) throws SQLException {
        ArrayList usuarios = new ArrayList();
        try {
            PreparedStatement ps = con.prepareStatement("SELECT idUsuario From Usuario Where idUsuario = " + idUsuario);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                usuarios.add(rs.getString("idUsuario"));
            }
            rs.close();
        } catch (Exception ex) {
            System.out.println("Error al recuperar los datos del Usuario "
                    + ex.getMessage());
        }
        return usuarios;
    }

    public boolean eliminaUsuario(int idUsuario) throws SQLException {
        boolean b = false;
        try {
            String seleccio = "DELETE FROM Usuario WHERE idUsuario=" + idUsuario;
            PreparedStatement ps = con.prepareStatement(seleccio);
            ps.executeUpdate();
            b = true;
        } catch (Exception ex) {
            System.out.println("Error al eliminar Usuario: " + ex.getMessage());
        }
        return b;
    }

    public boolean editUsuario(int idUsuario, String password, String fechanac, String email) {
        boolean b = false;
        try {
            String sql = "Update Usuario SET password = '" + password + "', fechanac = '" + fechanac + "', email = '" + email + "' where idUsuario =" + idUsuario;
            PreparedStatement ps = con.prepareStatement(sql);
            ps.executeUpdate();
            b = true;
        } catch (Exception ex) {
            System.out.println("Error al recuperar los datos de la entidad Usuario "
                    + ex.getMessage());
        }
        return b;
    }

    public boolean ocupado(int idcalculadora) throws Exception {
        try {
            ArrayList usuarios = new ArrayList();
            PreparedStatement pst = con.prepareStatement("UPDATE CALCUALDORA SET VALUES(DISPONIBLE = FALSE) WHERE IDCALCULADORA = " + idcalculadora);
            ResultSet rs = pst.executeQuery();
            return true;
        } catch (Exception ex) {
            System.out.println("Exception: " + ex.getMessage());
        }
        return false;
    }

    public boolean ocuparCalculadora(int id) {
        boolean b = false;
        try {
            System.out.println("id a cambiar" + id);
            String sql = "Update calculadora SET disponible = '" + false + "' where idcalculadora =" + id;
            System.out.println("modifico");
            PreparedStatement ps = con.prepareStatement(sql);
            ps.executeUpdate();
            b = true;
        } catch (Exception ex) {
            System.out.println("Error al recuperar los datos de la entidad calculadora, id malo"
                    + ex.getMessage());
        }
        return b;
    }

    public boolean registrarPrestamo(int idPrestamo, String motivo, String lugar, int califPrestamo, int califConsumidor, int idCalculadora, int idConsumidor, String tiempo) {
        try {
            PreparedStatement pst = con.prepareStatement("INSERT INTO prestamo (idprestamo, motivo, lugarentrega, calificarprestamo, calificarconsumidor, idcalculadora, idconsumidor,tiempo_prestamo) VALUES('" + idPrestamo + "','" + motivo + "','" + lugar + "'," + califPrestamo + "," + califConsumidor + "," + idCalculadora + "," + idConsumidor + ",'" + tiempo + "');");
            //ResultSet rs = pst.executeQuery();
            pst.executeUpdate();
            return true;
        } catch (Exception ex) {
            System.out.println("Error valores de prestamo mal" + ex.getMessage());
        }
        return false;
    }

    public void aceptarPrestamo(int idPrestamo) {
        try {
            PreparedStatement pst = con.prepareStatement("DELETE FROM prestamo WHERE idprestamo=" + idPrestamo);
            pst.executeUpdate();
        } catch (Exception ex) {
            System.out.println("error al aceptar" + ex.getMessage());
        }
    }

    public void rechazarPrestamo(int idCalculadora, int idPrestamo) {
        try {
            PreparedStatement pst = con.prepareStatement("UPDATE CALCULADORA SET disponible = '" + true + "'WHERE IDCALCULADORA = " + idCalculadora);
            pst.executeUpdate();
            System.out.println("actualizado valor = " + idCalculadora);
            pst = con.prepareStatement("DELETE FROM prestamo WHERE idprestamo=" + idPrestamo);
            pst.executeUpdate();
            System.out.println("borrar tabla");
        } catch (Exception ex) {
            System.out.println("ERROR al actualizar" + ex.getMessage());
        }
    }

    public void rePonerPrestamo(int idCalculadora) {
        try {
            PreparedStatement pst = con.prepareStatement("UPDATE CALCULADORA SET disponible = '" + true + "'WHERE IDCALCULADORA = " + idCalculadora);
            pst.executeUpdate();
        } catch (Exception ex) {
            System.out.println("ERROR al reponer" + ex.getMessage());
        }
    }

    public static void main(String[] args) {
        Conexion co = new Conexion();
        System.out.println(co.getConexion());
    }

}
