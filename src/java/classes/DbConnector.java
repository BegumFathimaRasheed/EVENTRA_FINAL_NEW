/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;
import java.sql.*;
/**
 *
 * @author DELL
 */
public class DbConnector {
    private static final String DRIVER = "com.mysql.jdbc.Driver";
    private static final String URL = "jdbc:mysql://localhost:3306/test_eventra";
    private static final String DB_USER = "testuser";
    private static final String DB_PW = "testuser";
    
    public static Connection getConnection() throws Exception{
        Class.forName(DRIVER);
        Connection con = DriverManager.getConnection(URL, DB_USER, DB_PW);
        return con;
    }
}
