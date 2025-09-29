<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Forgot Password</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: #f5f6fa;
            padding-top: 90px; /* push below navbar */
        }
        .card {
            max-width: 400px;
            margin: 60px auto;
            border-radius: 12px;
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
            <a href="userLogin" class="btn btn-primary">Login</a>
        </div>
    </div>
</nav>

<div class="card p-4 shadow-lg">
    <h4 class="text-center mb-3">Forgot Password?</h4>

    <!-- Send OTP Form -->
    <form action="sendOtp" method="post" id="sendOtpForm">
        <div class="mb-3">
            <label for="email" class="form-label">Enter Email</label>
            <input type="email" class="form-control" id="email" name="email" value="${inputEmail}" required>
        </div>
        <button type="submit" class="btn btn-primary w-100">Send OTP</button>
    </form>

    <hr>

    <!-- Verify OTP Form -->
    <form action="verifyOtp" method="post" id="verifyOtpForm">
        <input type="hidden" id="hiddenEmail" name="email" value="${inputEmail}">
        <div class="mb-3">
            <label for="otp" class="form-label">Enter OTP</label>
            <input type="text" class="form-control" id="otp" name="otp" required>
            <c:if test="${not empty otpError}">
                <span class="text-danger">${otpError}</span>
            </c:if>
        </div>
        <button type="submit" class="btn btn-success w-100">Submit</button>
    </form>
</div>

<!-- Footer -->
<footer>
    <div class="footer-content">
        <div>&copy; 2025 Apple Showroom | <a href="https://www.apple.com/legal/privacy/en-ww/">Terms & Conditions</a></div>
        <div id="date-time"></div>
    </div>
</footer>

<!-- Toast (Popup) -->
<div class="position-fixed bottom-0 end-0 p-3" style="z-index: 1055">
    <div id="otpToast" class="toast align-items-center text-bg-success border-0" role="alert">
        <div class="d-flex">
            <div class="toast-body">
                ✅ OTP has been sent to your email!
            </div>
            <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast"></button>
        </div>
    </div>
</div>

<!-- Scripts -->
<script>
    // attach hidden email to OTP form
    document.getElementById("sendOtpForm").addEventListener("submit", function () {
        var emailValue = document.getElementById("email").value;
        document.getElementById("hiddenEmail").value = emailValue;

        // Show bootstrap toast
        var toast = new bootstrap.Toast(document.getElementById("otpToast"));
        toast.show();
    });

    // live date-time
    function updateDateTime() {
        const now = new Date();
        document.getElementById("date-time").innerText = now.toLocaleString();
    }
    setInterval(updateDateTime, 1000);
    updateDateTime();
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
