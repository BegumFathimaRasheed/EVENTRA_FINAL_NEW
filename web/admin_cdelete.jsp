<%-- 
    Document   : admin_cdelete
    Created on : Aug 11, 2023, 12:30:57 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="classes.DbConnector"%>
<%@page import="classes.User"%>
<%@page import="classes.Contact"%>

<%
    User adminUser = (User) session.getAttribute("user");
    if (adminUser != null && adminUser.getRole().equals("admin")) {
        int contactId = Integer.parseInt(request.getParameter("id"));
        if (Contact.delete(DbConnector.getConnection(), contactId)) {
            response.sendRedirect("admin_contact.jsp?status=1");
        } else {
            response.sendRedirect("admin_contact.jsp?status=0");
        }
    } else {
        response.sendRedirect("admin_contact.jsp?error");
    }
%>
