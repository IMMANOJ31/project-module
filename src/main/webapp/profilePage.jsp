<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Hidden + Visible Profile Form</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background-color: #f8f9fa; }
        .container { max-width: 600px; margin-top: 40px; }
    </style>
</head>
<body>

<div class="container">
    <h3 class="text-center mb-4">Profile Data</h3>

    <form action="UpdateUserProfile" method="post" enctype="multipart/form-data">

        <!-- 🔹 Hidden Fields (unchanged) -->
        <input type="hidden" name="id" value="${dto.id}">
        <input type="hidden" name="firstName" value="${dto.firstName}">
        <input type="hidden" name="lastName" value="${dto.lastName}">
        <input type="hidden" name="email" value="${dto.email}">
        <input type="hidden" name="phone" value="${dto.phone}">
        <input type="hidden" name="dob" value="${dto.dob}">
        <input type="hidden" name="gender" value="${dto.gender}">
        <input type="hidden" name="country" value="${dto.country}">
        <input type="hidden" name="state" value="${dto.state}">
        <input type="hidden" name="city" value="${dto.city}">
        <input type="hidden" name="pincode" value="${dto.pincode}">
        <input type="hidden" name="password" value="${dto.password}">
        <input type="hidden" name="confirmPassword" value="${dto.password}">
        <input type="hidden" name="fileName" value="${dto.fileName}">

        <!-- 🔹 Visible Inputs -->
        <div class="mb-3">
            <label>First Name</label>
            <input type="text" class="form-control" id="visible-firstName" value="${dto.firstName}">
        </div>
        <div class="mb-3">
            <label>Last Name</label>
            <input type="text" class="form-control" id="visible-lastName" value="${dto.lastName}">
        </div>
        <div class="mb-3">
            <label>Email</label>
            <input type="email" class="form-control" id="visible-email" value="${dto.email}">
        </div>
        <div class="mb-3">
            <label>Phone</label>
            <input type="text" class="form-control" id="visible-phone" value="${dto.phone}">
        </div>
        <div class="mb-3">
            <label>Date of Birth</label>
            <input type="text" class="form-control" id="visible-dob" value="${dto.dob}">
        </div>
        <div class="mb-3">
            <label>Gender</label>
            <input type="text" class="form-control" id="visible-gender" value="${dto.gender}">
        </div>
        <div class="mb-3">
            <label>Country</label>
            <input type="text" class="form-control" id="visible-country" value="${dto.country}">
        </div>
        <div class="mb-3">
            <label>State</label>
            <input type="text" class="form-control" id="visible-state" value="${dto.state}">
        </div>
        <div class="mb-3">
            <label>City</label>
            <input type="text" class="form-control" id="visible-city" value="${dto.city}">
        </div>
        <div class="mb-3">
            <label>Pincode</label>
            <input type="text" class="form-control" id="visible-pincode" value="${dto.pincode}">
        </div>
        <div class="mb-3">
            <label>Password</label>
            <input type="text" class="form-control" id="visible-password" value="${dto.password}">
        </div>
        <div class="mb-3">
            <label>File Name</label>
            <input type="text" class="form-control" id="visible-fileName" value="${dto.fileName}">
        </div>

        <button type="submit" class="btn btn-primary w-100">Submit</button>
    </form>
</div>
<footer>
    <div class="footer-content">
        <div class="footer-center">
            &copy; 2025 Apple Showroom | <a href="https://www.apple.com/legal/privacy/en-ww/">Terms & Conditions</a>
        </div>
        <div id="date-time"></div>
    </div>
</footer>


<script>
    function updateDateTime() {
        const now = new Date();
        const options = { day: '2-digit', month: 'short', year: 'numeric', hour: '2-digit', minute: '2-digit', hour12: true };
        document.getElementById('date-time').textContent = now.toLocaleString('en-US', options);
    }
    setInterval(updateDateTime, 1000);
    updateDateTime();
</script>

</body>
</html>
