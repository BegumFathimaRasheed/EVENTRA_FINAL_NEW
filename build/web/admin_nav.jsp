<%-- 
    Document   : admin_nav
    Created on : Aug 10, 2023, 4:05:14 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@page import="classes.DbConnector"%>
<%@page import="classes.User"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/bootstrap.min.css" />
        <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
            />
        <link rel="stylesheet" href="css/dataTables.bootstrap5.min.css" />
        <link rel="stylesheet" href="css/style.css" />
        <title>Admin Dashboard</title>
    </head>
    <body>
        <!-- top navigation bar -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
            <div class="container-fluid">
                <button
                    class="navbar-toggler"
                    type="button"
                    data-bs-toggle="offcanvas"
                    data-bs-target="#sidebar"
                    aria-controls="offcanvasExample"
                    >
                    <span class="navbar-toggler-icon" data-bs-target="#sidebar"></span>
                </button>
                <a
                    class="navbar-brand me-auto ms-lg-0 ms-3 text-uppercase fw-bold"
                    href="index.jsp"
                    >Eventra</a
                >
                <button
                    class="navbar-toggler"
                    type="button"
                    data-bs-toggle="collapse"
                    data-bs-target="#topNavBar"
                    aria-controls="topNavBar"
                    aria-expanded="false"
                    aria-label="Toggle navigation"
                    >
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="topNavBar">
                    <%
                        User user = null;
                        if (session.getAttribute("user") != null) {
                            user = (User) session.getAttribute("user");
                        }
                    %>
                    <form class="d-flex ms-auto my-3 my-lg-0" action="signout.jsp" method="POST">
                        <div class="input-group">
                            <input
                                class="form-control"
                                type="text"
                                value="<%=user.getFirstName() + ' ' + user.getLastName()%>"
                                aria-label="admin name"
                                readonly="readonly"
                                />
                                <button class="btn btn-primary" type="submit">
                                    logout
                                </button>
                        </div>
                    </form>
                </div>
            </div>
        </nav>
        <!-- top navigation bar -->
        <!-- offcanvas -->
        <div
            class="offcanvas offcanvas-start sidebar-nav bg-dark"
            tabindex="-1"
            id="sidebar"
            >
            <div class="offcanvas-body p-0">
                <nav class="navbar-dark">
                    <ul class="navbar-nav">
                        <li>
                            <a href="admin_dashboard.jsp" class="nav-link px-3 active">
                                <span class="me-2"><i class="bi bi-speedometer2"></i></span>
                                <span>Dashboard</span>
                            </a>
                        </li>
                        <li class="my-4"><hr class="dropdown-divider bg-light" /></li>
                        <li>
                            <a href="admin_event.jsp" class="nav-link px-3 active">
                                <span class="me-2"><i class="bi bi-speedometer2"></i></span>
                                <span>Events and Blogs</span>
                            </a>
                        </li>
                        <li class="my-4"><hr class="dropdown-divider bg-light" /></li>
                        <li>
                            <a href="admin_user.jsp" class="nav-link px-3 active">
                                <span class="me-2"><i class="bi bi-speedometer2"></i></span>
                                <span>User Management</span>
                            </a>
                        </li>
                        <li class="my-4"><hr class="dropdown-divider bg-light" /></li>
                        <li>
                            <a href="admin_contact.jsp" class="nav-link px-3 active">
                                <span class="me-2"><i class="bi bi-speedometer2"></i></span>
                                <span>Contact Forms</span>
                            </a>
                        </li>
                        <li class="my-4"><hr class="dropdown-divider bg-light" /></li>
                    </ul>
                </nav>
            </div>
        </div>
        <!-- offcanvas -->
    </div>
</main>
<script src="./js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.0.2/dist/chart.min.js"></script>
<script src="./js/jquery-3.5.1.js"></script>
<script src="./js/jquery.dataTables.min.js"></script>
<script src="./js/dataTables.bootstrap5.min.js"></script>
<script src="./js/script.js"></script>
</body>

</body>
</html>
