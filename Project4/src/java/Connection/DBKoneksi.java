/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Connection;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author taufi
 */
public class DBKoneksi {
    public static Connection con;

    public static Connection open() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/hoodie_db";
            con = DriverManager.getConnection(url,"root","");
            return con;
        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }
}
