<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@page import="classes.DbConnector"%>
<%@page import="classes.User"%>
<!DOCTYPE html>
<html>
<head>
    <title>Birthday Package</title>
    <!--Google Font-->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <!--rating-->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <!--Stylesheet-->
    <link rel="stylesheet" href="birthday.css">
    <!--fonts-->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Indie+Flower&display=swap" rel="stylesheet">

    <!--header section-->
    <link rel="stylesheet" href="index_style.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <!--end of header section-->

    <!--footer section-->
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
    <link href="http://fonts.googleapis.com/css?family=Cookie" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="footer-new-style.css">
    <!--end of footer section-->

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
                            <li class="nav-item">
                                <a class="nav-link" href="index.jsp">Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="aboutUs.jsp">About</a>
                            </li>
                            <li class="nav-item mx-2">
                                <a class="nav-link active" aria-current="page" href="category.jsp">Event Packages</a>
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
    <!--end of header section-->
    <div class="menu">
        <div class="heading">
            <h1>EVENTRA</h1>
            <h3>&mdash; BIRTHDAY PARTY &mdash; </h3>
        </div>
        <div class="event-items">
            <img src="https://www.kidspartytime.com.au/wp-content/uploads/2018/02/ice-cream-birthday-party-side-view.jpg">
            <div class="details">
                <div class="details-sub">
                    <h5 style="padding-left: 170px;">ELITE</h5>
                </div>
                <p>Birthday cake and desserts<br>Catering and menu selection<br>Decoration<br>Magicians and clowns<br>DJ and music<br>Photography and videography<br>Face painting<br>Temporary tattoo artists<br>Party favors and giveaways<br><br><br><br><span style="font-weight: bolder; font-size: large;">Price LKR.70,000.00</span></p>
                <button onclick="redirectToCategoryAndPackage('ELITE', 'BIRTHDAY')">Purchase</button>
            </div>
        </div>

        <div class="event-items">
            <img src="https://ohhappyplay.com/wp-content/uploads/2022/06/IMG_3843-1024x768.jpg" style="height: 295px;">
            <div class="details">
                <div class="details-sub">
                    <h5 style="padding-left: 185px;">GOLD</h5>
                </div>
                <p>Birthday cake and desserts<br>Catering and menu selection<br>Decoration<br>Magicians and clowns<br>DJ and music<br>Photography and videography<br>Party favors and giveaways<br><br><br><br><br><br><span style="font-weight: bolder; font-size: large;">Price LKR.50,000.00</span></p>
                    <button onclick="redirectToCategoryAndPackage('GOLD', 'BIRTHDAY')">Purchase</button>
            </div>
        </div>

        <div class="event-items">
            <img src="https://www.joyinthecommonplace.com/wp-content/uploads/2018/08/Bubbles-Party-1.jpg" style="height: 295px;">
            <div class="details">
                <div class="details-sub">
                    <h5 style="padding-left: 175px;">PREMIER</h5>
                </div>
                <p>Birthday cake and desserts<br>Catering and menu selection<br>Decoration<br>Magicians and clowns<br>DJ and music<br>Photography and videography<br><br><br><br><br><br><br><span style="font-weight: bolder; font-size: large;">Price LKR.35,000.00</span></p>
                    <button onclick="redirectToCategoryAndPackage('PREMIER', 'BIRTHDAY')">Purchase</button>
            </div>
        </div>
        <div class="event-items">
            <img src="https://marketplacer.imgix.net/6V/2y_snxrGkVwpjIx3zPpvyt1rw.jpg?auto=format&fm=pjpg&fit=max&q=90&itemprop=image&alt=AVA%27S%20ICE%20CREAM%20BIRTHDAY%20%E2%80%93%20PASTEL%20PARTY%20PRETTINESS&w=1600&h=1000&s=e9c778b8bfa70ffcee15ca99fdaee4e2" style="height: 295px;">
            <div class="details">
                <div class="details-sub">
                    <h5 style="padding-left: 150px;">ELEGANT</h5>
                </div>
                <p>Birthday cake and desserts<br>Catering and menu selection<br>Decoration<br>Magicians and clowns<br>Photography and videography<br><br><br><br><br><br><br><br><span style="font-weight: bolder; font-size: large;">Price LKR.20,000.00</span></p>
                <button onclick="redirectToCategoryAndPackage('ELEGANT', 'BIRTHDAY')">Purchase</button>
            </div>
        </div>

        <div class="event-items">
            <img src="https://confettifair.com.au/wp-content/uploads/2019/08/Sorbet-Pastel-Balloon-Party-1024x814.jpg" style="height: 295px;">
            <div class="details">
                <div class="details-sub">
                    <h5 style="padding-left: 175px;">CLASSIC</h5>
                </div>
                <p>Birthday cake and desserts<br>Catering and menu selection<br>Decoration<br><br><br><br><br><br><br><br><br><br><span style="font-weight: bolder; font-size: large;">Price LKR.10,000.00</span></p>
                    <button onclick="redirectToCategoryAndPackage('CLASSIC', 'BIRTHDAY')">Purchase</button>
            </div>
        </div>
    </div>

    <!--footer section-->
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
    <!--end of footer section-->

    <!--header script-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
    <!--end of header script-->
    
    <script>
                        const categoryRedirectMap = {
                            'ELITE': 'parchase.jsp',
                            'GOLD': 'parchase.jsp',
                            'PREMIER': 'parchase.jsp',
                            'ELEGANT': 'parchase.jsp',
                            'CLASSIC': 'parchase.jsp'
                        };

                        function redirectToCategoryAndPackage(categoryType, eventType) {
                            console.log(`Redirecting to ${categoryType} category with ${eventType} event...`);
                            const categoryPage = categoryRedirectMap[categoryType];
                            if (categoryPage) {
                                console.log(`Redirect URL: ${categoryPage}`);
                                window.location.href = categoryPage + '?category=' + categoryType + '&event=' + eventType;
                            } else {
                                console.log(`No category URL found for ${categoryType}`);
                                alert('No category available for the selected event.');
                            }
                        }
        </script>
</body>
</html>