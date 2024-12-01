<%-- 
    Document   : signout
    Created on : Aug 7, 2023, 12:07:20 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    session.invalidate();
    response.sendRedirect("index.jsp");
%>
