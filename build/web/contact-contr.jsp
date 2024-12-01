<%-- 
    Document   : contact-contr
    Created on : Aug 7, 2023, 1:54:15 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="classes.DbConnector"%>
<%@page import="classes.User"%>
<%@page import="classes.Contact"%>

<%
    boolean loggedIn = false;
    User user = (User) session.getAttribute("user");
    if (user != null) {
        loggedIn = user.isLoggedIn();
    }
    if (!loggedIn) {
        response.sendRedirect("log_in.jsp");
    } else {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String message = request.getParameter("message");

        if (username != null && !username.trim().isEmpty()) {
            Contact contact = new Contact(username, email, phone, message);
            if (contact.contact(DbConnector.getConnection())) {
                response.sendRedirect("contact.jsp?status=1");
            } else {
                response.sendRedirect("contact.jsp?status=0");
            }
        } else {
            response.sendRedirect("contact.jsp?status=0&error=username");
        }
    }
%>
