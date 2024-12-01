<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@page import="classes.DbConnector"%>
<%@page import="classes.User"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Package Form</title>
    <!-- head -->
    <link rel="stylesheet" href="index_style.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

    <!--body-->
    <link rel="stylesheet" href="form_style.css" />
    <script src="form_script.js" defer></script>

    <!-- footer -->
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
    <link href="http://fonts.googleapis.com/css?family=Cookie" rel="stylesheet" type="text/css">
   
</head>
<body>
  <!--Header section-->
   <nav class="navbar navbar-expand-lg bg-body-tertiary fixed-top">
            <div class="container-fluid">
                <!--logo-->
                <a class="navbar-brand fs-4" href="index.jsp">img</a>
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

  <!-- body -->
  <main>
    <div class="formb">
     <form action="#" class="form">
      <h1 class="text-center">Create your event</h1>
      <!-- Progress bar -->
      <div class="progressbar">
        <div class="progress" id="progress"></div>
        
        <div
          class="progress-step progress-step-active"
          data-title="Event"
        ></div>
        <div class="progress-step" data-title="Info"></div>
        <div class="progress-step" data-title="Customize"></div>
        <div class="progress-step" data-title="Pay"></div>
      </div>

      <!-- Steps -->
      <div class="form-step form-step-active">
        <div class="input-group">
          <label for="event">Event</label>
          <!-- <input type="text" name="fullname" id="fullname" /> -->
          <div class="event">
            <select id="event">
                <option value="wedding">Wedding</option>
                <option value="bday">Birthday</option>
                <option value="gala">Gala</option>
                <option value="private">Private party</option>
                <option value="product">Product Launching</option>
                <option value="get">Get-Together</option>
                <option value="cahrity">Charity</option>
                <option value="conference">Conference</option>
            </select>
          </div>
        </div>
        <div class="input-group">
          <label for="package">Packages</label>
          <!-- <input type="text" name="email" id="email" /> -->
          <div class="package">
            <select id="package">
                <option value="elite">Elite</option>
                <option value="gold">Gold</option>
                <option value="premier">Premier</option>
                <option value="elegant">Elegant</option>
                <option value="classic">Classic</option>
                <option value="customize">Customize</option>
            </select>
          </div>
        </div>
        <div class="">
          <a href="#" class="btn btn-next width-50 ml-auto">Next</a>
        </div>
      </div>
      <div class="form-step">
        <div class="input-group">
          <label for="phone">Venu</label>
          <input type="text" name="phone" id="phone" />
        </div>
        <div class="input-group">
          <label for="date">Date</label>
          <input type="date" name="date" id="date" />
        </div>
        <div class="input-group">
            <label for="time">Time</label>
            <input type="time" name="time" id="time" />
          </div>
          <div class="input-group">
            <label for="guest">Guest Count</label>
            <input type="text" name="guest" id="guest" />
          </div>
          <div class="input-group">
            <label for="add">Additional Info</label>
            <input type="textarea" name="add" id="add" />
          </div>
        <div class="btns-group">
          <a href="#" class="btn btn-prev">Previous</a>
          <a href="#" class="btn btn-next">Next</a>
        </div>
      </div>
      <div class="form-step">
        <div class="input-group">
          <fieldset>
            <legend class="wed">Food:</legend>
            <div class="single-checkbox">
              <input type="checkbox" id="catering" name="catering" value="Catering" />
              <label for="catering">Catering</label>
            </div>
            <div class="single-checkbox">
              <input type="checkbox" id="wedcake" name="wedcake" value="wedcake" />
              <label for="wedcake">Cake</label>
            </div>
            <div class="single-checkbox">
              <input type="checkbox" id="appetizer" name="appetizer" value="appetizer" />
              <label for="appetizer">Appetizer</label>
            </div>
            <div class="single-checkbox">
              <input type="checkbox" id="desserts" name="desserts" value="desserts" />
              <label for="desserts">Desserts</label>
            </div>
            <div class="single-checkbox">
              <input type="checkbox" id="refreshment" name="refreshment" value="refreshment" />
              <label for="refreshment">Refreshment</label>
            </div>
            <div class="single-checkbox">
              <input type="checkbox" id="champange" name="champange" value="champange" />
              <label for="champange">Champange</label>
            </div>
            <div class="single-checkbox">
              <input type="checkbox" id="bar" name="bar" value="bar" />
              <label for="bar">Barservice</label>
            </div>
          </fieldset>
        </div>
        <div class="input-group">
          <fieldset>
            <legend class="wed">Decoration:</legend>
            <div class="single-checkbox">
              <input type="checkbox" id="venudeco" name="venudeco" value="venudeco" />
              <label for="venudeco">Venu_Deco</label>
            </div>
            <div class="single-checkbox">
              <input type="checkbox" id="invitaion" name="invitaion" value="invitaion" />
              <label for="invitaion">Invitaion</label>
            </div>
            <div class="single-checkbox">
              <input type="checkbox" id="memorabilia" name="memorabilia" value="memorabilia" />
              <label for="memorabilia">Memorabilia</label>
            </div>
            <div class="single-checkbox">
              <input type="checkbox" id="product" name="product" value="product" />
              <label for="product">Product_Display</label>
            </div>
            <div class="single-checkbox">
              <input type="checkbox" id="table" name="table" value="table" />
              <label for="table">Table_&_Chair </label>
            </div>
            <div class="single-checkbox">
              <input type="checkbox" id="theme" name="theme" value="theme" />
              <label for="theme">Theme_Development_&_Decor</label>
            </div>
          </fieldset>
        </div>
        <div class="input-group">
          <fieldset>
            <legend class="wed">Entertainment:</legend>
            <div class="single-checkbox">
              <input type="checkbox" id="media" name="media" value="media" />
              <label for="media">Media</label>
            </div>
            <div class="single-checkbox">
              <input type="checkbox" id="theme" name="theme" value="theme" />
              <label for="theme">Theme_&_branding</label>
            </div>
            <div class="single-checkbox">
              <input type="checkbox" id="sponsorship" name="sponsorship" value="sponsorship" />
              <label for="sponsorship">Sponsorship_&_exhibitor</label>
            </div>
            <div class="single-checkbox">
              <input type="checkbox" id="speaker" name="speaker" value="speaker" />
              <label for="speaker">Speaker</label>
            </div>
            <div class="single-checkbox">
              <input type="checkbox" id="auction" name="auction" value="auction" />
              <label for="auction">Auction_&_prizes</label>
            </div>
            <div class="single-checkbox">
              <input type="checkbox" id="vip" name="vip" value="vip" />
              <label for="vip">Coordinate_vip_services</label>
            </div>
            <div class="single-checkbox">
              <input type="checkbox" id="bands" name="bands" value="bands" />
              <label for="bands">Bands</label>
            </div>
            <div class="single-checkbox">
              <input type="checkbox" id="solo" name="solo" value="solo" />
              <label for="solo">Solo_musicians</label>
            </div>
            <div class="single-checkbox">
              <input type="checkbox" id="DJs" name="DJs" value="DJs" />
              <label for="DJs">DJs</label>
            </div>
            <div class="single-checkbox">
              <input type="checkbox" id="Dance" name="Dance" value="Dance" />
              <label for="Dance">Dance_performance</label>
            </div>
            <div class="single-checkbox">
              <input type="checkbox" id="face" name="face" value="face" />
              <label for="face">Face_painting</label>
            </div>
            <div class="single-checkbox">
              <input type="checkbox" id="tatto" name="tatto" value="tatto" />
              <label for="tatto">Temparary_tatto</label>
            </div>
          </fieldset>
        </div>
        <div class="input-group">
          <fieldset>
            <legend class="wed">Other:</legend>
            <div class="single-checkbox">
              <input type="checkbox" id="eventco" name="venudeco" value="venudeco" />
              <label for="venudeco">Event_coordination</label>
            </div>
            <div class="single-checkbox">
              <input type="checkbox" id="photography" name="photography" value="photography" />
              <label for="photography">photography_&_videography</label>
            </div>
            <div class="single-checkbox">
              <input type="checkbox" id="audiovisual" name="audiovisual" value="audiovisual" />
              <label for="audiovisual">Audiovisual_&_staging</label>
            </div>
            <div class="single-checkbox">
              <input type="checkbox" id="networking" name="networking" value="networking" />
              <label for="networking">Networking/event_technology</label>
            </div>
            <div class="single-checkbox">
              <input type="checkbox" id="staff" name="staff" value="staff" />
              <label for="staff">On_site_staff_&_volunteering</label>
            </div>
            <div class="single-checkbox">
              <input type="checkbox" id="post" name="post" value="post" />
              <label for="post">Post_event_follow_up</label>
            </div>
            <div class="single-checkbox">
              <input type="checkbox" id="surprise" name="surprise" value="surprise" />
              <label for="surprise">Special_surprise</label>
            </div>
          </fieldset>
        </div>
        <div class="btns-group">
          <a href="#" class="btn btn-prev">Previous</a>
          <a href="#" class="btn btn-next">Next</a>
        </div>
      </div>
      <div class="form-step">
        <div class="input-group">
          <label for="total">Total bill</label>
          <input type="text" name="total" id="total" />
        </div>
        <fieldset>
          <legend>Card Details</legend>
          <div class="input-group">
            <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAAACXBIWXMAAAsTAAALEwEAmpwYAAADj0lEQVR4nO1YW0hUQRjet156qdyMMnoJjMgieioKegi6YBFRBJUksWtqQphWKFRqF1MUjUqzRBAJybxl5oOo56zX1NXVvKSta4qb98vuestd849/1p09B3bdBw+4ynzwwzn//DPzf/NfBkYmY2BgYGBg2EjY4q/a7aHgc+VKziRX8uAewpk8FHzBtlvl3i6dlyu5ibV3mHcsCm4SfXRKwHrybuCociUSfI5TAu6VNryzKBhXIOAGDipdCyMgZxHgWQo5xIYpYu+QIohJDoLm/IPQVugDLfkHIOXdNfAMqKCLeAVXwvT8IiAWLEuw714NlGjGwIYzsc3Ebu/dakgu6YfW/mmYnLGAYdYCLX0miMjWipw697IZhDj0oG71Xeh4eCaM1foCqDYRuR4dR8duprTTzQobR4nu19As1aHje0KqoGvQrhMipXRAtFd+w4ho3O9tuzRtNCpXBzCYDkuqzfAqVUH1efX2DS8ltsLOQBWYF5fI/7BhgdiEZnZTm6quKTgfr4GT0Wp4nNMDV5N/0LV87tfSuTYkFvdJQ+DUsybriuNFoCs/TXS7gyth5q81fX6PzsH2AB6OPmoQOYt2T/N6qe59ud6pQwnFfcRmcsYMA+Pz5LusbUIaAjtuq2Bq1kIWne5JIjr/VHv6oJOo83vTRnUZ3B+i843TiE61occIF+I1ovV3BVXCqHGBjKdX6Ek6kvMymaW7iWlxWgxwLLIUChqsm2DY94fVEptoTLVlCAv0eUEvWP6J0yPpWz8dv5Pxk+ox2jF59nUOP6yThkBktpYuqkjrgNnl9PnaZC1elI/VQ9TmclKruBk8aRR1KATWglzJg6bPRP479TPkH+fagJGWhMCJqEa6aPvANP2+InC0Xmtw2QKL1NbIIW68boOzsfbW2TsyB1/UoyT3HUVqVQSwSMdMZtEJ9o/Ng2eA3QYLEIF3A9rjPZBWpiftFvM+8EMnmYPA+wDbbJ6gkzkC1zEpDQEUW97b8KLAWrwo3qE1VI8pYct9R8CL7GJCi6h11msNEJbVTUWtMy4TNZPDkIRAeJa9p2NRogO2MWG3+Vw3THRYK406IzltvKkx9bC3I1lh60RglIR7CckfifguDQF3EhkjoGQRAJZC6/dZhTfInAGf79bcQaUr4T45JYBvj/h8t/ZO8g7FQ8GPb1VwXjKX76MKPgdfwNwnbTgjnrxL5xkYGBgYGGTrDP8B3Ygzc5EqX04AAAAASUVORK5CYII=">
            <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAAACXBIWXMAAAsTAAALEwEAmpwYAAACnUlEQVR4nO2YzWsTQRjGNxRR8VA9+dG01ngoIv4J2Y9m7aGrJtOKePbkxYNgGpM0Hz30qFc/ED2pbRHSXTcqaRT8FwR70UvWJHhQ0VLSg+ArM2lKW91spjM1G5kHnstmhzy/4Z2Zd0eShISEhISE/ieFo68GZWQ/U1BxRUFF8IlXZGQXtAsvRzzDKzH7qw8Cg4u/4YyuAOszDz73giuAz8oG/m77RzsA6AVLLAB6zISZ8QSUdQUcNQhr4X3ENfUoLOkq+W0UWVvHXDRhJpGE8n0dnEII1sr9xE4hRJ7lEynyzq4DZIwU1NQjAGGprevKYUgZmeaYqWmoWUMAb/e2dc06Dpl4ZncANPQc5sYmPINv9q9wAJYyEc/gsM1zty+BNmHzBaANj/3u6hnq8LDuJ7cu8wPAZUMb/g8/2EMNkY5n2QHwgsWLkxkgGgB4QwdQtwZdF3bHAHhHoQ27HB3ZcenANuem0mwAr3WZGuB98jQ3gNK9s2wAn9Rj7OXTMgpQAziFEBtAQ97PDyAiUQM0ygf/PUCj2M+thFZLh9gAHHWAGqD+MMgNoLLIWEK43+FWQtf66BfxXcZFnDdu8gO4Q3+YZVm30UjMhKpCtxP9lPvg86MB5vKpWUPsB1mzlUhTz/aH8yeZAVI3ct1t5jacpa/9xzybOWwtZsPTsUnqdnr5yqkddaIa73a65bQx3dGawB8018/NNsfEs1A1hz2DV83htmXDBaC1sHPjSSjpGlTUIDnsVuUD8FE7QZ4ljDz5ANoyZtIkjRnubfDejk9Y7MpiiDzDuw1+p5P/Zwbwg6VevlaRY/Z3VwB8fdftgIq3510B8N0jvr7z7eyj4hcFvQhKnvejqLiAb8C6HVjZMMky7xleSEhISEhI6jH9Bnm6laI4if4oAAAAAElFTkSuQmCC">
          </div>
          <div class="input-group">
            <label for="own">Card Owner</label>
            <input type="text" name="own" id="own" placeholder="Card Owner Name"/>
          </div>
        <div class="input-group">
          <label for="card">Card Number</label>
          <input type="text" name="card" id="card" placeholder="Card number"/>
        </div>
        <div class="input-group">
          <label for="exp">Expiration Date</label>
          <input type="month" name="exp" id="exp"/>
        </div>
        <div class="input-group">
          <label for="cvv">CVV</label>
          <input type="text" name="cvv" id="cvv" placeholder="CVV"/>
        </div>
      </fieldset>
        <div class="btns-group">
          <a href="#" class="btn btn-prev">Previous</a>
          <input type="submit" value="Pay" class="btn" />
        </div>
      </div>
    </form>
  </div>
  </main>

  <!-- footer -->
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

  <!-- head -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>