package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import javax.servlet.http.HttpSession;
import classes.DbConnector;
import classes.User;

public final class parchase_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("<head>\n");
      out.write("    <meta charset=\"UTF-8\">\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("    <title>Package Form</title>\n");
      out.write("    <!-- head -->\n");
      out.write("    <link rel=\"stylesheet\" href=\"index_style.css\">\n");
      out.write("        <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css\" rel=\"stylesheet\" integrity=\"sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9\" crossorigin=\"anonymous\">\n");
      out.write("\n");
      out.write("    <!--body-->\n");
      out.write("    <link rel=\"stylesheet\" href=\"form_style.css\" />\n");
      out.write("    <script src=\"form_script.js\" defer></script>\n");
      out.write("\n");
      out.write("    <!-- footer -->\n");
      out.write("    <link rel=\"stylesheet\" href=\"http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css\">\n");
      out.write("    <link href=\"http://fonts.googleapis.com/css?family=Cookie\" rel=\"stylesheet\" type=\"text/css\">\n");
      out.write("   \n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("  <!--Header section-->\n");
      out.write("    <nav class=\"navbar navbar-expand-lg bg-body-tertiary fixed-top\">\n");
      out.write("            <div class=\"container-fluid\">\n");
      out.write("                <!--logo-->\n");
      out.write("                <a class=\"navbar-brand fs-4\" href=\"index.jsp\">img</a>\n");
      out.write("                <!--toggle-->\n");
      out.write("                <button class=\"navbar-toggler shadow-none border-0\" type=\"button\" data-bs-toggle=\"offcanvas\" data-bs-target=\"#offcanvasNavbar\" aria-controls=\"offcanvasNavbar\" aria-label=\"Toggle navigation\">\n");
      out.write("                    <span class=\"navbar-toggler-icon\"></span>\n");
      out.write("                </button>\n");
      out.write("                <!--sidebar-->\n");
      out.write("                <div class=\"sidebar offcanvas offcanvas-end\" tabindex=\"-1\" id=\"offcanvasNavbar\" aria-labelledby=\"offcanvasNavbarLabel\">\n");
      out.write("                    <!--slidebar header-->\n");
      out.write("                    <div class=\"offcanvas-header text-blue border-bottom\">\n");
      out.write("                        <h5 class=\"offcanvas-title\" id=\"offcanvasNavbarLabel\"><img src=\"assets\\images\\logo.png\" alt=\"logo\" height=\"120px\" width=\"120px\"></h5>\n");
      out.write("                        <button type=\"button\" class=\"btn-close btn-close-blue\" data-bs-dismiss=\"offcanvas\" aria-label=\"Close\"></button>\n");
      out.write("                    </div>\n");
      out.write("                    <!--slidebar body-->\n");
      out.write("                    <div class=\"offcanvas-body flex-column flex-lg-row p-lg-0\">\n");
      out.write("                        <ul class=\"navbar-nav justify-content-center align-items-center flex-grow-1 pe-3\">\n");
      out.write("                            <li class=\"nav-item mx-2\">\n");
      out.write("                                <a class=\"nav-link active\" aria-current=\"page\" href=\"index.jsp\">Home</a>\n");
      out.write("                            </li>\n");
      out.write("                            <li class=\"nav-item\">\n");
      out.write("                                <a class=\"nav-link\" href=\"aboutUs.jsp\">About</a>\n");
      out.write("                            </li>\n");
      out.write("                            <li class=\"nav-item\">\n");
      out.write("                                <a class=\"nav-link\" href=\"category.jsp\">Event Packages</a>\n");
      out.write("                            </li>\n");
      out.write("                            <li class=\"nav-item\">\n");
      out.write("                                <a class=\"nav-link\" href=\"gallery.jsp\">Gallery</a>\n");
      out.write("                            </li>\n");
      out.write("                            <li class=\"nav-item\">\n");
      out.write("                                <a class=\"nav-link\" href=\"contact.jsp\">Contact Us</a>\n");
      out.write("                            </li>\n");
      out.write("                        </ul>\n");
      out.write("                        <!--login-->\n");
      out.write("                        ");

                            if (session != null && session.getAttribute("user") != null) {
                                User user = (User) session.getAttribute("user");
                                String role = user.getRole();

                                if (role.equals("admin")) {
                        
      out.write("\n");
      out.write("                        <!--admin login-->\n");
      out.write("                        <div class=\"d-flex flex-lg-row justify-content-center align-items-center gap-3\">\n");
      out.write("                            <a href=\"admin_panel.jsp\" class=\"text-white text-decoration-none px-3 py-1 rounded-4\" style=\"background-color: blue;\">Admin Panel</a>\n");
      out.write("                        </div>\n");
      out.write("                        ");
 } else {
      out.write("\n");
      out.write("                        <div class=\"d-flex flex-lg-row justify-content-center align-items-center gap-3\">\n");
      out.write("                            <a href=\"log_in.jsp\" class=\"text-white text-decoration-none px-3 py-1 rounded-4\" style=\"background-color: blue;\"><img src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAXklEQVR4nM2SSwqAMAwFZ9WrG+9p4zEiQhciaUkqogNvE8hAPvASBVgBBSogrRZGALvlrIVRR7BnBNURbE9HWDKC0iR1donfUC63t06G48igMfQTmhC4P2HJ/FAwxQFkTl77KJnvUQAAAABJRU5ErkJggg==\"></a>\n");
      out.write("                            <a href=\"log_in.jsp\" class=\"text-white text-decoration-none px-3 py-1 rounded-4\" style=\"background-color: blue;\">");
      out.print(user.getFirstName() + " " + user.getLarstName());
      out.write("</a>\n");
      out.write("                        </div>\n");
      out.write("                        ");
 }
      out.write("\n");
      out.write("                        <div class=\"d-flex flex-lg-row justify-content-center align-items-center gap-3\">\n");
      out.write("                            <a href=\"signout.jsp\" class=\"text-white text-decoration-none px-3 py-1 rounded-4\" style=\"background-color: blue;\">LOGOUT</a>\n");
      out.write("                        </div>\n");
      out.write("                        ");
 } else { 
      out.write("\n");
      out.write("                        <div class=\"d-flex flex-lg-row justify-content-center align-items-center gap-3\">\n");
      out.write("                            <a href=\"log_in.jsp\" class=\"text-white text-decoration-none px-3 py-1 rounded-4\" style=\"background-color: blue;\">LOGIN</a>\n");
      out.write("                        </div>\n");
      out.write("                        ");
 }
      out.write("\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </nav>\n");
      out.write("\n");
      out.write("  <!-- body -->\n");
      out.write("  <main>\n");
      out.write("    <div class=\"formb\">\n");
      out.write("     <form action=\"#\" class=\"form\">\n");
      out.write("      <h1 class=\"text-center\">Create your event</h1>\n");
      out.write("      <!-- Progress bar -->\n");
      out.write("      <div class=\"progressbar\">\n");
      out.write("        <div class=\"progress\" id=\"progress\"></div>\n");
      out.write("        \n");
      out.write("        <div\n");
      out.write("          class=\"progress-step progress-step-active\"\n");
      out.write("          data-title=\"Event Info\"\n");
      out.write("        ></div>\n");
      out.write("        <div class=\"progress-step\" data-title=\"Pay\"></div>\n");
      out.write("      </div>\n");
      out.write("\n");
      out.write("      <!-- Steps -->\n");
      out.write("      <div class=\"form-step form-step-active\">\n");
      out.write("          <div class=\"input-group\">\n");
      out.write("          <label for=\"phone\">Event Type</label>\n");
      out.write("          <input type=\"text\" name=\"phone\" id=\"phone\" />\n");
      out.write("        </div>\n");
      out.write("        <div class=\"input-group\">\n");
      out.write("          <label for=\"phone\">Venu</label>\n");
      out.write("          <input type=\"text\" name=\"phone\" id=\"phone\" />\n");
      out.write("        </div>\n");
      out.write("        <div class=\"input-group\">\n");
      out.write("          <label for=\"date\">Date</label>\n");
      out.write("          <input type=\"date\" name=\"date\" id=\"date\" />\n");
      out.write("        </div>\n");
      out.write("        <div class=\"input-group\">\n");
      out.write("            <label for=\"time\">Time</label>\n");
      out.write("            <input type=\"time\" name=\"time\" id=\"time\" />\n");
      out.write("          </div>\n");
      out.write("          <div class=\"input-group\">\n");
      out.write("            <label for=\"guest\">Guest Count</label>\n");
      out.write("            <input type=\"text\" name=\"guest\" id=\"guest\" />\n");
      out.write("          </div>\n");
      out.write("          <div class=\"input-group\">\n");
      out.write("            <label for=\"add\">Additional Info</label>\n");
      out.write("            <input type=\"textarea\" name=\"add\" id=\"add\" />\n");
      out.write("          </div>\n");
      out.write("        <div class=\"\">\n");
      out.write("          <a href=\"#\" class=\"btn btn-next\">Next</a>\n");
      out.write("        </div>\n");
      out.write("      </div>\n");
      out.write("      <div class=\"form-step\">\n");
      out.write("        <div class=\"input-group\">\n");
      out.write("          <label for=\"total\">Total bill</label>\n");
      out.write("          <input type=\"text\" name=\"total\" id=\"total\" />\n");
      out.write("        </div>\n");
      out.write("        <fieldset>\n");
      out.write("          <legend>Card Details</legend>\n");
      out.write("          <div class=\"input-group\">\n");
      out.write("            <img src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAAACXBIWXMAAAsTAAALEwEAmpwYAAADj0lEQVR4nO1YW0hUQRjet156qdyMMnoJjMgieioKegi6YBFRBJUksWtqQphWKFRqF1MUjUqzRBAJybxl5oOo56zX1NXVvKSta4qb98vuestd849/1p09B3bdBw+4ynzwwzn//DPzf/NfBkYmY2BgYGBg2EjY4q/a7aHgc+VKziRX8uAewpk8FHzBtlvl3i6dlyu5ibV3mHcsCm4SfXRKwHrybuCociUSfI5TAu6VNryzKBhXIOAGDipdCyMgZxHgWQo5xIYpYu+QIohJDoLm/IPQVugDLfkHIOXdNfAMqKCLeAVXwvT8IiAWLEuw714NlGjGwIYzsc3Ebu/dakgu6YfW/mmYnLGAYdYCLX0miMjWipw697IZhDj0oG71Xeh4eCaM1foCqDYRuR4dR8duprTTzQobR4nu19As1aHje0KqoGvQrhMipXRAtFd+w4ho3O9tuzRtNCpXBzCYDkuqzfAqVUH1efX2DS8ltsLOQBWYF5fI/7BhgdiEZnZTm6quKTgfr4GT0Wp4nNMDV5N/0LV87tfSuTYkFvdJQ+DUsybriuNFoCs/TXS7gyth5q81fX6PzsH2AB6OPmoQOYt2T/N6qe59ud6pQwnFfcRmcsYMA+Pz5LusbUIaAjtuq2Bq1kIWne5JIjr/VHv6oJOo83vTRnUZ3B+i843TiE61occIF+I1ovV3BVXCqHGBjKdX6Ek6kvMymaW7iWlxWgxwLLIUChqsm2DY94fVEptoTLVlCAv0eUEvWP6J0yPpWz8dv5Pxk+ox2jF59nUOP6yThkBktpYuqkjrgNnl9PnaZC1elI/VQ9TmclKruBk8aRR1KATWglzJg6bPRP479TPkH+fagJGWhMCJqEa6aPvANP2+InC0Xmtw2QKL1NbIIW68boOzsfbW2TsyB1/UoyT3HUVqVQSwSMdMZtEJ9o/Ng2eA3QYLEIF3A9rjPZBWpiftFvM+8EMnmYPA+wDbbJ6gkzkC1zEpDQEUW97b8KLAWrwo3qE1VI8pYct9R8CL7GJCi6h11msNEJbVTUWtMy4TNZPDkIRAeJa9p2NRogO2MWG3+Vw3THRYK406IzltvKkx9bC3I1lh60RglIR7CckfifguDQF3EhkjoGQRAJZC6/dZhTfInAGf79bcQaUr4T45JYBvj/h8t/ZO8g7FQ8GPb1VwXjKX76MKPgdfwNwnbTgjnrxL5xkYGBgYGGTrDP8B3Ygzc5EqX04AAAAASUVORK5CYII=\">\n");
      out.write("            <img src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAAACXBIWXMAAAsTAAALEwEAmpwYAAACnUlEQVR4nO2YzWsTQRjGNxRR8VA9+dG01ngoIv4J2Y9m7aGrJtOKePbkxYNgGpM0Hz30qFc/ED2pbRHSXTcqaRT8FwR70UvWJHhQ0VLSg+ArM2lKW91spjM1G5kHnstmhzy/4Z2Zd0eShISEhISE/ieFo68GZWQ/U1BxRUFF8IlXZGQXtAsvRzzDKzH7qw8Cg4u/4YyuAOszDz73giuAz8oG/m77RzsA6AVLLAB6zISZ8QSUdQUcNQhr4X3ENfUoLOkq+W0UWVvHXDRhJpGE8n0dnEII1sr9xE4hRJ7lEynyzq4DZIwU1NQjAGGprevKYUgZmeaYqWmoWUMAb/e2dc06Dpl4ZncANPQc5sYmPINv9q9wAJYyEc/gsM1zty+BNmHzBaANj/3u6hnq8LDuJ7cu8wPAZUMb/g8/2EMNkY5n2QHwgsWLkxkgGgB4QwdQtwZdF3bHAHhHoQ27HB3ZcenANuem0mwAr3WZGuB98jQ3gNK9s2wAn9Rj7OXTMgpQAziFEBtAQ97PDyAiUQM0ygf/PUCj2M+thFZLh9gAHHWAGqD+MMgNoLLIWEK43+FWQtf66BfxXcZFnDdu8gO4Q3+YZVm30UjMhKpCtxP9lPvg86MB5vKpWUPsB1mzlUhTz/aH8yeZAVI3ct1t5jacpa/9xzybOWwtZsPTsUnqdnr5yqkddaIa73a65bQx3dGawB8018/NNsfEs1A1hz2DV83htmXDBaC1sHPjSSjpGlTUIDnsVuUD8FE7QZ4ljDz5ANoyZtIkjRnubfDejk9Y7MpiiDzDuw1+p5P/Zwbwg6VevlaRY/Z3VwB8fdftgIq3510B8N0jvr7z7eyj4hcFvQhKnvejqLiAb8C6HVjZMMky7xleSEhISEhI6jH9Bnm6laI4if4oAAAAAElFTkSuQmCC\">\n");
      out.write("          </div>\n");
      out.write("          <div class=\"input-group\">\n");
      out.write("            <label for=\"own\">Card Owner</label>\n");
      out.write("            <input type=\"text\" name=\"own\" id=\"own\" placeholder=\"Card Owner Name\"/>\n");
      out.write("          </div>\n");
      out.write("        <div class=\"input-group\">\n");
      out.write("          <label for=\"card\">Card Number</label>\n");
      out.write("          <input type=\"text\" name=\"card\" id=\"card\" placeholder=\"Card number\"/>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"input-group\">\n");
      out.write("          <label for=\"exp\">Expiration Date</label>\n");
      out.write("          <input type=\"month\" name=\"exp\" id=\"exp\"/>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"input-group\">\n");
      out.write("          <label for=\"cvv\">CVV</label>\n");
      out.write("          <input type=\"text\" name=\"cvv\" id=\"cvv\" placeholder=\"CVV\"/>\n");
      out.write("        </div>\n");
      out.write("      </fieldset>\n");
      out.write("        <div class=\"btns-group\">\n");
      out.write("          <a href=\"#\" class=\"btn btn-prev\">Previous</a>\n");
      out.write("          <input type=\"submit\" value=\"Pay\" class=\"btn\" />\n");
      out.write("        </div>\n");
      out.write("      </div>\n");
      out.write("    </form>\n");
      out.write("  </div>\n");
      out.write("  </main>\n");
      out.write("\n");
      out.write("  <!-- footer -->\n");
      out.write("<footer class=\"footer-distributed\">\n");
      out.write("\n");
      out.write("        <div class=\"footer-left\">\n");
      out.write("            <h3><span>EVENTRA</span></h3>\n");
      out.write("\n");
      out.write("            <p class=\"footer-links\">\n");
      out.write("              <a href=\"index.jsp\">Home</a>\n");
      out.write("                |\n");
      out.write("                <a href=\"aboutUs.jsp\">About</a>\n");
      out.write("                |\n");
      out.write("                <a href=\"contact.jsp\">Contact</a>\n");
      out.write("          </p>\n");
      out.write("\n");
      out.write("            <p class=\"footer-company-name\">Copyright Â© 2024 <strong>EVENTRA</strong> All rights reserved</p>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        <div class=\"footer-center\">\n");
      out.write("            <div>\n");
      out.write("                <i class=\"fa fa-map-marker\"></i>\n");
      out.write("                <p>277/C,3 Galle Road,\n");
      out.write("                    Colombo</p>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div>\n");
      out.write("                <i class=\"fa fa-phone\"></i>\n");
      out.write("                <p>(+94)11-2345678</p>\n");
      out.write("            </div>\n");
      out.write("            <div>\n");
      out.write("                <i class=\"fa fa-envelope\"></i>\n");
      out.write("                <p><a href=\"\">eventracreation@gmail.com</a></p>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"footer-right\">\n");
      out.write("            <p class=\"footer-company-about\">\n");
      out.write("                <span>Let's chat</span>\n");
      out.write("                Make your dream event a reality with our exceptional event planning services. At Eventra, we specialize\n");
      out.write("                in crafting unforgettable experiences tailored to your unique vision. From elegant weddings and\n");
      out.write("                corporate galas to intimate celebrations and grand milestones, our dedicated team of experts will guide\n");
      out.write("                you through every step of the planning process. Contact us today to start creating memories that will\n");
      out.write("                last a lifetime.\n");
      out.write("            </p>\n");
      out.write("            <div class=\"footer-icons\">\n");
      out.write("                <a href=\"#\"><i class=\"fa fa-facebook\"></i></a>\n");
      out.write("                <a href=\"#\"><i class=\"fa fa-instagram\"></i></a>\n");
      out.write("                <a href=\"#\"><i class=\"fa fa-linkedin\"></i></a>\n");
      out.write("                <a href=\"#\"><i class=\"fa fa-twitter\"></i></a>\n");
      out.write("                <a href=\"#\"><i class=\"fa fa-youtube\"></i></a>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </footer>\n");
      out.write("\n");
      out.write("  <!-- head -->\n");
      out.write("  <script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js\" integrity=\"sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm\" crossorigin=\"anonymous\"></script>\n");
      out.write("</body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
