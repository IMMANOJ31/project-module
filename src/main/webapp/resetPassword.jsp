<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Reset Password</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: #f5f6fa;
            padding-top: 90px;
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

<!-- Reset Password Card -->
<div class="card p-4 shadow-lg">
    <h4 class="text-center mb-3">Reset Your Password</h4>

    <form action="updatePass" method="post" id="resetPasswordForm">
        <!-- Hidden email passed from previous page -->
        <input type="hidden" name="email" value="${inputEmail}">

        <div class="mb-3">
            <label for="password" class="form-label">New Password</label>
            <input type="password" class="form-control" id="password" name="password" required>
        </div>

        <div class="mb-3">
            <label for="confirmPassword" class="form-label">Confirm Password</label>
            <input type="password" class="form-control" id="confirmPassword" required>
        </div>

        <button type="submit" class="btn btn-success w-100">Update Password</button>
    </form>
</div>

<footer>
    <div class="footer-content">
        <div>&copy; 2025 Apple Showroom | <a href="https://www.apple.com/legal/privacy/en-ww/">Terms & Conditions</a></div>
        <div id="date-time"></div>
    </div>
</footer>

<script>
    // Live date-time in footer
    function updateDateTime() {
        const now = new Date();
        document.getElementById("date-time").innerText = now.toLocaleString();
    }
    setInterval(updateDateTime, 1000);
    updateDateTime();

    // Confirm password validation before submit
    document.getElementById("resetPasswordForm").addEventListener("submit", function (e) {
        const pass = document.getElementById("password").value;
        const confirm = document.getElementById("confirmPassword").value;
        if (pass !== confirm) {
            e.preventDefault();
            alert("Passwords do not match!");
        }
    });
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
