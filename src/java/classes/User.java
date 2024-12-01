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
public class User {

    private int id;
    private String firstName;
    private String lastName;
    private String address;
    private String phone_no;
    private String username;
    private String password;
    private String cpassword;
    private String role;
    private boolean loggedIn = false;

    public User(String username, String password) {
        this.username = username;
        this.password = password;
    }

    public User(String firstName, String lastName, String address, String phone_no, String username, String password, String cpassword, String role) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.address = address;
        this.phone_no = phone_no;
        this.username = username;
        this.password = password;
        this.cpassword = cpassword;
        this.role = role;
    }

    public User(String firstName, String lastName, String address, String phone_no, String username, String password, String role) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.address = address;
        this.phone_no = phone_no;
        this.username = username;
        this.password = password;
        this.role = role;
    }

    public User(String firstName, String lastName, String address, String phone_no, String username) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.address = address;
        this.phone_no = phone_no;
        this.username = username;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhoneNo() {
        return phone_no;
    }

    public void setPhoneNo(String phone_no) {
        this.phone_no = phone_no;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public String getCpassword() {
        return cpassword;
    }

    public String getRole() {
        return role;
    }

    public boolean register(Connection con) throws SQLException {
        String hashpwd = MD5.getMd5(password);
        String query = "INSERT INTO user(firstName, lastName, address, phone_no, username, password, role) VALUES(?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement pstmt = con.prepareStatement(query);
        pstmt.setString(1, firstName);
        pstmt.setString(2, lastName);
        pstmt.setString(3, address);
        pstmt.setString(4, phone_no);
        pstmt.setString(5, username);
        pstmt.setString(6, hashpwd);
        pstmt.setString(7, role);
        int a = pstmt.executeUpdate();
        return (a > 0);
    }

    public boolean authenticate(Connection con) throws SQLException {
        String query = "SELECT * FROM user WHERE username = ?";
        PreparedStatement pstmt = con.prepareStatement(query);
        pstmt.setString(1, username);
        ResultSet rs = pstmt.executeQuery();
        if (rs.next()) {
            String db_pw = rs.getString("password");
            String hashedInputPassword = MD5.getMd5(password);

            if (hashedInputPassword.equals(db_pw)) {
                id = Integer.parseInt(rs.getString("id"));
                firstName = rs.getString("firstName");
                lastName = rs.getString("lastName");
                role = rs.getString("role");
                loggedIn = true;
                return true;
            } else {
                return false;
            }
        } else {
            return false;
        }
    }

    public static List<User> displayUserDetails(Connection con) throws SQLException {
        List<User> user_list = new ArrayList<>();
        String query = "SELECT * FROM user";
        PreparedStatement pstmt = con.prepareStatement(query);
        ResultSet rs = pstmt.executeQuery();
        while (rs.next()) {
            int id = rs.getInt("id");
            String firstName = rs.getString("firstName");
            String lastName = rs.getString("lastName");
            String address = rs.getString("address");
            String phone_no = rs.getString("phone_no");
            String username = rs.getString("username");
            String password = rs.getString("password");
            String role = rs.getString("role");

            User user = new User(firstName, lastName, address, phone_no, username, password, role);
            user.setId(id);
            user_list.add(user);
        }
        return user_list;
    }

    public boolean update(Connection con) throws SQLException {
        String query = "UPDATE user SET firstName = ?, lastName = ?, address = ?, phone_no = ?, username = ? WHERE id = ?";
        PreparedStatement pstmt = con.prepareStatement(query);
        pstmt.setString(1, firstName);
        pstmt.setString(2, lastName);
        pstmt.setString(3, address);
        pstmt.setString(4, phone_no);
        pstmt.setString(5, username);
        pstmt.setInt(6, id);
        int a = pstmt.executeUpdate();
        return (a > 0);
    }

    public boolean delete(Connection con, int id) throws SQLException {
        String query = "DELETE FROM user WHERE id = ?";
        PreparedStatement pstmt = con.prepareStatement(query);
        pstmt.setInt(1, id);
        int a = pstmt.executeUpdate();
        return (a > 0);
    }

//    private String hashPassword(String password){
//        return MD5.getMd5(password);
//    }
    public boolean emptyInput() {
        return isEmpty(firstName) || isEmpty(lastName) || isEmpty(address)
                || isEmpty(phone_no) || isEmpty(username) || isEmpty(password) || isEmpty(cpassword);
    }

    public boolean pwdMatch() {
        return password.equals(cpassword);
    }

    private boolean isEmpty(String str) {
        return str == null || str.trim().isEmpty();
    }

    public boolean isLoggedIn() {
        return loggedIn;
    }

    void sendRedirect(String registrationnewjspstatus1) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public static String getFullNameFromUser(Connection con, int id) throws SQLException {
        String fullName = "";
        String query = "SELECT firstName, lastName FROM user WHERE id = ?";
        PreparedStatement pstmt = con.prepareStatement(query);
        pstmt.setInt(1, id);
        ResultSet rs = pstmt.executeQuery();

        if (rs.next()) {
            String firstName = rs.getString("firstName");
            String lastName = rs.getString("lastName");
            fullName = firstName + " " + lastName;
        }

        return fullName;
    }

    public static User getUserById(Connection con, int id) throws SQLException {
        User useri = null;
        String query = "SELECT * FROM user WHERE id = ?";
        try (PreparedStatement pstmt = con.prepareStatement(query)) {
            pstmt.setInt(1, id);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    useri = new User(rs.getString("firstName"), rs.getString("lastName"));
                    useri.setId(rs.getInt("event_id"));
                    useri.setFirstName(rs.getString("firstName"));
                    useri.setLastName(rs.getString("lastName"));
                }
            }
        }
        return useri;
    }

    public static User getUsersId(Connection con, int id) throws SQLException {
        User useri = getUserById(con, id);
        return useri;
    }

}
