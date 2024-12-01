<%-- 
    Document   : admin_udelete
    Created on : Aug 10, 2023, 10:01:18 PM
    Author     : DELL
--%>

<%@page import="classes.DbConnector"%>
<%@page import="classes.User"%>

<%
    User adminUser = (User) session.getAttribute("user");
    if (adminUser != null && adminUser.getRole().equals("admin")) {
        int userId = Integer.parseInt(request.getParameter("id"));
        if (adminUser.delete(DbConnector.getConnection(), userId)) {
            response.sendRedirect("admin_user.jsp?status=1");
        } else {
            response.sendRedirect("admin_user.jsp?status=0");
        }
    } else {
        response.sendRedirect("admin_user.jsp");
    }
%>