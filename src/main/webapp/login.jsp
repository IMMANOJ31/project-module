<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<style>
    body { background: #f5f6fa; padding-top: 90px; }
    .login-container {
        max-width: 400px;
        margin: 60px auto;
        padding: 25px;
        background: #fff;
        border-radius: 12px;
        box-shadow: 0 0 15px rgba(0,0,0,0.1);
    }
    .forgot-link {
        display: block;
        margin-top: 12px;
        text-align: center;
    }
    footer {
        background: #000;
        color: #fff;
        padding: 10px 20px;
        position: fixed;
        bottom: 0;
        width: 100%;
    }
    footer a {
        color: #0d6efd;
        text-decoration: none;
    }
    .footer-content {
        display: flex;
        justify-content: space-between;
        align-items: center;
    }
</style>
```

</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container-fluid">
        <a class="navbar-brand d-flex align-items-center" href="index">
            <img src="https://upload.wikimedia.org/wikipedia/commons/f/fa/Apple_logo_black.svg"
                 alt="Apple Logo" style="height:24px;margin-right:8px;">
            Apple
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
            <ul class="navbar-nav me-3">
                <li class="nav-item"><a class="nav-link" href="index">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="mac">Mac</a></li>
                <li class="nav-item"><a class="nav-link" href="iphone">iPhone</a></li>
                <li class="nav-item"><a class="nav-link" href="contact">Contact</a></li>
            </ul>
            <a href="useRegister" class="btn btn-primary me-2">Register</a>
        </div>
    </div>
</nav>

<div class="login-container">
    <h3 class="text-center mb-4">Login</h3>
    <form action="loginPage" method="post" onsubmit="return validateBeforeSubmit()">
    <span class="text-danger"> ${nullError}</span>
       <div class="mb-3">
           <label for="username" class="form-label">Email or Phone</label>
           <input type="text" class="form-control" id="emailNPh" name="emailNPh"
                  placeholder="Enter email or phone" value="${email}" onchange="validateEmailOrPhone()">
           <span id="msg" class="text-danger"></span>
       </div>

    <div class="mb-3">

        <label for="password" class="form-label">Password</label>
        <input type="password" class="form-control" id="password" name="password" placeholder="Enter password" required>
    </div>



    <button type="submit" class="btn btn-primary w-100" id="loginBtn">Login</button>
    <a href="forgotPass" class="forgot-link">Forgot Password?</a>
</form>

</div>

<footer>
    <div class="footer-content">
        <div>&copy; 2025 Apple Showroom | <a href="https://www.apple.com/legal/privacy/en-ww/">Terms & Conditions</a></div>
        <div id="date-time"></div>
    </div>
</footer>

<script>
   
    function updateDateTime() {
        const now = new Date();
        document.getElementById("date-time").innerText = now.toLocaleString();
    }
    setInterval(updateDateTime, 1000);
    updateDateTime();

    async function validateEmailOrPhone(){
        const email = document.getElementById("emailNPh").value;
        const regex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        var button = document.getElementById("loginBtn");

        if(email.includes('@')){
            const a = await axios("http://localhost:8080/apple-showroom/loginPage?email=" + email);
            console.log(a.data);

            if(!regex.test(email)){
                document.getElementById("msg").innerHTML="invalid email format";
                button.disabled = true;
            } else if(a.data === "email is used"){
                document.getElementById("msg").innerHTML="";
                button.disabled = false;
            } else {
                document.getElementById("msg").innerHTML="email doesn't exist";
                button.disabled = true;
            }
        } else {
            const b = await axios("http://localhost:8080/apple-showroom/loginPage?phoneNumber=" + email);
            console.log(b.data);

            if(email.length != 10){
                document.getElementById("msg").innerHTML="phone no not exist";
                button.disabled = true;
            } else if(b.data === "phone is used"){
                document.getElementById("msg").innerHTML="";
                button.disabled = false;
            } else {
                document.getElementById("msg").innerHTML="contact no doesn't exist";
                button.disabled = true;
            }
        }
    }
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
