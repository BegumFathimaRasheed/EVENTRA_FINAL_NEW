<%-- 
    Document   : admin_edelete
    Created on : Aug 13, 2023, 1:01:19 AM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="classes.DbConnector"%>
<%@page import="classes.User"%>
<%@page import="classes.Event"%>

<%
    User adminUser = (User) session.getAttribute("user");
    if (adminUser != null && adminUser.getRole().equals("admin")) {
        int eventId = Integer.parseInt(request.getParameter("id"));
        if (Event.delete(DbConnector.getConnection(), eventId)) {
            response.sendRedirect("admin_event.jsp?status=1");
        } else {
            response.sendRedirect("admin_event.jsp?status=0");
        }
    } else {
        response.sendRedirect("admin_event.jsp?error");
    }
%>
