package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class registration_002dnew_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write('\r');
      out.write('\n');

    String message = "";
    if(request.getParameter("status") != null){
        int status = Integer.parseInt(request.getParameter("status"));
        if(status == 1){
            message = "<p style=color:'blue'>You have successfully registered with Samadhi Bookstore.</p>";
        }
        else{
            message = "<p style=color:'red'>An error occurred. Please register again.</p>";
        }
    }

      out.write("\r\n");
      out.write("<!doctype html>\r\n");
      out.write("<html lang=\"en\">\r\n");
      out.write("\r\n");
      out.write("<head>\r\n");
      out.write("    <meta charset=\"utf-8\">\r\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\r\n");
      out.write("    <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css\" rel=\"stylesheet\"\r\n");
      out.write("        integrity=\"sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC\" crossorigin=\"anonymous\">\r\n");
      out.write("    <link rel=\"preconnect\" href=\"https://fonts.googleapis.com\">\r\n");
      out.write("    <link rel=\"preconnect\" href=\"https://fonts.gstatic.com\" crossorigin>\r\n");
      out.write("    <link href=\"https://fonts.googleapis.com/css2?family=Pangolin&display=swap\" rel=\"stylesheet\">\r\n");
      out.write("    <title>Registration</title>\r\n");
      out.write("    <link href=\"registration-new-style.css\" rel=\"stylesheet\">\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("<body>\r\n");
      out.write("    <div class=\"container mt-5\">\r\n");
      out.write("        <div class=\"heading\">\r\n");
      out.write("            <h2>Register</h2>\r\n");
      out.write("            <p>Create your account. It's free, only takes few minute</p>\r\n");
      out.write("        </div>\r\n");
      out.write("        ");
      out.print(message);
      out.write("\r\n");
      out.write("        <form class=\"row g-3\" action=\"signIn.jsp\" method=\"POST\">\r\n");
      out.write("            <div class=\"col-md-6\">\r\n");
      out.write("                <label for=\"inputEmail4\" class=\"form-label\"></label>\r\n");
      out.write("                <input type=\"text\" class=\"form-control\" id=\"inputEmail4\" name=\"firstName\" placeholder=\"First Name\" required=\"\">\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"col-md-6\">\r\n");
      out.write("                <label for=\"inputPassword4\" class=\"form-label\"></label>\r\n");
      out.write("                <input type=\"text\" class=\"form-control\" id=\"inputPassword4\" name=\"lastName\" placeholder=\"Last Name\">\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"col-12\">\r\n");
      out.write("                <label for=\"inputAddress\" class=\"form-label\"></label>\r\n");
      out.write("                <input type=\"text\" class=\"form-control\" id=\"inputAddress\" name=\"address\" placeholder=\"Address\">\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"col-12\">\r\n");
      out.write("                <label for=\"inputAddress2\" class=\"form-label\"></label>\r\n");
      out.write("                <input type=\"text\" class=\"form-control\" id=\"inputAddress2\" name=\"phone_no\" placeholder=\"Phone No\">\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"col-12\">\r\n");
      out.write("                <label for=\"inputAddress2\" class=\"form-label\"></label>\r\n");
      out.write("                <input type=\"email\" class=\"form-control\" id=\"inputAddress2\" name=\"username\" placeholder=\"Email\">\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"col-12\">\r\n");
      out.write("                <label for=\"inputAddress2\" class=\"form-label\"></label>\r\n");
      out.write("                <input type=\"password\" class=\"form-control\" id=\"inputAddress2\" name=\"password\" placeholder=\"Password\">\r\n");
      out.write("            </div>\r\n");
      out.write("<!--            <div class=\"col-12\">\r\n");
      out.write("                <label for=\"inputAddress2\" class=\"form-label\"></label>\r\n");
      out.write("                <input type=\"password\" class=\"form-control\" id=\"inputAddress2\" placeholder=\"Confirm Password\">\r\n");
      out.write("            </div>-->\r\n");
      out.write("            <div class=\"col-12\">\r\n");
      out.write("                <button type=\"submit\" class=\"btn btn-primary\">Submit</button>\r\n");
      out.write("            </div>\r\n");
      out.write("        </form>\r\n");
      out.write("    </div>\r\n");
      out.write("\r\n");
      out.write("    <script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js\"\r\n");
      out.write("        integrity=\"sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM\"\r\n");
      out.write("        crossorigin=\"anonymous\"></script>\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("\r\n");
      out.write("</html>");
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
