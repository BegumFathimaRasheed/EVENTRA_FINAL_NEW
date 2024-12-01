<%
    String message = "";
    if(request.getParameter("status") != null){
        int status = Integer.parseInt(request.getParameter("status"));
        if(status == 0){
            message = "<p class='text-danger'>Incorrect username or password.</p>";
        }
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="login_style.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@700&family=Pangolin&family=Roboto:wght@500;700&display=swap" rel="stylesheet">
    </head>
    <body>
        <div class="wrapper">
            <div class="login">
                <h2>Login</h2>
                <%=message%>
                <form action="signUp.jsp" method="POST">
                    <div class="input-box">
                        <span class="icon"><ion-icon name="mail-open-outline"></ion-icon></span>
                        <input type="text" name="username" required>
                        <label>Email</label>
                    </div>
                    <div class="input-box">
                        <span class="icon"><ion-icon name="lock-closed-outline"></ion-icon></span>
                        <input type="password" name="password" required>
                        <label>Password</label>
                    </div>
                    <div class="remember-forget">
                        <label><input type="checkbox">Remember me</label>
                    </div>
                    <button type="submit" class="btn">Log in</button>
                    <div class="login-register">
                        <p>Don't have an account ?<a href="registration-new.jsp" class="register-link">Register</a></p>
                    </div>
                </form>
            </div>
        </div>
        
        <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
    </body>
</html>
