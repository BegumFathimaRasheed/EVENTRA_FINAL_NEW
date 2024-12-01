<%-- 
    Document   : admin_ebdelete
    Created on : Aug 13, 2023, 1:55:56 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="classes.DbConnector"%>
<%@page import="classes.User"%>
<%@page import="classes.Event"%>
<%@page import="classes.Parchase"%>

<%
    User adminUser = (User) session.getAttribute("user");
    if (adminUser != null && adminUser.getRole().equals("admin")) {
        int parchaseId = Integer.parseInt(request.getParameter("id"));
        if (Parchase.delete(DbConnector.getConnection(), parchaseId)) {
            response.sendRedirect("admin_event.jsp?status=1");
        } else {
            response.sendRedirect("admin_event.jsp?status=0");
        }
    } else {
        response.sendRedirect("admin_event.jsp?error");
    }
%>
