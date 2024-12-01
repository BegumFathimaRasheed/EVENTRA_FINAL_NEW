<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@page import="classes.DbConnector"%>
<%@page import="classes.User"%>


<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="TemplateMo">
        <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900" rel="stylesheet">

        <title>EVENTRA</title>

        <!-- Bootstrap core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">


        <!-- Additional CSS Files -->
        <link rel="stylesheet" href="assets/css/fontawesome.css">
        <link rel="stylesheet" href="assets/css/templatemo-edu-meeting.css">
        <link rel="stylesheet" href="assets/css/owl.css">
        <link rel="stylesheet" href="assets/css/lightbox.css">
        <!--
      
      TemplateMo 569 Edu Meeting
      
      https://templatemo.com/tm-569-edu-meeting
      
        -->

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
                            <a href="admin_dashboard.jsp" class="text-white text-decoration-none px-3 py-1 rounded-4" style="background-color: blue;">Admin Panel</a>
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

        <!-- ***** Main Banner Area Start ***** -->
        <section class="section main-banner" id="top" data-section="section1">
            <video autoplay muted loop id="bg-video">
                <source src="assets/images/event.m4v" type="video/mp4" />
            </video>

            <div class="video-overlay header-text">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="caption">
                                <h6>Hello Planners,</h6>
                                <h2>Welcome to EVENTRA</h2>
                                <p>Eventra is a dynamic and comprehensive event planner website that aims to revolutionize the way events
                                    are organized and executed. With a sleek and user-friendly interface, Eventra provides a one-stop
                                    platform for individuals, businesses, and organizations to plan, manage, and promote their events
                                    effortlessly. </p>
                                <div class="main-button-red"><a href="log_in.jsp">Log In</a>
                                    <div class="scroll-to-section"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- ***** Main Banner Area End ***** -->

        <section class="services">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="owl-service-item owl-carousel">

                            <div class="item">
                                <div class="icon">
                                    <img src="https://raajratna.com/wp-content/uploads/2019/01/person3.jpg" alt=""
                                         style="border-radius: 50%;">
                                </div>
                                <div class="down-content">
                                    <h4>John Smith</h4>
                                    <p>"EVENTRA has been a game-changer for my event planning needs! It's user-friendly and has all the
                                        tools I need to create and manage my events effortlessly."</p>
                                </div>
                            </div>

                            <div class="item">
                                <div class="icon">
                                    <img src="https://www.bobbin.lk/wp-content/uploads/2019/02/person5.jpg" alt=""
                                         style="border-radius: 50%;">
                                </div>
                                <div class="down-content">
                                    <h4>MarÃ­a GarcÃ­a</h4>
                                    <p>"I love using EVENTRA! It simplifies the event planning process with its intuitive interface and
                                        comprehensive features. It has made my events more organized and successful."</p>
                                </div>
                            </div>

                            <div class="item">
                                <div class="icon">
                                    <img src="https://www.bobbin.lk/wp-content/uploads/2019/02/person4.jpg" alt=""
                                         style="border-radius: 50%;">
                                </div>
                                <div class="down-content">
                                    <h4>Pierre Dubois</h4>
                                    <p>"EVENTRA is my go-to event planning platform. It offers a wide range of services and vendors, making
                                        it easy to find everything I need for a successful event. Highly recommended!"</p>
                                </div>
                            </div>

                            <div class="item">
                                <div class="icon">
                                    <img src="https://cogito-project.eu/wp-content/uploads/2019/01/person2.jpg" alt=""
                                         style="border-radius: 50%;">
                                </div>
                                <div class="down-content">
                                    <h4>Alessandra Rossi</h4>
                                    <p>"EVENTRA has saved me so much time and effort in event planning. The website's tools and resources
                                        are invaluable, and I appreciate how it streamlines the entire process."</p>
                                </div>
                            </div>

                            <div class="item">
                                <div class="icon">
                                    <img
                                        src="https://i1.rgstatic.net/ii/profile.image/318290138730496-1452897690086_Q512/Jacqueline-Persons.jpg"
                                        alt="" style="border-radius: 50%;">
                                </div>
                                <div class="down-content">
                                    <h4>Hans MÃ¼ller</h4>
                                    <p>"EVENTRA is a fantastic event planning website. It offers excellent customization options, allowing
                                        me to create unique and memorable events. I'm impressed with the results!"</p>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="upcoming-meetings" id="meetings">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-heading">
                            <h2>Special Offers</h2>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="categories">
                            <h4>Popular packages in this week</h4>
                            <ul>
                                <li><a href="wedding.jsp">Gold - Wedding</a></li>
                                <li><a href="category.jsp">Premier - Birthday party</a></li>
                                <li><a href="category.jsp">Gold - Gala dinner</a></li><br>
                                <li><a href="conference.jsp">Elite - Conference</a></li>
                                <li><a href="charity.jsp">Premier - Charity Event</a></li>
                            </ul>
                            <div class="main-button-red">
                                <a href="category.jsp">SEE ALL PACKAGES</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-8">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="meeting-item">
                                    <div class="thumb">
                                        <div class="price">
                                            <span>Best Offers</span>
                                        </div>
                                        <a href="wedding.jsp"><img
                                                src="https://images.unsplash.com/photo-1619356070234-607a25a7171e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80"
                                                alt="New Lecturer Meeting" style="height: 240px;"></a>
                                    </div>
                                    <div class="down-content">
                                        <!-- <div class="date">
                                          <h6>Nov <span>10</span></h6>
                                        </div> -->
                                        <a href="wedding.jsp">
                                            <h4 style="color: red;">UP TO 20% OFF</h4>
                                        </a>
                                        <p>Special offer till<br>next week.</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="meeting-item">
                                    <div class="thumb">
                                        <div class="price">
                                            <span>Best Offers</span>
                                        </div>
                                        <a href="wedding.jsp"><img
                                                src="https://img.freepik.com/free-vector/beautiful-hand-drawing-wedding-invitation-floral-design_44538-1955.jpg?w=2000"
                                                alt="Online Teaching" style="height: 240px;"></a>
                                    </div>
                                    <div class="down-content">
                                        <!-- <div class="date">
                                          <h6>Nov <span>24</span></h6>
                                        </div> -->
                                        <a href="category.jsp">
                                            <h4 style="color: red;">UP TO 10% OFF</h4>
                                        </a>
                                        <p>Special offer till<br>next week.</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="meeting-item">
                                    <div class="thumb">
                                        <div class="price">
                                            <span>Best Offers</span>
                                        </div>
                                        <a href="category.jsp"><img
                                                src="https://images.squarespace-cdn.com/content/v1/6352eaa458d35760ef6237ef/7453d076-efdb-4b3e-8558-fff3167137bf/23-Bridal-Suite-Nottingham-colour-SPR00075_-scaled.jpg?format=1000w"
                                                alt="Higher Education" style="height: 240px;"></a>
                                    </div>
                                    <div class="down-content">
                                        <!-- <div class="date">
                                          <h6>Nov <span>26</span></h6>
                                        </div> -->
                                        <a href="category.jsp">
                                            <h4 style="color: red;">UP TO 25% OFF</h4>
                                        </a>
                                        <p>Special offer till<br>next week.</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="meeting-item">
                                    <div class="thumb">
                                        <div class="price">
                                            <span>Best Offers</span>
                                        </div>
                                        <a href="category.jsp"><img
                                                src="https://www.datocms-assets.com/17746/1649240375-types-of-dj-header.jpg"
                                                alt="Student Training" style="height: 240px;"></a>
                                    </div>
                                    <div class="down-content">
                                        <!-- <div class="date">
                                          <h6>Nov <span>30</span></h6>
                                        </div> -->
                                        <a href="category.jsp">
                                            <h4 style="color: red;">UP TO 12% OFF</h4>
                                        </a>
                                        <p>Special offer till<br>next week.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="apply-now" id="apply">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 align-self-center">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="item">
                                    <h3>Do you already have an account?</h3>
                                    <p>Welcome to EVENTRA, your ultimate event planning destination! We're here to make your event
                                        management experience effortless and memorable. To get started, we want to ensure we provide you with
                                        the best possible service. </p>
                                    <div class="main-button-red"><a href="log_in.jsp">Log in here</a>
                                        <div class="scroll-to-section"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <div class="item">
                                    <h3>Have you not joined us yet?</h3>
                                    <p>Welcome to EVENTRA, the premier destination for seamless event planning! We're thrilled to have you
                                        here. If you haven't joined us yet, you're in for a treat!</p>
                                    <div class="main-button-yellow"><a href="registration-new.jsp">register in here</a>
                                        <div class="scroll-to-section"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="accordions is-first-expanded">
                            <article class="accordion">
                                <div class="accordion-head">
                                    <span>Why Choose Us?</span>
                                    <span class="icon">
                                        <i class="icon fa fa-chevron-right"></i>
                                    </span>
                                </div>
                                <div class="accordion-body">
                                    <div class="content">
                                        <p>When it comes to choosing an event planner for your special occasion, such as weddings, corporate
                                            events, or social gatherings, it's important to select a reliable and competent company. Here are
                                            some compelling reasons why you should choose Eventra as your preferred event planner.</p>
                                    </div>
                                </div>
                            </article>
                            <article class="accordion">
                                <div class="accordion-head">
                                    <span>Excellent Customer Service</span>
                                    <span class="icon">
                                        <i class="icon fa fa-chevron-right"></i>
                                    </span>
                                </div>
                                <div class="accordion-body">
                                    <div class="content">
                                        <p> Eventra places a high emphasis on customer satisfaction. They prioritize open communication,
                                            actively listen to your ideas and concerns, and provide timely updates throughout the planning
                                            process. Their friendly and professional staff are readily available to address any queries or
                                            issues, ensuring a positive and enjoyable client experience.</p>
                                    </div>
                                </div>
                            </article>
                            <article class="accordion">
                                <div class="accordion-head">
                                    <span>Budget-Friendly Solutions</span>
                                    <span class="icon">
                                        <i class="icon fa fa-chevron-right"></i>
                                    </span>
                                </div>
                                <div class="accordion-body">
                                    <div class="content">
                                        <p>Planning an event within a budget can be challenging. Eventra understands this and strives to
                                            provide cost-effective solutions without compromising on quality. Their expertise in budget
                                            management allows them to allocate funds efficiently, helping you achieve a remarkable event within
                                            your financial constraints.</p>
                                    </div>
                                </div>
                            </article>
                            <article class="accordion last-accordion">
                                <div class="accordion-head">
                                    <span>Extensive Network</span>
                                    <span class="icon">
                                        <i class="icon fa fa-chevron-right"></i>
                                    </span>
                                </div>
                                <div class="accordion-body">
                                    <div class="content">
                                        <p>Eventra has established a vast network of trusted vendors, suppliers, and venues. Leveraging these
                                            strong relationships, they can negotiate competitive prices, secure exclusive deals, and access
                                            premium resources. This network ensures that you receive top-quality services and products while
                                            maximizing your budget.</p>
                                    </div>
                                </div>
                            </article>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="our-courses" id="courses">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-heading">
                            <h2>Our Popular Vendors in this week</h2>
                        </div>
                    </div>
                    <div class="col-lg-12">
                        <div class="owl-courses-item owl-carousel">
                            <div class="item">
                                <img src="https://www.designhill.com/resize_img.php?atyp=page_file&pth=ft_ca_ct||128||contestfile_3&flp=1553590190-21304310735c99e7ae995806-08051329.jpg" alt="" style="height: 190px;">
                                <div class="down-content">
                                    <h4>LEA LEE<br>(Photography partner)</h4>
                                    <div class="info">
                                        <div class="row">
                                            <div class="col-8">
                                                <ul>
                                                    <li><i class="fa fa-star"></i></li>
                                                    <li><i class="fa fa-star"></i></li>
                                                    <li><i class="fa fa-star"></i></li>
                                                    <li><i class="fa fa-star"></i></li>
                                                    <li><i class="fa fa-star"></i></li>
                                                </ul>
                                            </div>
                                            <!-- <div class="col-4">
                                              <span>$160</span>
                                            </div> -->
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="item">
                                <img src="https://thumbs.dreamstime.com/b/monochrome-bridal-boutique-logo-wedding-dresses-sign-icon-mannequin-fashion-beautiful-bride-vector-design-template-145167671.jpg" alt="" style="height: 190px;">
                                <div class="down-content">
                                    <h4>BRIDAL BOUQUET<br>(Bouquet partner)</h4>
                                    <div class="info">
                                        <div class="row">
                                            <div class="col-8">
                                                <ul>
                                                    <li><i class="fa fa-star"></i></li>
                                                    <li><i class="fa fa-star"></i></li>
                                                    <li><i class="fa fa-star"></i></li>
                                                    <li><i class="fa fa-star"></i></li>
                                                    <li><i class="fa fa-star"></i></li>
                                                </ul>
                                            </div>
                                            <!-- <div class="col-4">
                                              <span>$180</span>
                                            </div> -->
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="item">
                                <img src="data:image/png;base64,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" alt="" style="height: 190px;">
                                <div class="down-content">
                                    <h4>SOLO MUSIC<br>(Music partner)</h4>
                                    <div class="info">
                                        <div class="row">
                                            <div class="col-8">
                                                <ul>
                                                    <li><i class="fa fa-star"></i></li>
                                                    <li><i class="fa fa-star"></i></li>
                                                    <li><i class="fa fa-star"></i></li>
                                                    <li><i class="fa fa-star"></i></li>
                                                    <li><i class="fa fa-star"></i></li>
                                                </ul>
                                            </div>
                                            <!-- <div class="col-4">
                                              <span>$140</span>
                                            </div> -->
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="item">
                                <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRTf6ndqbIs49PPXLRdwh13jWLwp2WMAANleA&usqp=CAU" alt="" style="height: 190px;">
                                <div class="down-content">
                                    <h4>BEAUTY SALON<br>(Salon partner)</h4>
                                    <div class="info">
                                        <div class="row">
                                            <div class="col-8">
                                                <ul>
                                                    <li><i class="fa fa-star"></i></li>
                                                    <li><i class="fa fa-star"></i></li>
                                                    <li><i class="fa fa-star"></i></li>
                                                    <li><i class="fa fa-star"></i></li>
                                                    <li><i class="fa fa-star"></i></li>
                                                </ul>
                                            </div>
                                            <!-- <div class="col-4">
                                              <span>$120</span>
                                            </div> -->
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="item">
                                <img src="https://i.etsystatic.com/21279888/r/il/6bd749/3638557802/il_500x500.3638557802_ljvq.jpg" alt="" style="height: 190px;">
                                <div class="down-content">
                                    <h4>SUSAN WHITE<br>(Bonquet partner)</h4>
                                    <div class="info">
                                        <div class="row">
                                            <div class="col-8">
                                                <ul>
                                                    <li><i class="fa fa-star"></i></li>
                                                    <li><i class="fa fa-star"></i></li>
                                                    <li><i class="fa fa-star"></i></li>
                                                    <li><i class="fa fa-star"></i></li>
                                                    <li><i class="fa fa-star"></i></li>
                                                </ul>
                                            </div>
                                            <!-- <div class="col-4">
                                              <span>$250</span>
                                            </div> -->
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="item">
                                <img src="https://i.pinimg.com/originals/18/ae/30/18ae30cc993cc26510fafb3407de0f9d.png" alt="" style="height: 190px;">
                                <div class="down-content">
                                    <h4>CUSTOM INTERIORS<br>(Design partner)</h4>
                                    <div class="info">
                                        <div class="row">
                                            <div class="col-8">
                                                <ul>
                                                    <li><i class="fa fa-star"></i></li>
                                                    <li><i class="fa fa-star"></i></li>
                                                    <li><i class="fa fa-star"></i></li>
                                                    <li><i class="fa fa-star"></i></li>
                                                    <li><i class="fa fa-star"></i></li>
                                                </ul>
                                            </div>
                                            <!-- <div class="col-4">
                                              <span>$270</span>
                                            </div> -->
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="our-facts">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="row">
                            <div class="col-lg-12">
                                <h2>A Few Facts About EVENTRA</h2>
                            </div>
                            <div class="col-lg-6">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="count-area-content percentage">
                                            <div class="count-digit">100</div>
                                            <div class="count-title">Succesed Planners</div>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="count-area-content">
                                            <div class="count-digit">250</div>
                                            <div class="count-title">Current Users</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="count-area-content new-students">
                                            <div class="count-digit">40</div>
                                            <div class="count-title">Current Vendors</div>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="count-area-content">
                                            <div class="count-digit">10</div>
                                            <div class="count-title">New Users</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 align-self-center">
                        <div class="video">
                            <a href="https://www.youtube.com/watch?v=eTl2Cxb74r0" target="_blank"><img src="assets/images/play-icon.png"
                                                                                                       alt=""></a>
                        </div>
                    </div>
                </div>
            </div>
        </section>

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

        <!-- Scripts -->
        <!--header section-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
        <!--end of header section-->

        <!-- Bootstrap core JavaScript -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <script src="assets/js/isotope.min.js"></script>
        <script src="assets/js/owl-carousel.js"></script>
        <script src="assets/js/lightbox.js"></script>
        <script src="assets/js/tabs.js"></script>
        <script src="assets/js/video.js"></script>
        <script src="assets/js/slick-slider.js"></script>
        <script src="assets/js/custom.js"></script>
        <script>
            //according to loftblog tut
            $('.nav li:first').addClass('active');

            var showSection = function showSection(section, isAnimate) {
                var
                        direction = section.replace(/#/, ''),
                        reqSection = $('.section').filter('[data-section="' + direction + '"]'),
                        reqSectionPos = reqSection.offset().top - 0;

                if (isAnimate) {
                    $('body, html').animate({
                        scrollTop: reqSectionPos
                    },
                            800);
                } else {
                    $('body, html').scrollTop(reqSectionPos);
                }

            };

            var checkSection = function checkSection() {
                $('.section').each(function () {
                    var
                            $this = $(this),
                            topEdge = $this.offset().top - 80,
                            bottomEdge = topEdge + $this.height(),
                            wScroll = $(window).scrollTop();
                    if (topEdge < wScroll && bottomEdge > wScroll) {
                        var
                                currentId = $this.data('section'),
                                reqLink = $('a').filter('[href*=\\#' + currentId + ']');
                        reqLink.closest('li').addClass('active').
                                siblings().removeClass('active');
                    }
                });
            };

            $('.main-menu, .responsive-menu, .scroll-to-section').on('click', 'a', function (e) {
                e.preventDefault();
                showSection($(this).attr('href'), true);
            });

            $(window).scroll(function () {
                checkSection();
            });
        </script>
    </body>

</body>

</html>