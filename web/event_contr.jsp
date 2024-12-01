<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="classes.DbConnector"%>
<%@page import="classes.Event"%>

<%
     Connection con = null;
    try {
        con = DbConnector.getConnection();
        String event = request.getParameter("event");
        String category = request.getParameter("category");
        int eventId = Event.getEventIdByName(con, event, category);

        if (eventId != -1) {
            session.setAttribute("eventId", eventId);
            // Redirect to the purchase.jsp page with the correct parameters
            response.sendRedirect("purchase.jsp?event=" + event + "&category=" + category + "&eventId=" + eventId);
        } else {
            // Handle case when event ID is not found
            out.println("Event ID not found.");
        }
    } catch (SQLException e) {
        // Handle database connection or query error
        out.println("An error occurred: " + e.getMessage());
    } finally {
        if (con != null) {
            try {
                con.close();
            } catch (SQLException e) {
                // Handle closing connection error
                out.println("Error closing connection: " + e.getMessage());
            }
        }
    }
%>



