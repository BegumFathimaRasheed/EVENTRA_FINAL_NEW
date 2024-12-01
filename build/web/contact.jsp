<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@page import="classes.DbConnector"%>
<%@page import="classes.User"%>
<%
    String message = "";
    if (request.getParameter("status") != null) {
        int status = Integer.parseInt(request.getParameter("status"));
        if (status == 1) {
            message = "<p style=color:'white'>You have successfully contact us.</p>";
        } else {
            message = "<p style=color:'white'>An error occurred. Please contact again.</p>";
        }
    }
%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Contact us</title>
        <!--head-->
        <link rel="stylesheet" href="index_style.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

        <!--body-->
        <link rel="stylesheet" href="contact.css">

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
                            <li class="nav-item">
                                <a class="nav-link" href="index.jsp">Home</a>
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
                            <li class="nav-item mx-2">
                                <a class="nav-link active" aria-current="page" href="contact.jsp">Contact Us</a>
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

        <!--body-->
        <main>
            <div class="c-container">
                <span class="big-circle"></span>
                <img src="assets\images\shape-blue.png" class="square" alt="" />
                <div class="form">
                    <div class="contact-info">
                        <h3 class="title">Let's get in touch</h3>
                        <p class="text">
                            "Where every occasion becomes an unforgettable experience,
                            let us weave the threads of your dreams into a tapestry of extraordinary events."
                        </p>

                        <div class="info">
                            <div class="information">
                                <!-- <img src="C:\Users\DELL\Downloads\Contact-Form-HTML-CSS-master\Contact-Form\img\contact-map-2.png"
                                    class="icon" alt="" /> -->
                                <img
                                    src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAACXBIWXMAAAsTAAALEwEAmpwYAAABmUlEQVR4nO2VvUoDQRDH72xstLLRwtpXUES76BOIkNkjMhsshBSWsckTxKfQQjHY+dEFX0MUtLAxCqYQZ06ysreet97d5oO7ShwYSGaG/292c/mf5xWIne33RQl8JoH6Jvkc4WOpiOYvcRT0IgUrO1HQq+5540arpaY8T/nperR5LAp0qfMHBHw6UrhWU/NScFMKvkPgBymoXQdeTgDUN4J0EdcQ6Oq79ubcFiHc0NshEKePH22LajYSE/Qcb58G6F4uQAJ1rWMzAncScWpHJ6nyqhFLekaYrpPv3MkHJJs29RXZNTOh/L0tNRMBqrwuBQ2yp6SB7g0FjKrFgYKPMwDgI88VkwJ2QS1IoF4iTj1dKwVQB14z/bAiBX2aDCtO8UkBKOgp3lYK3tepPweBmisFIM3jeGPXGg01na4VAsjs7Inr9yoLoP4B5V2RfgQR+MD2IuOmxrrtWct5xwNos3K6KRjrds4CdUcCbDetB+EmBryCQIdS8GM+NJk1LyhH6D8JAt/qq8n3FOXbMAS+d88WDuUP3fbPxBdtBkvJfmJrzAAAAABJRU5ErkJggg==">
                                <!--<a target="_blank" href="https://icons8.com/icon/42444/map-marker">Map</a> icon by <a target="_blank" href="https://icons8.com">Icons8</a>-->
                                <p>277/C,3 Galle Road,
                                    Colombo
                                </p>
                            </div>
                            <div class="information">
                                <img
                                    src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAACXBIWXMAAAsTAAALEwEAmpwYAAABP0lEQVR4nO1US0rEQBAN4k4R1/7wCiqu3TroTkRJ1SSTrjgLL+AyJ/ADLjyEgiLeQvQKSkbdu8hoVYQWNG00mRjNqLjIg4aGKt579appy6rxb6AgXiKQG0LR/RyF0vHsuJEXQOn0S07pCXMCpgigR6qmgKiHDE8PAb5PircKH1e+S+7b8TKhXL/EBBzlGtR6NKZQDt+yBDltN7tTZcSOE40TyFEaD5+57sN02bKvjBOFshUs6MFsXxDoAR+lbSZXyHceslNITMAHrqtH0yx5WyHHibML35Y509sCniXg88TxkwLeN7vbXNXDCngnL5C4+DBNk2feExHyHiHvvt5FE8jlBsh8hicsWHLv7QeZKMqi++QVFRQS+BBNEMixAjlprXUnrQJUFvgqaoHqEf36Z+fZceOHRELCeLF81hp/hWf1v9Nq3g3MuAAAAABJRU5ErkJggg==">
                                <p>eventracreation@gmail.com</p>
                            </div>
                            <div class="information">
                                <img
                                    src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAACXBIWXMAAAsTAAALEwEAmpwYAAACL0lEQVR4nMWVu4vUcBDHV20ERUQFQYTDQhTxhU+wEHttLFZuM7Nmd2bvBP8ITywEH9icFqIWKjYWCiqCWig+OhErCxXBBz4KDwv3Lt9Zz59MktUtBHcvAadJZhLm85tHvqlU/oc1GRuEcFoZd4Ttcivq7KlUwqxSkivZAWX8EEJb2J4K46OyhSZhX+HkrQgb8+R3R2thSRqj9nIHKKFV/PSMM0qY0mpY9BvKUytyQFwYIIzHwnjYG2vUkpUOEAYVB5C9VbZrvbEmJWtKm4EQvgjbud6Y7sf6DJDsLQxQtnfCdqXrNxmqjFtpi6izuzAgXUvCE78/WA3zlfFTCZ+Ucdz9wgAluyiMzz3+c6+gcOI/CRGn7ajbltw/oQzU62FxKYA4DguFkAjhmPujtWS1EKaFcKpSlgnZDZeHbs+V7JJX0SBsKgUwQrbVhyuMI+67ZPh2KdkHlw2PxXGY24iwbsYCmJ96UihZ5X4rss3C+CZs75ts25Xsara69kYIR119BwLIcHtZtp72sjtgh6TfCWE6S45xZdwWguWwF0p2SKLJof6qqNk2r0IJj3z4HnOYf+nKdqHbHo+5xAvjfgone9Z3JS4P2VbZK2Gs/WflZGd9QfoGdCvx3ivhuxIOE4UFf3tvbCzMFrLXSngwEMBNh8NSJbuey/ZXH+wI245qNczx58xhnp++sOpKZDuFcdP/ejlsIv+tTuT+yRkn7zWvSAiiZOeVcC+7dnaVknxQ+wV1Bnnj3GwHRQAAAABJRU5ErkJggg==">
                                <p>(+94)11-2345678
                                </p>
                            </div>
                        </div>

                        <div class="social-media">
                            <p>Connect with us :</p>
                            <div class="social-icons">
                                <a href="#">
                                    <i class="fab fa-facebook-f"></i>
                                </a>
                                <a href="#">
                                    <i class="fab fa-twitter"></i>
                                </a>
                                <a href="#">
                                    <i class="fab fa-instagram"></i>
                                </a>
                                <a href="#">
                                    <i class="fab fa-linkedin-in"></i>
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="contact-form">
                        <span class="circle one"></span>
                        <span class="circle two"></span>
                        <form action="contact-contr.jsp" autocomplete="off">
                            <h3 class="title">Contact us</h3>
                            <%=message%>
                            <div class="input-container">
                                <input type="text" name="username" class="input" />
                                <label for="">Username</label>
                                <span>Username</span>
                            </div>
                            <div class="input-container">
                                <input type="email" name="email" class="input" />
                                <label for="">Email</label>
                                <span>Email</span>
                            </div>
                            <div class="input-container">
                                <input type="tel" name="phone" class="input" />
                                <label for="">Phone</label>
                                <span>Phone</span>
                            </div>
                            <div class="input-container textarea">
                                <textarea name="message" class="input"></textarea>
                                <label for="">Message</label>
                                <span>Message</span>
                            </div>
                            <input type="submit" value="Send" class="c-btn" />
                        </form>
                    </div>
                </div>
            </div>
        </main>

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

        <!--head-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

        <!--body-->
        <script>
            const inputs = document.querySelectorAll(".input");

            function focusFunc() {
                let parent = this.parentNode;
                parent.classList.add("focus");
            }

            function blurFunc() {
                let parent = this.parentNode;
                if (this.value == "") {
                    parent.classList.remove("focus");
                }
            }

            inputs.forEach((input) => {
                input.addEventListener("focus", focusFunc);
                input.addEventListener("blur", blurFunc);
            });
        </script>

    </body>

</html>