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
    <title>About Us</title>
    <!-- head -->
    <link rel="stylesheet" href="index_style.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

    <!-- body -->
    <!-- fontawesome cdn -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <!-- bootstrap css -->
    <link rel = "stylesheet" href = "bootstrap-5.0.2-dist/css/bootstrap.min.css">
    <!-- custom css -->
    <link rel = "stylesheet" href = "aboutUs.css">
    <!-- blog -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css" integrity="sha384-b6lVK+yci+bfDmaY1u0zE8YYJt0TZxLEAFyYSLHId4xoVvsrQu3INevFKo+Xir8e" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.2.1/css/fontawesome.min.css" integrity="sha384-QYIZto+st3yW+o8+5OHfT6S482Zsvz2WfOzpFSXMF9zqeLcFV0/wlZpMtyFcZALm" crossorigin="anonymous">

    <!-- footer -->
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
    <link href="http://fonts.googleapis.com/css?family=Cookie" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="footer-new-style.css">
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
                                <a class="nav-link" href="index.jsp" style="color: black;">Home</a>
                            </li>
                            <li class="nav-item mx-2">
                                <a class="nav-link active" aria-current="page" href="aboutUs.jsp" style="color: black;">About</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="category.jsp" style="color: black;">Event Packages</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="gallery.jsp" style="color: black;">Gallery</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="contact.jsp" style="color: black;">Contact Us</a>
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

    <!-- header -->
    <header id = "header" class = "vh-100 carousel slide" data-bs-ride = "carousel" style = "padding-top: 104px;">
        <div class = "container h-100 d-flex align-items-center carousel-inner">
            <div class = "text-center carousel-item active">
                <img src="https://images.pexels.com/photos/2959200/pexels-photo-2959200.jpeg?auto=compress&cs=tinysrgb&w=600">
            </div>
            <div class = "text-center carousel-item">
                <img src="https://images.pexels.com/photos/1042152/pexels-photo-1042152.jpeg?auto=compress&cs=tinysrgb&w=600">
            </div>
            <div class = "text-center carousel-item">
                <img src="https://images.pexels.com/photos/3171823/pexels-photo-3171823.jpeg?auto=compress&cs=tinysrgb&w=600">
            </div>
            <div class = "text-center carousel-item">
                <img src="https://images.pexels.com/photos/6224980/pexels-photo-6224980.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load">
            </div>
            <div class = "text-center carousel-item">
                <img src="https://images.pexels.com/photos/3171837/pexels-photo-3171837.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load">
            </div>
        </div>

        <button class = "carousel-control-prev" type = "button" data-bs-target="#header" data-bs-slide = "prev">
            <span class = "carousel-control-prev-icon"></span>
        </button>
        <button class = "carousel-control-next" type = "button" data-bs-target="#header" data-bs-slide = "next">
            <span class = "carousel-control-next-icon"></span>
        </button>
    </header>
    <!-- end of header -->

    <!-- about us -->
    <section id = "about" class = "py-5">
        <div class = "container">
            <div class = "row gy-lg-5 align-items-center">
                <div class = "col-lg-6 order-lg-1 text-center text-lg-start">
                    <div class = "title pt-3 pb-5">
                        <h2 class = "position-relative d-inline-block ms-4">About Us</h2>
                    </div>
                    <p class = "lead text-muted">Welcome to Eventra</p>
                    <p>your go-to destination for creating unforgettable experiences. <br>As a premier event
                        planning service since 2018, we specialize in turning your visions into reality and
                        curating exceptional events that leave a lasting impression. we understand that every
                        occasion is unique and deserves meticulous attention to detail. Whether you're
                        organizing a corporate conference, a dream wedding, a milestone celebration, or any
                        other special event, our dedicated team of experienced professionals is here to bring
                        your ideas to life.</p>
                </div>
                <div class = "col-lg-6 order-lg-0">
                    <img src = "https://www.designandpaper.com/wp-content/uploads/2022/06/summerpartydecoration_featured1-copy.jpg" alt = "" class = "img-fluid">
                </div>
            </div>
        </div>
    </section>
    <!-- end of about us -->

    <!-- blogs -->
    <section id = "blogs" class = "py-5">
        <div class = "container">
            <div class = "title text-center py-5">
                <h2 class = "position-relative d-inline-block">Our Team Members</h2>
            </div>

            <div class = "row g-3">
                <div class = "card border-0 col-md-6 col-lg-4 bg-transparent my-3">
                    <img src = "https://img.freepik.com/premium-photo/stylish-businesswoman-works-laptop_125374-274.jpg?size=626&ext=jpg" alt = "">
                    <div class = "card-body px-0">
                        <h4 class = "card-title">Julie Watson</h4>
                        <p class = "card-text">
                            <small class = "text-muted">
                                <span class = "fw-bold">Founder & Senior Consultant</span>
                            </small>
                        </p>
                        <p class = "card-text mt-3 text-muted">The founder and senior consultant of Eventra, Julie brings a wealth of experience and expertise
                            to
                            every
                            project.</p><br>
                            <div class="socials">
                                <button class="github"><i class="bi bi-facebook"></i></button>
                                <button class="twitter"><i class="fab fa-twitter"></i></button>
                                <button class="pinterest"><i class="fab fa-pinterest-p"></i></button>
                            </div>
                    </div>
                </div>

                <div class = "card border-0 col-md-6 col-lg-4 bg-transparent my-3">
                    <img src = "https://img.freepik.com/free-photo/widely-smiling-businesswoman-working-laptop-sitting-cafe_197531-341.jpg?size=626&ext=jpg" alt = "">
                    <div class = "card-body px-0">
                        <h4 class = "card-title">Emliy Roberts</h4>
                        <p class = "card-text">
                            <small class = "text-muted">
                                <span class = "fw-bold">Co-founder & Senior Consultant</span>
                            </small>
                        </p>
                        <p class = "card-text mt-3 text-muted">Your ultimate destination for exceptional event planning. Meet Emliy Roberts, a visionary
                            co-founder
                            and senior consultant</p>
                            <div class="socials">
                                <button class="github"><i class="bi bi-facebook"></i></button>
                                <button class="twitter"><i class="fab fa-twitter"></i></button>
                                <button class="pinterest"><i class="fab fa-pinterest-p"></i></button>
                            </div>
                    </div>
                </div>

                <div class = "card border-0 col-md-6 col-lg-4 bg-transparent my-3">
                    <img src = "https://img.freepik.com/premium-photo/businesswoman-office-sitting-with-laptop-looking-camera_360066-17105.jpg?size=626&ext=jpg" alt = "">
                    <div class = "card-body px-0">
                        <h4 class = "card-title">Grace Arabella</h4>
                        <p class = "card-text">
                            <small class = "text-muted">
                                <span class = "fw-bold">Senior Consultant</span>
                            </small>
                        </p>
                        <p class = "card-text mt-3 text-muted">Your premier destination for exceptional event planning. Meet Grace Arabella, an esteemed senior
                            consultant</p><br>
                            <div class="socials">
                                <button class="github"><i class="bi bi-facebook"></i></button>
                                <button class="twitter"><i class="fab fa-twitter"></i></button>
                                <button class="pinterest"><i class="fab fa-pinterest-p"></i></button>
                            </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- end of blogs -->

    <!-- blogs -->
    <section id = "offers" class = "py-5">
        <div class = "container">
            <div class = "row d-flex align-items-center justify-content-center text-center justify-content-lg-start text-lg-start">
                <div class = "offers-content">
                    <span class = "text-white">Get Discount</span>
                    <h2 class = "mt-2 mb-4 text-white">Event Package Offer!</h2>
                    <a href = "category.jsp" class = "btn">Purchase Now</a>
                </div>
            </div>
        </div>
    </section>
    <!-- end of blogs -->

    <!-- collection -->
    <section id = "collection" class = "py-5">
        <div class = "container">
            <div class = "title text-center">
                <h2 class = "position-relative d-inline-block">Our Service Providers</h2>
            </div>

                <div class = "collection-list mt-4 row gx-0 gy-3">
                    <div class = "col-md-6 col-lg-4 col-xl-3 p-2 best">
                        <div class = "collection-img position-relative">
                            <img src = "https://www.designhill.com/resize_img.php?atyp=page_file&pth=ft_ca_ct||128||contestfile_3&flp=1553590190-21304310735c99e7ae995806-08051329.jpg" class = "w-100">
                            <!-- <span class = "position-absolute bg-primary text-white d-flex align-items-center justify-content-center">sale</span> -->
                        </div>
                        <div class = "text-center">
                            <div class = "rating mt-3">
                                <span class = "text-primary"><i class = "fas fa-star"></i></span>
                                <span class = "text-primary"><i class = "fas fa-star"></i></span>
                                <span class = "text-primary"><i class = "fas fa-star"></i></span>
                                <span class = "text-primary"><i class = "fas fa-star"></i></span>
                                <span class = "text-primary"><i class = "fas fa-star"></i></span>
                            </div>
                            <!-- <p class = "text-capitalize my-1">gray shirt</p> -->
                            <span class = "fw-bold">Lea Lee</span>
                        </div>
                    </div>

                    <div class = "col-md-6 col-lg-4 col-xl-3 p-2 feat">
                        <div class = "collection-img position-relative">
                            <img src = "https://thumbs.dreamstime.com/b/monochrome-bridal-boutique-logo-wedding-dresses-sign-icon-mannequin-fashion-beautiful-bride-vector-design-template-145167671.jpg" class = "w-100">
                        </div>
                        <div class = "text-center">
                            <div class = "rating mt-3">
                                <span class = "text-primary"><i class = "fas fa-star"></i></span>
                                <span class = "text-primary"><i class = "fas fa-star"></i></span>
                                <span class = "text-primary"><i class = "fas fa-star"></i></span>
                                <span class = "text-primary"><i class = "fas fa-star"></i></span>
                                <span class = "text-primary"><i class = "fas fa-star"></i></span>
                            </div>
                            <span class = "fw-bold">Bridal Boutique</span>
                        </div>
                    </div>

                    <div class = "col-md-6 col-lg-4 col-xl-3 p-2 new">
                        <div class = "collection-img position-relative">
                            <img src = "data:image/png;base64,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" class = "w-100">
                        </div>
                        <div class = "text-center">
                            <div class = "rating mt-3">
                                <span class = "text-primary"><i class = "fas fa-star"></i></span>
                                <span class = "text-primary"><i class = "fas fa-star"></i></span>
                                <span class = "text-primary"><i class = "fas fa-star"></i></span>
                                <span class = "text-primary"><i class = "fas fa-star"></i></span>
                                <span class = "text-primary"><i class = "fas fa-star"></i></span>
                            </div>
                            <span class = "fw-bold">Solo Music</span>
                        </div>
                    </div>

                    <div class = "col-md-6 col-lg-4 col-xl-3 p-2 best">
                        <div class = "collection-img position-relative">
                            <img src = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRTf6ndqbIs49PPXLRdwh13jWLwp2WMAANleA&usqp=CAU" class = "w-100">
                        </div>
                        <div class = "text-center">
                            <div class = "rating mt-3">
                                <span class = "text-primary"><i class = "fas fa-star"></i></span>
                                <span class = "text-primary"><i class = "fas fa-star"></i></span>
                                <span class = "text-primary"><i class = "fas fa-star"></i></span>
                                <span class = "text-primary"><i class = "fas fa-star"></i></span>
                                <span class = "text-primary"><i class = "fas fa-star"></i></span>
                            </div>
                            <span class = "fw-bold">Beauty Salon</span>
                        </div>
                    </div>

                    <div class = "col-md-6 col-lg-4 col-xl-3 p-2 feat">
                        <div class = "collection-img position-relative">
                            <img src = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT72iQyGCxGikMR_xBV1YtVlntPB00TUp74Kw&usqp=CAU" class = "w-100">
                        </div>
                        <div class = "text-center">
                            <div class = "rating mt-3">
                                <span class = "text-primary"><i class = "fas fa-star"></i></span>
                                <span class = "text-primary"><i class = "fas fa-star"></i></span>
                                <span class = "text-primary"><i class = "fas fa-star"></i></span>
                                <span class = "text-primary"><i class = "fas fa-star"></i></span>
                                <span class = "text-primary"><i class = "fas fa-star"></i></span>
                            </div>
                            <span class = "fw-bold">Alonso's Catering</span>
                        </div>
                    </div>

                    <div class = "col-md-6 col-lg-4 col-xl-3 p-2 new">
                        <div class = "collection-img position-relative">
                            <img src="https://i.etsystatic.com/21279888/r/il/6bd749/3638557802/il_500x500.3638557802_ljvq.jpg" class="w-100">
                        </div>
                        <div class = "text-center">
                            <div class = "rating mt-3">
                                <span class = "text-primary"><i class = "fas fa-star"></i></span>
                                <span class = "text-primary"><i class = "fas fa-star"></i></span>
                                <span class = "text-primary"><i class = "fas fa-star"></i></span>
                                <span class = "text-primary"><i class = "fas fa-star"></i></span>
                                <span class = "text-primary"><i class = "fas fa-star"></i></span>
                            </div>
                            <span class = "fw-bold">Susan White Boutique</span>
                        </div>
                    </div>

                    <div class = "col-md-6 col-lg-4 col-xl-3 p-2 best">
                        <div class = "collection-img position-relative">
                            <img src = "data:image/jpeg;base64,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" class = "w-100">
                        </div>
                        <div class = "text-center">
                            <div class = "rating mt-3">
                                <span class = "text-primary"><i class = "fas fa-star"></i></span>
                                <span class = "text-primary"><i class = "fas fa-star"></i></span>
                                <span class = "text-primary"><i class = "fas fa-star"></i></span>
                                <span class = "text-primary"><i class = "fas fa-star"></i></span>
                                <span class = "text-primary"><i class = "fas fa-star"></i></span>
                            </div>
                            <span class = "fw-bold">HBC</span>
                        </div>
                    </div>

                    <div class = "col-md-6 col-lg-4 col-xl-3 p-2 feat">
                        <div class = "collection-img position-relative">
                            <img src = "https://i.pinimg.com/originals/18/ae/30/18ae30cc993cc26510fafb3407de0f9d.png" class = "w-100">
                        </div>
                        <div class = "text-center">
                            <div class = "rating mt-3">
                                <span class = "text-primary"><i class = "fas fa-star"></i></span>
                                <span class = "text-primary"><i class = "fas fa-star"></i></span>
                                <span class = "text-primary"><i class = "fas fa-star"></i></span>
                                <span class = "text-primary"><i class = "fas fa-star"></i></span>
                                <span class = "text-primary"><i class = "fas fa-star"></i></span>
                            </div>
                            <span class = "fw-bold">Design Co.</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- end of collection -->

    <!-- footer -->
    <footer class=" footer-distributed">

        <div class="footer-left">
            <h3><span>EVENTRA</span></h3>

            <p class="footer-links">
                <a href="index.jsp">Home</a>
                |
                <a href="aboutUs.jsp">About</a>
                |
                <a href="contact.jsp">Contact</a>
            </p>

            <p class="footer-company-name">Copyright Â© 2024 <strong>EVENTRA</strong> All rights reserved
            </p>
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
                Make your dream event a reality with our exceptional event planning services. At
                Eventra, we
                specialize
                in crafting unforgettable experiences tailored to your unique vision. From elegant
                weddings
                and
                corporate galas to intimate celebrations and grand milestones, our dedicated team of
                experts
                will guide
                you through every step of the planning process. Contact us today to start creating
                memories
                that will
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
    <!-- end of footer -->

        <!-- head -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

        <!-- body -->
    <!-- jquery -->
    <script src = "js/jquery-3.6.0.js"></script>
    <!-- isotope js -->
    <script src="https://unpkg.com/isotope-layout@3/dist/isotope.pkgd.js"></script>
    <!-- bootstrap js -->
    <script src = "bootstrap-5.0.2-dist/js/bootstrap.min.js"></script>
    <!-- custom js -->
    <script src = "js/script.js"></script>
</body>
</html>