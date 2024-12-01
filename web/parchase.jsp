<%-- 
    Document   : parchase
    Created on : Aug 7, 2023, 3:15:40 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@page import="classes.DbConnector"%>
<%@page import="classes.User"%>
<%@page import="classes.Parchase"%>
<%@page import="classes.Event"%>

<%
    String message = "";
    if (request.getParameter("status") != null) {
        int status = Integer.parseInt(request.getParameter("status"));
        if (status == 1) {
            message = "<p style=color:'black'>You have successfully paid.</p>";
        } else {
            message = "<p style=color:'red'>An error occurred. Please contact again.</p>";
        }
    }
%>
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
        
        
        <!-- body -->
        <main>
            <div class="formb">
                <form action="parchase_contr.jsp" method="POST" class="form" onsubmit="return validateTotalBill()">
                    <h1 class="text-center">Create your event</h1>

                    <%=message%>
                    <!-- Progress bar -->
                    <div class="progressbar">
                        <div class="progress" id="progress"></div>

                        <div
                            class="progress-step progress-step-active"
                            data-title="Event Info"
                            ></div>
                        <div class="progress-step" data-title="Pay"></div>
                    </div>

                    <!-- Steps -->
                    <div class="form-step form-step-active">
                        <div class="input-group">
                            <label for="phone">Event Type</label>
                            <input type="text" name="event" id="event" value="<%= request.getParameter("event")%>" readonly="readonly"/>
                        </div>
                        <div class="input-group">
                            <label for="phone">Category Type</label>
                            <input type="text" name="category" id="category" value="<%= request.getParameter("category")%>" readonly="readonly" />
                        </div>
                        <div class="input-group">
                            <label for="phone">Venue</label>
                            <input type="text" name="venue" id="phone" />
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
<!--                        <div class="input-group">
                            <label for="total">Total bill</label>
                            <input type="text" name="total" id="total" value="" readonly="readonly"/>
                        </div>-->
                        <div class="">
                            <a href="#" class="btn btn-next">Next</a>
                        </div>
                    </div>
                    <div class="form-step">
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

        <!--body-->

        <script>
                    // Function to retrieve URL parameter by name
                    function getQueryParam(name) {
                        const urlParams = new URLSearchParams(window.location.search);
                        return urlParams.get(name);
                    }

                    // Get event type and category type from URL parameters
                    const eventParam = getQueryParam('event');
                    const categoryParam = getQueryParam('category');

                    // Function to retrieve event ID based on event and category values
                    function getEventId() {
                        const event = eventParam;
                        const category = categoryParam;

                        const xhr = new XMLHttpRequest();
                        xhr.onreadystatechange = function () {
                            if (xhr.readyState === 4 && xhr.status === 200) {
                                const eventId = parseInt(xhr.responseText);
                                if (eventId !== -1) {
                                    updateTotalBill(eventId);
                                } else {
                                    // Handle case when event ID is not found
                                    console.error("Event ID not found.");
                                }
                            }
                        };
                        // Use the correct URL for your event_contr.jsp file
                        xhr.open('GET', `event_contr.jsp?event=${event}&category=${category}`, true);
                        xhr.send();
                    }

                    // Function to update total bill based on event ID
                    function updateTotalBill(eventId) {
                        const totalBillInput = document.getElementById('total');

                        // Fetch event price using AJAX
                        const xhr = new XMLHttpRequest();
                        xhr.onreadystatechange = function () {
                            if (xhr.readyState === 4 && xhr.status === 200) {
                                const eventPrice = xhr.responseText;
                                totalBillInput.value = eventPrice;
                            }
                        };
                        xhr.open('GET', `get_event_price.jsp?eventId=${eventId}`, true);
                        xhr.send();
                    }

                    function validateTotalBill() {
                        const totalBillInput = document.getElementById('total');
                        if (totalBillInput.value === "") {
                            alert("Please wait for the total bill to be calculated.");
                            return false; // Prevent form submission
                        }
                        return true; // Allow form submission
                    }

                    // When the Next button is clicked
                    const nextButton = document.querySelector('.btn-next');
                    if (nextButton) {
                        nextButton.addEventListener('click', function (event) {
                            event.preventDefault();
                            getEventId();
                        });
                    }
        </script>


        <!--        <script>
                    document.addEventListener("DOMContentLoaded", function () {
                        const eventPriceInput = document.getElementById("eventPrice");
                        const totalInput = document.getElementById("total");
        
                        // Retrieve the eventPrice value from the hidden input field
                        const eventPrice = eventPriceInput.value;
        
                        // Set the eventPrice value in the total input field
                        totalInput.value = eventPrice;
                    });
                </script>-->

        <!--        <script>
                    function updateTotalBill(eventId) {
                        const totalBillInput = document.getElementById('total');
                        const eventPriceInput = document.getElementById('eventPrice');
        
                        // Fetch event price using AJAX and update the total bill
                        const xhr = new XMLHttpRequest();
                        xhr.onreadystatechange = function () {
                            if (xhr.readyState === 4 && xhr.status === 200) {
                                const eventPrice = xhr.responseText;
                                totalBillInput.value = eventPrice;
                                eventPriceInput.value = eventPrice;
                            }
                        };
                        xhr.open('GET', `event_contr.jsp?eventId=${eventId}`, true);
                        xhr.send();
                    }
                    const nextButton = document.querySelector('.btn-next');
                    if (nextButton) {
                        nextButton.addEventListener('click', function (event) {
                            event.preventDefault();
                            const eventId = getEventId(); // Implement this function to get event ID
                            updateTotalBill(eventId);
                            // ... (other code to navigate to the next step)
                        });
                    }
                </script>-->


    </body>
</html>
