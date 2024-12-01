<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@page import="classes.DbConnector"%>
<%@page import="classes.User"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Category</title>
        <!--Google Font-->
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
        <!--rating-->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <!--Stylesheet-->
        <link rel="stylesheet" href="category.css">
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
                <h3>&mdash; CATEGORY &mdash; </h3>
            </div>
            <div class="event-items">
                <img src="https://content.easyweddings.com/wp-content/uploads/2023/03/Ashleigh-Joshua_Gabbinbar-Homestead_Mitch-Birchall-Studios95.jpg">
                <div class="details">
                    <div class="details-sub">
                        <h5 style="padding-left: 150px;">WEDDING</h5>
                    </div>
                    <p>Let us be your trusted partner in turning your wedding dreams into reality. Chose the best package and let the magic of wedding planning begin! </p>
                    <button onclick="redirectToPackage('WEDDING')">See All Packages</button>
                </div>
            </div>

            <div class="event-items">
                <img src="https://partyallo.com.sg/wp-content/uploads/2022/03/PartyAllo-Kids-Party-Planner-Event-Organizer-1024x683.jpg">
                <div class="details">
                    <div class="details-sub">
                        <h5 style="padding-left: 130px;">BIRTHDAY PARTY</h5>
                    </div>
                    <p>Imagine the smiles on your loved ones' faces as they step into a world of magic and wonder. We are here to turn your vision into a reality, creating an unforgettable birthday celebration that will be cherished for years to come.</p>
                    <button onclick="redirectToPackage('BIRTHDAY')">See All Packages</button>
                </div>
            </div>

            <div class="event-items">
                <img src="https://aliveeventsagency.com.au/wp-content/uploads/2021/09/gala-dinner.jpg">
                <div class="details">
                    <div class="details-sub">
                        <h5 style="padding-left: 155px;">GALA DINNER</h5>
                    </div>
                    <p>Imagine the warm glow of chandeliers casting a soft light on the meticulously arranged floral centerpieces. Picture the tables adorned with elegant linens, fine china, and sparkling glassware.our galas are a celebration of style and refinement.</p>
                    <button onclick="redirectToPackage('GALA')">See All Packages</button>
                </div>
            </div>
            <div class="event-items">
                <img src="https://www.tlc-ltd.co.uk/wp-content/uploads/2016/11/Private-Parties-organisers-Decor-tlc-limited16.11.16.02.jpg" style="height: 295px;">
                <div class="details">
                    <div class="details-sub">
                        <h5 style="padding-left: 130px;">PRIVATE PARTY</h5>
                    </div>
                    <p>Every party is an opportunity to make lasting memories, and we are here to ensure that your event is nothing short of extraordinary. </p>
                    <button onclick="redirectToPackage('PRIVATE')">See All Packages</button>
                </div>
            </div>

            <div class="event-items">
                <img src="https://i.pinimg.com/originals/ce/ef/d4/ceefd4edaf32cd654759df91cddebad0.png">
                <div class="details">
                    <div class="details-sub">
                        <h5 style="padding-left: 115px;">PRODUCT LAUNCHING</h5>
                    </div>
                    <p>Imagine a beautifully designed venue, perfectly tailored to reflect the essence of your product. From sleek and modern spaces to rustic and intimate settings, we ensure that the event environment aligns seamlessly with your brand identity. Through thoughtful staging, lighting, and branding elements, we create an atmosphere that captivates attendees and amplifies your product's impact.</p>
                    <button onclick="redirectToPackage('PRODUCT')">See All Packages</button>
                </div>
            </div>

            <div class="event-items">
                <img src="https://i0.wp.com/www.heyuguys.com/images/2021/05/The-Get-Together.jpg?fit=1500%2C844&ssl=1" style="height: 295px;">
                <div class="details">
                    <div class="details-sub">
                        <h5 style="padding-left: 155px;">GET TOGETHER</h5>
                    </div>
                    <p>Imagine the warm glow of chandeliers casting a soft light on the meticulously arranged floral centerpieces. Picture the tables adorned with elegant linens, fine china, and sparkling glassware.our galas are a celebration of style and refinement.</p>
                    <button onclick="redirectToPackage('GET')">See All Packages</button>
                </div>
            </div>
            <div class="event-items">
                <img src="https://www.theelementsofliving.com/wp-content/uploads/2015/08/Community-Donations.jpg" style="height: 295px;">
                <div class="details">
                    <div class="details-sub">
                        <h5 style="padding-left: 130px;">CHARITY EVENTS</h5>
                    </div>
                    <p>Imagine a beautifully decorated venue, adorned with meaningful elements that reflect the cause you are supporting. From inspiring banners and impactful displays to symbolic colors and uplifting dÃ©cor, we ensure that the event environment resonates with the mission and values of your charity.</p>
                    <button onclick="redirectToPackage('CHARITY')">See All Packages</button>
                </div>
            </div>

            <div class="event-items">
                <img src="https://www.eidasolutions.com/wp-content/uploads/2023/01/ieee-meetings-conferences-events-mce.jpg">
                <div class="details">
                    <div class="details-sub">
                        <h5 style="padding-left: 150px;">CONFERENCE</h5>
                    </div>
                    <p>Imagine a beautifully designed conference venue, where every detail is thoughtfully arranged to create a professional and inviting atmosphere. From stylish stage setups to comfortable seating and state-of-the-art audiovisual equipment, we ensure that the event environment enhances the overall conference experience.</p>
                    <button onclick="redirectToPackage('CONFERENCE')">See All Packages</button>
                </div>
            </div>
            <!--            <div class="event-items">
                            <img src="https://blog.qceventplanning.com/wp-content/uploads/2018/08/party-planner-classes.jpg">
                            <div class="details">
                                <div class="details-sub">
                                    <h5 style="padding-left: 80px;">CUSTOMIZE YOUR OWN EVENT</h5>
                                </div>
                                <p>This is a unique feature offered by Eventra, our event planning website. We understand that every event is special and should reflect your individual style, preferences, and vision. With our "Customize Your Own Event" service, we empower you to personalize every aspect of your event to create a truly unforgettable experience.</p>
                                <button onclick="window.location.href = 'form.jsp'">Create your Package</button>
                            </div>
                        </div>-->
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

        <!--body script-->

        <script>
                        const packageRedirectMap = {
                            'WEDDING': 'wedding.jsp',
                            'BIRTHDAY': 'birthday.jsp',
                            'GALA': 'gala.jsp',
                            'PRIVATE': 'private.jsp',
                            'PRODUCT': 'product.jsp',
                            'GET_TOGETHER': 'get.jsp',
                            'CHARITY': 'charity.jsp',
                            'CONFERENCE': 'conference.jsp'
                        };

                        function redirectToPackage(eventType) {
                            console.log(`Redirecting to ${eventType} package...`);
                            const packagePage = packageRedirectMap[eventType];
                            if (packagePage) {
                                console.log(`Redirect URL: ${packagePage}`);
                                window.location.href = packagePage + '?event=' + eventType;
                            } else {
                                console.log(`No package URL found for ${eventType}`);
                                alert('No packages available for the selected event.');
                            }
                        }
        </script>



    </body>
</html>