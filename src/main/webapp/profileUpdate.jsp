<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Apple Store - Update Profile</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
            margin: 0;
        }

        .navbar-brand img {
            height: 40px;
            margin-right: 8px;
        }

        /* Sticky Footer Styles */
        .content {
            flex: 1;
            padding-top: 70px;
            padding-bottom: 70px;
        }

        .form-container {
            max-width: 700px;
            margin: 30px auto;
            background: rgba(255, 255, 255, 0.95);
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.3);
        }

        .form-label {
            font-weight: 500;
        }

        .form-control {
            background: #f8f9fa;
            border: 1px solid #ccc;
        }

        .form-control:focus {
            background: #fff;
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
            background-color: #000;
            color: #fff;
            padding: 20px 0;
            text-align: center;
            position: fixed;
            bottom: 0;
            width: 100%;
        }

        footer a {
            color: #fff;
        }

        footer a:hover {
            text-decoration: underline;
        }

        #date-time {
            font-size: 14px;
            color: #ddd;
            margin-top: 5px;
        }
    </style>
</head>

<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
        <div class="container">
            <a class="navbar-brand d-flex align-items-center" href="#">
                <img src="https://upload.wikimedia.org/wikipedia/commons/f/fa/Apple_logo_black.svg"
                    alt="Apple Logo">
                Apple Store
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

    <!-- Content -->
    <div class="content">
        <div class="form-container">
            <h3 class="text-center mb-4">Update Profile</h3>

            <form action="updateProfile" method="post" enctype="multipart/form-data">

                <div class="mb-3">
                    <label class="form-label">First Name</label>
                    <input type="text" name="firstName" class="form-control" id="fName"
                        value="${dto.firstName}" placeholder="Enter First Name" onChange="firstNameValidation()" required>
                    <span id="fMsg" style="color:red;"></span>
                </div>

                <div class="mb-3">
                    <label class="form-label">Last Name</label>
                    <input type="text" name="lastName" class="form-control" id="lName"
                        value="${dto.lastName}" placeholder="Enter Last Name" onChange="lastNameValidation()" required>
                    <span id="lMsg" style="color:red;"></span>
                </div>

                <div class="mb-3">
                    <label class="form-label">Email</label>
                    <input type="email" name="email" class="form-control" id="email"
                        value="${dto.email}" placeholder="Enter Email" onChange="emailValidation()" required>
                    <span id="emailMsg" style="color:red;"></span>
                </div>

                <div class="mb-3">
                    <label class="form-label">Phone Number</label>
                    <input type="tel" name="phone" class="form-control" id="phone"
                        value="${dto.phone}" placeholder="Enter Phone Number" onChange="phoneValidation()" required>
                    <span id="phNo" style="color:red;"></span>
                </div>

                <div class="mb-3">
                    <label class="form-label">Date of Birth</label>
                    <input type="date" name="dob" class="form-control" id="dob"
                        value="${dto.dob}" onChange="dobValidation()" required>
                    <span id="dobMsg" style="color:red;"></span>
                </div>

                <div class="mb-3">
                    <label class="form-label">Country</label>
                    <input type="text" name="country" class="form-control" id="country"
                        value="${dto.country}" placeholder="Enter Country" onChange="countryValidation()" required>
                    <span id="countryMsg" style="color:red;"></span>
                </div>

                <div class="mb-3">
                    <label class="form-label">State</label>
                    <input type="text" name="state" class="form-control" id="state"
                        value="${dto.state}" placeholder="Enter State" onChange="stateValidation()" required>
                    <span id="stateMsg" style="color:red;"></span>
                </div>

                <div class="mb-3">
                    <label class="form-label">City</label>
                    <input type="text" name="city" class="form-control" id="city"
                        value="${dto.city}" placeholder="Enter City" onChange="cityValidation()" required>
                    <span id="cityMsg" style="color:red;"></span>
                </div>

                <div class="mb-3">
                    <label class="form-label">Pincode</label>
                    <input type="text" name="pincode" class="form-control" id="pincode"
                        value="${dto.pincode}" placeholder="Enter Pincode" onChange="pincodeValidation()" required>
                    <span id="pincodeMsg" style="color:red;"></span>
                </div>

                <input type="hidden" name="password" id="password" value="${dto.password}" required>

                <div class="mb-3">
                    <label class="form-label">Upload Profile Picture</label>
                    <input type="file" name="file" class="form-control" id="file">
                </div>

                <div class="d-grid gap-2">
                    <button type="submit" class="btn btn-primary" id="Submitbutton">Update</button>
                </div>
            </form>
        </div>
    </div>

    <!-- Footer -->
    <footer>
        &copy; 2025 Apple Showroom | <a href="https://www.apple.com/legal/privacy/en-ww/">Terms & Conditions</a>
        <div id="date-time"></div>
    </footer>

    <!-- Scripts -->
    <script>
        function updateDateTime() {
            const now = new Date();
            const options = {
                day: '2-digit',
                month: 'short',
                year: 'numeric',
                hour: '2-digit',
                minute: '2-digit',
                hour12: true
            };
            document.getElementById('date-time').textContent = now.toLocaleString('en-US', options);
        }
        setInterval(updateDateTime, 1000);
        updateDateTime();

        function validateForm() {
            let isFormValid = firstNameValidation() && lastNameValidation() && emailValidation() &&
                phoneValidation() && dobValidation() && countryValidation() &&
                stateValidation() && cityValidation() && pincodeValidation();
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
