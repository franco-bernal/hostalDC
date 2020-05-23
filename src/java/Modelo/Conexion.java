package Modelo;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexion {
 
    
     Connection con;
    String url = "jdbc:oracle:thin:@localhost:1521:XE";
    String user = "hostaldc";
    String pass = "1234";

    public Connection getConnection() {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            con = DriverManager.getConnection(url, user, pass);
        } catch (Exception e) {

        }
        return con;
    }
}
