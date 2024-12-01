<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@page import="classes.DbConnector"%>
<%@page import="classes.User"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Gallery</title>
        <!--head-->
        <link rel="stylesheet" href="index_style.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
        <!--body-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="gallery_style.css">
        <!--footer-->
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
        <link href="http://fonts.googleapis.com/css?family=Cookie" rel="stylesheet" type="text/css">
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
        <section class="gallery min-vh-100">
            <div class="container-lg">
                <div class="row gy-4 row-cols-1 row-cols-sm-2 row-cols-md-3">
                    <div class="col">
                        <img src="https://img.freepik.com/free-photo/stage-with-white-curtain-that-says-pink-white-it_1340-24739.jpg?t=st=1689411912~exp=1689415512~hmac=265611b198c5ee19493fc6da0d72cd7339a096c7f71c7ccaebd86f97c728d8cc&w=900"
                             class="gallery-item" alt="Gallery1">
                    </div>

                    <div class="col">
                        <img src="https://img.freepik.com/free-photo/beautiful-photozone-with-big-wreath-decorated-with-greenery-roses-centerpiece-candles-sides-garland-hanged-trees_8353-11019.jpg?size=626&ext=jpg"
                             class="gallery-item" alt="Gallery2">
                    </div>

                    <div class="col">
                        <img src="https://img.freepik.com/free-photo/antique-gold-flower-light-candle_1232-4150.jpg?size=626&ext=jpg"
                             class="gallery-item" alt="Gallery3">
                    </div>

                    <div class="col">
                        <img src="https://img.freepik.com/premium-photo/wedding-backdrop-with-flower-wedding-decoration_33799-550.jpg?size=626&ext=jpg"
                             class="gallery-item" alt="Gallery4">
                    </div>

                    <div class="col">
                        <img src="https://img.freepik.com/free-photo/front-view-rich-arch-decorated-with-adorable-fresh-roses-flowers_8353-11607.jpg?size=626&ext=jpg"
                             class="gallery-item" alt="Gallery5">
                    </div>

                    <div class="col">
                        <img src="https://img.freepik.com/premium-photo/place-wedding-ceremony-garden-outdoors-copy-space_247696-264.jpg?size=626&ext=jpg"
                             class="gallery-item" alt="Gallery6">
                    </div>
                    <div class="col">
                        <img src="https://img.freepik.com/free-photo/groom-bride-s-wedding-table-decorated-with-flowers-candles_8353-10400.jpg?size=626&ext=jpg"
                             class="gallery-item" alt="Gallery1">
                    </div>

                    <div class="col">
                        <img src="https://img.freepik.com/free-photo/shine-wedding-altar-newlyweds-stands-backyard-decorated-with-balloons_8353-8415.jpg?size=626&ext=jpg"
                             class="gallery-item" alt="Gallery2">
                    </div>

                    <div class="col">
                        <img src="https://img.freepik.com/premium-photo/night-wedding-ceremony-with-lot-lights-candles-lanterns_159701-2621.jpg?size=626&ext=jpg"
                             class="gallery-item" alt="Gallery3">
                    </div>

                    <div class="col">
                        <img src="https://img.freepik.com/free-photo/beautiful-brunette-bride-near-archway-made-blue-hydrangea-ruscus-wedding-day_8353-11136.jpg?size=626&ext=jpg"
                             class="gallery-item" alt="Gallery4">
                    </div>

                    <div class="col">
                        <img src="https://images.pexels.com/photos/1857157/pexels-photo-1857157.jpeg?auto=compress&cs=tinysrgb&w=600"
                             class="gallery-item" alt="Gallery5">
                    </div>

                    <div class="col">
                        <img src="https://images.pexels.com/photos/5610382/pexels-photo-5610382.jpeg?auto=compress&cs=tinysrgb&w=600"
                             class="gallery-item" alt="Gallery6">
                    </div>
                    <div class="col">
                        <img src="https://images.pexels.com/photos/16935997/pexels-photo-16935997/free-photo-of-delicious-food-at-the-snacks-table-in-an-elegant-restaurant-at-a-banquet.jpeg?auto=compress&cs=tinysrgb&w=600"
                             class="gallery-item" alt="Gallery4">
                    </div>

                    <div class="col">
                        <img src="https://images.pexels.com/photos/9391491/pexels-photo-9391491.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
                             class="gallery-item" alt="Gallery5">
                    </div>

                    <div class="col">
                        <img src="https://images.pexels.com/photos/1395964/pexels-photo-1395964.jpeg?auto=compress&cs=tinysrgb&w=600"
                             class="gallery-item" alt="Gallery6">
                    </div>
                    <div class="col">
                        <img src="https://images.pexels.com/photos/2899737/pexels-photo-2899737.jpeg?auto=compress&cs=tinysrgb&w=600"
                             class="gallery-item" alt="Gallery1">
                    </div>

                    <div class="col">
                        <img src="https://images.pexels.com/photos/2306277/pexels-photo-2306277.jpeg?auto=compress&cs=tinysrgb&w=600"
                             class="gallery-item" alt="Gallery2">
                    </div>

                    <div class="col">
                        <img src="https://images.pexels.com/photos/716281/pexels-photo-716281.jpeg?auto=compress&cs=tinysrgb&w=600"
                             class="gallery-item" alt="Gallery3">
                    </div>
                    <div class="col">
                        <img src="https://images.pexels.com/photos/787961/pexels-photo-787961.jpeg?auto=compress&cs=tinysrgb&w=600"
                             class="gallery-item" alt="Gallery1">
                    </div>

                    <div class="col">
                        <img src="https://images.pexels.com/photos/587741/pexels-photo-587741.jpeg?auto=compress&cs=tinysrgb&w=600"
                             class="gallery-item" alt="Gallery2">
                    </div>

                    <div class="col">
                        <img src="https://images.pexels.com/photos/10733586/pexels-photo-10733586.jpeg?auto=compress&cs=tinysrgb&w=600"
                             class="gallery-item" alt="Gallery3">
                    </div>

                </div>
            </div>
        </section>

        <!-- Modal -->
        <div class="modal fade" id="gallery-popup" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <!-- <h5 class="modal-title" id="exampleModalLabel">Modal title</h5> -->
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <img src="images/1.jpg" class="modal-img" alt="Modal Image">
                    </div>
                </div>
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

        <!--header-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

        <!--body-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"></script>

        <script type="text/javascript">
            document.addEventListener("click", function (e) {
                if (e.target.classList.contains("gallery-item")) {
                    const src = e.target.getAttribute("src");
                    document.querySelector(".modal-img").src = src;
                    const myModal = new bootstrap.Modal(document.getElementById('gallery-popup'));
                    myModal.show();
                }
            })
        </script>
    </body>

</html>