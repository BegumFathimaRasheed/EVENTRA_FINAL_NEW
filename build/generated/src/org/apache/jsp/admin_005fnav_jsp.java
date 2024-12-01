package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class admin_005fnav_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/bootstrap.min.css\" />\n");
      out.write("        <link\n");
      out.write("            rel=\"stylesheet\"\n");
      out.write("            href=\"https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css\"\n");
      out.write("            />\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/dataTables.bootstrap5.min.css\" />\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/style.css\" />\n");
      out.write("        <title>Admin Dashboard</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <!-- top navigation bar -->\n");
      out.write("        <nav class=\"navbar navbar-expand-lg navbar-dark bg-dark fixed-top\">\n");
      out.write("            <div class=\"container-fluid\">\n");
      out.write("                <button\n");
      out.write("                    class=\"navbar-toggler\"\n");
      out.write("                    type=\"button\"\n");
      out.write("                    data-bs-toggle=\"offcanvas\"\n");
      out.write("                    data-bs-target=\"#sidebar\"\n");
      out.write("                    aria-controls=\"offcanvasExample\"\n");
      out.write("                    >\n");
      out.write("                    <span class=\"navbar-toggler-icon\" data-bs-target=\"#sidebar\"></span>\n");
      out.write("                </button>\n");
      out.write("                <a\n");
      out.write("                    class=\"navbar-brand me-auto ms-lg-0 ms-3 text-uppercase fw-bold\"\n");
      out.write("                    href=\"#\"\n");
      out.write("                    >Eventra</a\n");
      out.write("                >\n");
      out.write("                <button\n");
      out.write("                    class=\"navbar-toggler\"\n");
      out.write("                    type=\"button\"\n");
      out.write("                    data-bs-toggle=\"collapse\"\n");
      out.write("                    data-bs-target=\"#topNavBar\"\n");
      out.write("                    aria-controls=\"topNavBar\"\n");
      out.write("                    aria-expanded=\"false\"\n");
      out.write("                    aria-label=\"Toggle navigation\"\n");
      out.write("                    >\n");
      out.write("                    <span class=\"navbar-toggler-icon\"></span>\n");
      out.write("                </button>\n");
      out.write("                <div class=\"collapse navbar-collapse\" id=\"topNavBar\">\n");
      out.write("                    <form class=\"d-flex ms-auto my-3 my-lg-0\">\n");
      out.write("                        <div class=\"input-group\">\n");
      out.write("                            <input\n");
      out.write("                                class=\"form-control\"\n");
      out.write("                                type=\"text\"\n");
      out.write("                                placeholder=\"admin name\"\n");
      out.write("                                aria-label=\"admin name\"\n");
      out.write("                                />\n");
      out.write("                            <button class=\"btn btn-primary\" type=\"submit\">\n");
      out.write("                                logout\n");
      out.write("                            </button>\n");
      out.write("                        </div>\n");
      out.write("                    </form>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </nav>\n");
      out.write("        <!-- top navigation bar -->\n");
      out.write("        <!-- offcanvas -->\n");
      out.write("        <div\n");
      out.write("            class=\"offcanvas offcanvas-start sidebar-nav bg-dark\"\n");
      out.write("            tabindex=\"-1\"\n");
      out.write("            id=\"sidebar\"\n");
      out.write("            >\n");
      out.write("            <div class=\"offcanvas-body p-0\">\n");
      out.write("                <nav class=\"navbar-dark\">\n");
      out.write("                    <ul class=\"navbar-nav\">\n");
      out.write("                        <li>\n");
      out.write("                            <a href=\"#\" class=\"nav-link px-3 active\">\n");
      out.write("                                <span class=\"me-2\"><i class=\"bi bi-speedometer2\"></i></span>\n");
      out.write("                                <span>Dashboard</span>\n");
      out.write("                            </a>\n");
      out.write("                        </li>\n");
      out.write("                        <li class=\"my-4\"><hr class=\"dropdown-divider bg-light\" /></li>\n");
      out.write("                        <li>\n");
      out.write("                            <a href=\"#\" class=\"nav-link px-3 active\">\n");
      out.write("                                <span class=\"me-2\"><i class=\"bi bi-speedometer2\"></i></span>\n");
      out.write("                                <span>Events and Blogs</span>\n");
      out.write("                            </a>\n");
      out.write("                        </li>\n");
      out.write("                        <li class=\"my-4\"><hr class=\"dropdown-divider bg-light\" /></li>\n");
      out.write("                        <li>\n");
      out.write("                            <a href=\"#\" class=\"nav-link px-3 active\">\n");
      out.write("                                <span class=\"me-2\"><i class=\"bi bi-speedometer2\"></i></span>\n");
      out.write("                                <span>User Management</span>\n");
      out.write("                            </a>\n");
      out.write("                        </li>\n");
      out.write("                        <li class=\"my-4\"><hr class=\"dropdown-divider bg-light\" /></li>\n");
      out.write("                        <li>\n");
      out.write("                            <a href=\"#\" class=\"nav-link px-3 active\">\n");
      out.write("                                <span class=\"me-2\"><i class=\"bi bi-speedometer2\"></i></span>\n");
      out.write("                                <span>Services</span>\n");
      out.write("                            </a>\n");
      out.write("                        </li>\n");
      out.write("                        <li class=\"my-4\"><hr class=\"dropdown-divider bg-light\" /></li>\n");
      out.write("                    </ul>\n");
      out.write("                </nav>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <!-- offcanvas -->\n");
      out.write("        </div>\n");
      out.write("    </main>\n");
      out.write("    <script src=\"./js/bootstrap.bundle.min.js\"></script>\n");
      out.write("    <script src=\"https://cdn.jsdelivr.net/npm/chart.js@3.0.2/dist/chart.min.js\"></script>\n");
      out.write("    <script src=\"./js/jquery-3.5.1.js\"></script>\n");
      out.write("    <script src=\"./js/jquery.dataTables.min.js\"></script>\n");
      out.write("    <script src=\"./js/dataTables.bootstrap5.min.js\"></script>\n");
      out.write("    <script src=\"./js/script.js\"></script>\n");
      out.write("  </body>\n");
      out.write("\n");
      out.write("    </body>\n");
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
