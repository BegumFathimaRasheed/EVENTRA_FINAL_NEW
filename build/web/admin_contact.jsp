<%-- 
    Document   : admin_contact
    Created on : Aug 10, 2023, 5:06:46 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@page import="classes.DbConnector"%>
<%@page import="classes.User"%>
<%@page import="classes.Contact"%>
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
        List<Contact> contacts = Contact.displayContactDetails(DbConnector.getConnection());
        request.setAttribute("contacts", contacts);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@ include file="admin_nav.jsp" %>

        <main class="mt-5 pt-3">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <h4>Contact Forms</h4>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 mb-3">
                        <div class="card">
                            <div class="card-header">
                                <span><i class="bi bi-table me-2"></i></span> Contact details
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
                                                <th>Username</th>
                                                <th>Email</th>
                                                <th>Phone</th>
                                                <th>Message</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                if (request.getAttribute("contacts") != null) {
                                                    List<Contact> conta = (List<Contact>) request.getAttribute("contacts");
                                                    for (Contact cont : conta) {
                                            %>
                                            <tr>
                                                <td><%=cont.getUsername()%></td>
                                                <td><%=cont.getEmail()%></td>
                                                <td><%=cont.getPhone()%></td>
                                                <td><%=cont.getMessage()%></td>
                                                <td>
                                                    <a href="admin_cdelete.jsp?id=<%=cont.getId()%>"><button type="button" class="btn btn-primary"><i class="bi bi-trash-fill"></i></button></a>
                                                    <a href="#"><button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal<%=cont.getId()%>" data-bs-whatever="@mdo"><i class="bi bi-eye-fill"></i></button></a>
                                                    <!--                                                    <a href="#"><i class="bi bi-eye-fill"></i></a>   -->
                                                    <div class="modal fade" id="exampleModal<%=cont.getId()%>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                        <div class="modal-dialog">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <h5 class="modal-title" id="exampleModalLabel">Contact Info</h5>
                                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                </div>
                                                                <div class="modal-body">
                                                                    <form>
                                                                        <div class="mb-3">
                                                                            <label for="recipient-name" class="col-form-label">Customer:</label>
                                                                            <input type="text" class="form-control" id="recipient-name" value="<%=cont.getUsername()%>">
                                                                        </div>
                                                                        <div class="mb-3">
                                                                            <label for="recipient-name" class="col-form-label">Phone No:</label>
                                                                            <input type="text" class="form-control" id="recipient-name" value="<%=cont.getPhone()%>">
                                                                        </div>
                                                                        <div class="mb-3">
                                                                            <label for="recipient-name" class="col-form-label">Email Address:</label>
                                                                            <input type="text" class="form-control" id="recipient-name" value="<%=cont.getEmail()%>">
                                                                        </div>
                                                                        <div class="mb-3">
                                                                            <label for="message-text" class="col-form-label">Message:</label>
                                                                            <textarea class="form-control" id="message-text"><%=cont.getMessage()%></textarea>
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
                                <%
                                    }
                                %>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </body>
</html>
