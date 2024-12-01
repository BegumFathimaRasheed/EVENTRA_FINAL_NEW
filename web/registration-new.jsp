<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String message = "";
    if(request.getParameter("status") != null){
        int status = Integer.parseInt(request.getParameter("status"));
        if(status == 1){
            message = "<p style=color:'blue'>You have successfully registered with Eventra login now.</p>";
        }
        else{
            message = "<p style=color:'red'>An error occurred. Please register again.</p>";
        }
    }
%>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Pangolin&display=swap" rel="stylesheet">
    <title>Registration</title>
    <link href="registration-new-style.css" rel="stylesheet">
</head>

<body>
    <div class="container mt-5">
        <div class="heading">
            <h2>Register</h2>
            <p>Create your account. It's free, only takes few minute</p>
        </div>
        <%=message%>
        <form class="row g-3" action="signIn.jsp" method="POST">
            <div class="col-md-6">
                <label for="inputEmail4" class="form-label"></label>
                <input type="text" class="form-control" id="inputEmail4" name="firstName" placeholder="First Name" required="">
            </div>
            <div class="col-md-6">
                <label for="inputPassword4" class="form-label"></label>
                <input type="text" class="form-control" id="inputPassword4" name="lastName" placeholder="Last Name">
            </div>
            <div class="col-12">
                <label for="inputAddress" class="form-label"></label>
                <input type="text" class="form-control" id="inputAddress" name="address" placeholder="Address">
            </div>
            <div class="col-12">
                <label for="inputAddress2" class="form-label"></label>
                <input type="text" class="form-control" id="inputAddress2" name="phone_no" placeholder="Phone No">
            </div>
            <div class="col-12">
                <label for="inputAddress2" class="form-label"></label>
                <input type="email" class="form-control" id="inputAddress2" name="username" placeholder="Email">
            </div>
            <div class="col-12">
                <label for="inputAddress2" class="form-label"></label>
                <input type="password" class="form-control" id="inputAddress2" name="password" placeholder="Password">
            </div>
            <div class="col-12">
                <label for="inputAddress2" class="form-label"></label>
                <input type="password" class="form-control" id="inputAddress2" name="cpassword" placeholder="Confirm Password">
            </div>
            <div class="col-12">
                <button type="submit" class="btn btn-primary">Submit</button>
            </div>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>

</body>

</html>