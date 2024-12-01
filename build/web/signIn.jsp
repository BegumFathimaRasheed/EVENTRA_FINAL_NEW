<%-- 
    Document   : signIn
    Created on : Aug 2, 2023, 9:07:38 PM
    Author     : DELL
--%>

<%@page import="classes.User"%>
<%@page import="classes.MD5"%>
<%@page import="classes.DbConnector"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String firstName = request.getParameter("firstName");
    String lastName = request.getParameter("lastName");
    String address = request.getParameter("address");
    String phone_no = request.getParameter("phone_no");
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String cpassword = request.getParameter("cpassword");
    String role = "customer";

    User user = new User(firstName, lastName, address, phone_no, username, password, cpassword, role);

    if (user.emptyInput() || !user.pwdMatch()) {
        response.sendRedirect("registration-new.jsp?error=emptyfields");
    } else {
        if (user.register(DbConnector.getConnection())) {
            response.sendRedirect("log_in.jsp?status=1");
        } else {
            response.sendRedirect("registration-new.jsp?status=0");
        }
    }

%>
