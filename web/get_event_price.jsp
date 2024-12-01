<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="classes.DbConnector"%>
<%@page import="classes.Event"%>

<%
    String eventIdParam = request.getParameter("eventId");
    if (eventIdParam != null) {
        int eventId = Integer.parseInt(eventIdParam);

        Connection con = null;
        try {
            con = DbConnector.getConnection();
            String eventPrice = Event.getEventPrice(con, eventId);

            // Return the event price as the response
            response.setContentType("text/plain");
            response.getWriter().write(eventPrice);
        } catch (SQLException e) {
            // Handle database connection or query error
            response.setContentType("text/plain");
            response.getWriter().write("An error occurred: " + e.getMessage());
        } catch (NumberFormatException e) {
            // Handle invalid eventId parameter
            response.setContentType("text/plain");
            response.getWriter().write("Invalid eventId parameter.");
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException e) {
                    // Handle closing connection error
                    response.setContentType("text/plain");
                    response.getWriter().write("Error closing connection: " + e.getMessage());
                }
            }
        }
    } else {
        // Handle case when event ID parameter is not provided
        response.setContentType("text/plain");
        response.getWriter().write("Event ID parameter not provided.");
    }
%>



