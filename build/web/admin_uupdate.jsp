<%-- 
    Document   : admin_uupdate
    Created on : Aug 11, 2023, 7:41:57 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="classes.DbConnector"%>
<%@page import="classes.User"%>

<%
    User adminUser = (User) session.getAttribute("user");
    if (adminUser != null && adminUser.getRole().equals("admin")) {
        int userId = Integer.parseInt(request.getParameter("id"));
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String address = request.getParameter("address");
        String phone_no = request.getParameter("phone_no");
        String username = request.getParameter("username");
        
        User userToUpdate = new User(firstName, lastName, address, phone_no, username);
        userToUpdate.setId(userId);
        userToUpdate.setFirstName(firstName);
        userToUpdate.setPhoneNo(phone_no);
        userToUpdate.setUsername(username);
        userToUpdate.setAddress(address);
        
        if (userToUpdate.update(DbConnector.getConnection())) {
            response.sendRedirect("admin_user.jsp?status=dbconnected_suc");
        } else {
            response.sendRedirect("admin_user.jsp?status=dberror");
        }
    } else {
        response.sendRedirect("admin_user.jsp?error");
    }
%>
