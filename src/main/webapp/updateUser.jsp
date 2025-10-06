<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Profile</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            padding-top: 60px;
            padding-bottom: 70px;
            background: url('https://cdn.neow.in/news/images/uploaded/2020/10/1602611387_screenshot_(54).jpg') no-repeat center center fixed;
            background-size: cover;
            background-position: center;
            font-family: Arial, sans-serif;
        }
        .form-container {
            max-width: 700px;
            margin: auto;
            background: rgba(255, 255, 255, 0.9);
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.3);
        }
        h3 {
            color: #333;
            font-weight: bold;
        }
        label {
            color: #333;
            font-weight: 500;
        }
        .form-control {
            background: #f8f9fa;
            color: #333;
            border: 1px solid #ccc;
        }
        .form-control:focus {
            background: #fff;
            color: #333;
            border-color: #60A5FA;
            box-shadow: 0 0 6px rgba(96, 165, 250, 0.6);
        }
        .btn-primary {
            background-color: #60A5FA;
            border: none;
            font-weight: bold;
        }
        .btn-primary:hover {
            background-color: #3B82F6;
        }
        footer {
            position: fixed;
            bottom: 0;
            left: 0;
            width: 100%;
            background: #000;
            color: #fff;
            font-size: 16px;
            padding: 10px 20px;
        }

        .footer-content {
            display: flex;
            justify-content: center; /* Center everything by default */
            align-items: center;
            position: relative;
        }

        .footer-center {
            text-align: center;
            flex-grow: 1;
        }

        #date-time {
            position: absolute;
            right: 20px; /* Sticks to the right edge */
            font-size: 14px;
        }

        footer a:hover {
            text-decoration: underline;
        }
        #date-time {
            font-size: 14px;
            color: #ddd;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container-fluid">
        <a class="navbar-brand d-flex align-items-center" href="#">
            <img src="https://upload.wikimedia.org/wikipedia/commons/f/fa/Apple_logo_black.svg" alt="Apple Logo" width="40" class="me-2">
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
        </div>
    </div>
</nav>

<div class="container mt-4">
    <div class="form-container">
        <h3 class="text-center mb-4">Profile</h3>
        <form action="viewProfile" method="post">
            <div class="mb-3">
                <label>First Name</label>
                <input type="text" name="firstName" class="form-control" placeholder="Enter First Name"
                       onChange="firstNameValidation()" id="fName" value="${dto.firstName}" required>
                <span id="fMsg" style="color:red;"></span>
            </div>

            <div class="mb-3">
                <label>Last Name</label>
                <input type="text" name="lastName" class="form-control" placeholder="Enter Last Name"
                       onChange="lastNameValidation()" id="lName" value="${dto.lastName}" required>
                <span id="lMsg" style="color:red;"></span>
            </div>

            <div class="mb-3">
                <label>Email</label>
                <input type="email" name="email" class="form-control" placeholder="Enter Email"
                       onChange="emailValidation()" id="email" value="${dto.email}" required>
                <span id="emailMsg" style="color:red;"></span>
            </div>

            <div class="mb-3">
                <label>Phone Number</label>
                <input type="tel" name="phone" class="form-control" placeholder="Enter Phone Number"
                       onChange="phoneValidation()" id="phone" value="${dto.phone}" required>
                <span id="phNo" style="color:red;"></span>
            </div>

            <div class="mb-3">
                <label>Date of Birth</label>
                <input type="date" name="dob" class="form-control"
                       onChange="dobValidation()" id="dob" value="${dto.dob}" required>
                <span id="dobMsg" style="color:red;"></span>
            </div>

            <div class="mb-3">
                <label>Gender</label><br>
                <input type="radio" name="gender" value="Male" onChange="genderValidation()"
                       ${dto.gender == 'Male' ? 'checked' : ''} required> Male
                <input type="radio" name="gender" value="Female" class="ms-3" onChange="genderValidation()"
                       ${dto.gender == 'Female' ? 'checked' : ''} required> Female
                <span id="genderMsg" style="color:red;"></span>
            </div>

            <div class="mb-3">
                <label>Country</label>
                <input type="text" name="country" class="form-control" placeholder="Enter Country"
                       onChange="countryValidation()" id="country" value="${dto.country}" required>
                <span id="countryMsg" style="color:red;"></span>
            </div>

            <div class="mb-3">
                <label>State</label>
                <input type="text" name="state" class="form-control" placeholder="Enter State"
                       onChange="stateValidation()" id="state" value="${dto.state}" required>
                <span id="stateMsg" style="color:red;"></span>
            </div>

            <div class="mb-3">
                <label>City</label>
                <input type="text" name="city" class="form-control" placeholder="Enter City"
                       onChange="cityValidation()" id="city" value="${dto.city}" required>
                <span id="cityMsg" style="color:red;"></span>
            </div>

            <div class="mb-3">
                <label>Pincode</label>
                <input type="text" name="pincode" class="form-control" placeholder="Enter Pincode"
                       onChange="pincodeValidation()" id="pincode" value="${dto.pincode}" required>
                <span id="pincodeMsg" style="color:red;"></span>
            </div>

            <div class="mb-3">
                <label>Password</label>
                <input type="password" name="password" class="form-control" placeholder="Enter Password"
                       onChange="passwordValidation()" id="password" value="${dto.password}" required>
                <span id="passwordMsg" style="color:red;"></span>
            </div>
            <div class="mb-3">
            <label>Upload</label>
            <input type="file" name="file" class="form-control" id="file" enctype="multipart/form-data">
             </div>
           <button type="submit" class="btn btn-primary w-100" id="Submitbutton" disabled>Update</button>
        </form>
    </div>
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

        function validateForm() {
            // call each validation function
            let isFirstNameValid = firstNameValidation();
            let isLastNameValid = lastNameValidation();
            let isEmailValid = emailValidation();
            let isPhoneValid = phoneValidation();
            let isDobValid = dobValidation();
            let isGenderValid = genderValidation();
            let isCountryValid = countryValidation();
            let isStateValid = stateValidation();
            let isCityValid = cityValidation();
            let isPincodeValid = pincodeValidation();
            let isPasswordValid = passwordValidation();

            let isFormValid = isFirstNameValid && isLastNameValid && isEmailValid && isPhoneValid &&
                              isDobValid && isGenderValid && isCountryValid && isStateValid &&
                              isCityValid && isPincodeValid && isPasswordValid;

            document.getElementById("Submitbutton").disabled = !isFormValid;
        }

        document.querySelectorAll("input").forEach(input => {
            input.addEventListener("input", validateForm);
            input.addEventListener("change", validateForm);
        });


</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="resource/script/validation.js"></script>
</body>
</html>
