<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@page import="classes.DbConnector"%>
<%@page import="classes.User"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!--header-->
    <link rel="stylesheet" href="index_style.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <!--task list font-->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Kalam:wght@700&display=swap" rel="stylesheet">
    <!--task list cdn-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"
        integrity="sha512-5A8nwdMOWrSz20fDsjczgUidUBR8liPYU+WymTZP1lmY9G6Oc7HlZv156XqnsgNUzTyMefFTcsFH/tnJE/+xBg=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
        <!--task list-->
    <link rel="stylesheet" href="testTaskstyles.css">
    <!--footer-->
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
    <link href="http://fonts.googleapis.com/css?family=Cookie" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="footer-new-style.css">
    <!-- Google Fonts -->
    <!-- <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet"> -->
    <!-- Font Awesome cdn css -->
    <!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="testTaskstyles.css">-->
    <title>Task List</title> 
</head>
<body>

    <!--Header section-->
      <nav class="navbar navbar-expand-lg bg-body-tertiary fixed-top">
            <div class="container-fluid">
                <!--logo-->
                <a class="navbar-brand fs-4" href="index.jsp"><img src="images/logo.png" style="height: 50px"></a>
                <!--toggle-->
                <button class="navbar-toggler shadow-none border-0" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <!--sidebar-->
                <div class="sidebar offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
                    <!--slidebar header-->
                    <div class="offcanvas-header text-blue border-bottom">
                        <h5 class="offcanvas-title" id="offcanvasNavbarLabel"><img src="assets\images\logo.png" alt="logo" height="120px" width="120px"></h5>
                        <button type="button" class="btn-close btn-close-blue" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                    </div>
                    <!--slidebar body-->
                    <div class="offcanvas-body flex-column flex-lg-row p-lg-0">
                        <ul class="navbar-nav justify-content-center align-items-center flex-grow-1 pe-3">
                            <li class="nav-item mx-2">
                                <a class="nav-link active" aria-current="page" href="index.jsp">Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="aboutUs.jsp">About</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="category.jsp">Event Packages</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="gallery.jsp">Gallery</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="contact.jsp">Contact Us</a>
                            </li>
                        </ul>
                        <!--login-->
                        <%
                            if (session != null && session.getAttribute("user") != null) {
                                User user = (User) session.getAttribute("user");
                                String role = user.getRole();

                                if (role.equals("admin")) {
                        %>
                        <!--admin login-->
                        <div class="d-flex flex-lg-row justify-content-center align-items-center gap-3">
                            <a href="admin_panel.jsp" class="text-white text-decoration-none px-3 py-1 rounded-4" style="background-color: blue;">Admin Panel</a>
                        </div>
                        <% } else {%>
                        <div class="d-flex flex-lg-row justify-content-center align-items-center gap-3">
                            <a href="log_in.jsp" class="text-white text-decoration-none px-3 py-1 rounded-4" style="background-color: blue;"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAXklEQVR4nM2SSwqAMAwFZ9WrG+9p4zEiQhciaUkqogNvE8hAPvASBVgBBSogrRZGALvlrIVRR7BnBNURbE9HWDKC0iR1donfUC63t06G48igMfQTmhC4P2HJ/FAwxQFkTl77KJnvUQAAAABJRU5ErkJggg=="></a>
                            <a href="log_in.jsp" class="text-white text-decoration-none px-3 py-1 rounded-4" style="background-color: blue;"><%=user.getFirstName() + " " + user.getLastName()%></a>
                        </div>
                        <% }%>
                        <div class="d-flex flex-lg-row justify-content-center align-items-center gap-3">
                            <a href="signout.jsp" class="text-white text-decoration-none px-3 py-1 rounded-4" style="background-color: blue;">LOGOUT</a>
                        </div>
                        <% } else { %>
                        <div class="d-flex flex-lg-row justify-content-center align-items-center gap-3">
                            <a href="log_in.jsp" class="text-white text-decoration-none px-3 py-1 rounded-4" style="background-color: blue;">LOGIN</a>
                        </div>
                        <% }%>
                    </div>
                </div>
            </div>
        </nav>

    <!--body-->
    <div class="background">
    <h1>My Task List</h1>
    <form action="">
        <input type="text" class="todo-input">
        <button class="todo-button" type="submit">
            <i class="fas fa-plus-circle fa-lg"></i>
        </button>
        <div class="select">
            <select name="todos" class="filter-todo">
                <option value="all">All</option>
                <option value="completed">Completed</option>
                <option value="ongoing">Ongoing</option>
            </select>
        </div>
    </form>

    <div class="todo-container">
        <ul class="todo-list"></ul>
    </div>
</div>

    <!--footer-->
    <footer class="footer-distributed">

        <div class="footer-left">
            <h3><span>EVENTRA</span></h3>

            <p class="footer-links">
                <a href="index.jsp">Home</a>
                |
                <a href="aboutUs.jsp">About</a>
                |
                <a href="contact.jsp">Contact</a>
            </p>

            <p class="footer-company-name">Copyright Â© 2024 <strong>EVENTRA</strong> All rights reserved</p>
        </div>

        <div class="footer-center">
            <div>
                <i class="fa fa-map-marker"></i>
                <p>277/C,3 Galle Road,
                    Colombo</p>
            </div>

            <div>
                <i class="fa fa-phone"></i>
                <p>(+94)11-2345678</p>
            </div>
            <div>
                <i class="fa fa-envelope"></i>
                <p><a href="">eventracreation@gmail.com</a></p>
            </div>
        </div>
        <div class="footer-right">
            <p class="footer-company-about">
                <span>Let's chat</span>
                Make your dream event a reality with our exceptional event planning services. At Eventra, we specialize
                in crafting unforgettable experiences tailored to your unique vision. From elegant weddings and
                corporate galas to intimate celebrations and grand milestones, our dedicated team of experts will guide
                you through every step of the planning process. Contact us today to start creating memories that will
                last a lifetime.
            </p>
            <div class="footer-icons">
                <a href="#"><i class="fa fa-facebook"></i></a>
                <a href="#"><i class="fa fa-instagram"></i></a>
                <a href="#"><i class="fa fa-linkedin"></i></a>
                <a href="#"><i class="fa fa-twitter"></i></a>
                <a href="#"><i class="fa fa-youtube"></i></a>
            </div>
        </div>
    </footer>


<!--header script-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<!--body script-->
    <script src="testTaskscript.js"></script>
    
</body>
</html>