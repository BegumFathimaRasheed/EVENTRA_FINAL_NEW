<%-- 
    Document   : admin_event
    Created on : Aug 10, 2023, 4:30:39 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@page import="classes.DbConnector"%>
<%@page import="classes.User"%>
<%@page import="classes.Event"%>
<%@page import="classes.Parchase"%>
<%@page import="java.util.List"%>
<%
    String message = "";
    if (request.getParameter("status") != null) {
        int status = Integer.parseInt(request.getParameter("status"));
        if (status == 1) {
            message = "<p style='color:blue'>You have successfully deleted the user.</p>";
        } else {
            message = "<p style='color:red'>An error occurred. User deletion failed.</p>";
        }
    }

    User adminUser = (User) session.getAttribute("user");
    if (adminUser != null && adminUser.getRole().equals("admin")) {
        List<Event> events = Event.displayEventDetails(DbConnector.getConnection());
        request.setAttribute("events", events);

        List<Parchase> parchaseDetails = Parchase.displayParchaseDetails(DbConnector.getConnection());
        request.setAttribute("parchaseDetails", parchaseDetails);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin_event</title>
    </head>
    <body>
        <%@ include file="admin_nav.jsp" %>

        <main class="mt-5 pt-3">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <h4>Events & Blogs</h4>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 mb-3">
                        <div class="card">
                            <div class="card-header">
                                <span><i class="bi bi-table me-2"></i></span> Event Table
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <%=message%>
                                    <table
                                        id="example"
                                        class="table table-striped data-table"
                                        style="width: 100%"
                                        >
                                        <thead>
                                            <tr>
                                                <th>Customer Name</th>
                                                <th>Event</th>
                                                <th>Venue</th>
                                                <th>Date</th>
                                                <th>Time</th>
                                                <th>Guest Count</th>
                                                <th>Description</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                List<Parchase> parchaseDetailsList = (List<Parchase>) request.getAttribute("parchaseDetails");
                                                for (Parchase parchase : parchaseDetailsList) {
                                            %>
                                            <tr>
                                                <td><%= parchase.getEvent()%></td>
                                                <td><%= parchase.getCat()%></td>
                                                <td><%= parchase.getVenue()%></td>
                                                <td><%= parchase.getDate()%></td>
                                                <td><%= parchase.getTime()%></td>
                                                <td><%= parchase.getCount()%></td>
                                                <td><%= parchase.getInfo()%></td>
                                                <td>
                                                    <a href="admin_ebdelete.jsp?id=<%=parchase.getFormId()%>"><button type="button" class="btn btn-primary"><i class="bi bi-trash-fill"></i></button></a>

                                                    <a href="#"><button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal<%=parchase.getFormId()%>" data-bs-whatever="@mdo"><i class="bi bi-eye-fill"></i></button></a>
                                                    <div class="modal fade" id="exampleModal<%=parchase.getFormId()%>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                        <div class="modal-dialog">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <h5 class="modal-title" id="exampleModalLabel">Purchase Info</h5>
                                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                </div>
                                                                <div class="modal-body">
                                                                    <form>
                                                                        <div class="mb-3">
                                                                            <label for="recipient-name" class="col-form-label">Event:</label>
                                                                            <input type="text" class="form-control" id="recipient-name" value="<%=parchase.getEvent()%>">
                                                                        </div>
                                                                        <div class="mb-3">
                                                                            <label for="recipient-name" class="col-form-label">Category:</label>
                                                                            <input type="text" class="form-control" id="recipient-phone" value="<%=parchase.getCat()%>">
                                                                        </div>
                                                                        <div class="mb-3">
                                                                            <label for="recipient-name" class="col-form-label">Date:</label>
                                                                            <input type="text" class="form-control" id="recipient-email" value="<%=parchase.getDate()%>">
                                                                        </div>
                                                                        <div class="mb-3">
                                                                            <label for="recipient-name" class="col-form-label">Time:</label>
                                                                            <input type="text" class="form-control" id="recipient-time" value="<%=parchase.getTime()%>">
                                                                        </div>
                                                                        <div class="mb-3">
                                                                            <label for="recipient-name" class="col-form-label">Guest Count:</label>
                                                                            <input type="text" class="form-control" id="recipient-count" value="<%=parchase.getCount()%>">
                                                                        </div>
                                                                        <div class="mb-3">
                                                                            <label for="message-text" class="col-form-label">Description:</label>
                                                                            <textarea class="form-control" id="message-text"><%=parchase.getInfo()%></textarea>
                                                                        </div>
                                                                    </form>
                                                                </div>
                                                                <div class="modal-footer">
                                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <%
                                                    }
                                                }
                                            %>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12 mb-3">
                        <div class="card">
                            <div class="card-header">
                                <span><i class="bi bi-table me-2"></i></span> Package Details Table
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table
                                        id="example"
                                        class="table table-striped data-table"
                                        style="width: 100%"
                                        >
                                        <thead>
                                            <tr>
                                                <th>Event</th>
                                                <th>Category</th>
                                                <th>Price</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                List<Event> eventsList = (List<Event>) request.getAttribute("events");
                                                if (eventsList

                                                != null && !eventsList.isEmpty () 
                                                    ) {
                                                    for (Event event : eventsList) {
                                            %>
                                            <tr>
                                                <td><%=event.getEventName()%></td>
                                                <td><%=event.getEventCat()%></td>
                                                <td><%=event.getEventBill()%></td>
                                                <td>
                                                    <a href="admin_edelete.jsp?id=<%=event.getEventId()%>"><button type="button" class="btn btn-primary"><i class="bi bi-trash-fill"></i></button></a>

                                                    <a href="#"><button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#vieweModal<%=event.getEventId()%>" data-bs-whatever="@mdo"><i class="bi bi-eye-fill"></i></button></a>
                                                    <div class="modal fade" id="vieweModal<%=event.getEventId()%>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                        <div class="modal-dialog">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <h5 class="modal-title" id="exampleModalLabel">Package Info</h5>
                                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                </div>
                                                                <div class="modal-body">
                                                                    <form>
                                                                        <div class="mb-3">
                                                                            <label for="recipient-name" class="col-form-label">Event:</label>
                                                                            <input type="text" class="form-control" id="recipient-name" value="<%=event.getEventName()%>">
                                                                        </div>
                                                                        <div class="mb-3">
                                                                            <label for="recipient-name" class="col-form-label">Category:</label>
                                                                            <input type="text" class="form-control" id="recipient-name" value="<%=event.getEventCat()%>">
                                                                        </div>
                                                                        <div class="mb-3">
                                                                            <label for="recipient-name" class="col-form-label">Price:</label>
                                                                            <input type="text" class="form-control" id="recipient-name" value="<%=event.getEventBill()%>">
                                                                        </div>
                                                                    </form>
                                                                </div>
                                                                <div class="modal-footer">
                                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <%
                                                    }
                                                }
                                            %>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </body>
</html>
