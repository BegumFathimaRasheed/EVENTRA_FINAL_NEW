<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="classes.DbConnector"%>
<%@page import="classes.User"%>
<%@page import="classes.Parchase"%>
<%@page import="classes.Event"%>

<%
    boolean loggedIn = false;
    User user = (User) session.getAttribute("user");
    if (user != null) {
        loggedIn = user.isLoggedIn();
    }
    if (!loggedIn) {
        response.sendRedirect("log_in.jsp");
    } else {
        String event = request.getParameter("event");
        String category = request.getParameter("category");
        String venue = request.getParameter("venue");
        String date = request.getParameter("date");
        String time = request.getParameter("time");
        int guest = Integer.parseInt(request.getParameter("guest"));
        String add = request.getParameter("add");
        String own = request.getParameter("own");
        String card = request.getParameter("card");

        Connection con = DbConnector.getConnection();

        Parchase purchase = new Parchase(event, category, venue, date, time, guest, add, own, card);
        if (purchase.form(con)) {
            response.sendRedirect("parchase.jsp?status=1");
        } else {
            response.sendRedirect("parchase.jsp?status=0");
        }

        con.close();
    }
%>

