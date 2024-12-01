<%-- 
    Document   : signUp
    Created on : Aug 2, 2023, 10:56:49 PM
    Author     : DELL
--%>

<%@page import="classes.DbConnector"%>
<%@page import="classes.User"%>
<%@page import="classes.MD5"%>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    
    User user = new User(username, password);
    if(user.authenticate(DbConnector.getConnection())){
        session.setAttribute("user", user);
        response.sendRedirect("index.jsp");
    }
    else{
        response.sendRedirect("log_in.jsp?status=0");
    }
%>
