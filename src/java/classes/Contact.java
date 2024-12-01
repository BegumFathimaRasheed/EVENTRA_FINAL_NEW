/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author DELL
 */
public class Contact {

    private int id;
    private String username;
    private String email;
    private String phone;
    private String message;
    
    public Contact(String username, String email, String phone, String message) {
        this.username = username;
        this.email = email;
        this.phone = phone;
        this.message = message;
    }
    
    public void setId(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }
    
    public String getUsername() {
        return username;
    }

    public String getEmail() {
        return email;
    }

    public String getPhone() {
        return phone;
    }

    public String getMessage() {
        return message;
    }
    
    public boolean contact(Connection con) throws SQLException {
        String query = "INSERT INTO contact(username, email, phone, message) VALUES(?, ?, ?, ?)";
        PreparedStatement pstmt = con.prepareStatement(query);
        pstmt.setString(1, username);
        pstmt.setString(2, email);
        pstmt.setString(3, phone);
        pstmt.setString(4, message);
        int a = pstmt.executeUpdate();
        return (a > 0);
    }
    
    public static List<Contact> displayContactDetails(Connection con) throws SQLException{
        List<Contact> contact_list = new ArrayList<>();
        String query = "SELECT * FROM contact";
        PreparedStatement pstmt = con.prepareStatement(query);
        ResultSet rs = pstmt.executeQuery();
        while(rs.next()){
            int id = rs.getInt("contact_id");
            String username = rs.getString("username");
            String email = rs.getString("email");
            String phone = rs.getString("phone");
            String message = rs.getString("message");
            
            Contact contact = new Contact(username, email, phone, message);
            contact.setId(id);
            contact_list.add(contact);
        }
        return contact_list;
    }
    
    public static boolean delete(Connection con, int id) throws SQLException{
        String query = "DELETE FROM contact WHERE contact_id = ?";
        PreparedStatement pstmt = con.prepareStatement(query);
        pstmt.setInt(1, id);
        int a = pstmt.executeUpdate();
        return (a>0);
    }
}
