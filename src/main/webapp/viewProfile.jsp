<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Apple Store - Profile Data</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <style>
        body {
            background-color: #f8f9fa;
            height: 100vh;
            margin: 0;
            display: flex;
            flex-direction: column;
        }

        .navbar-brand img {
            height: 40px;
            margin-right: 8px;
        }

        .content {
            flex: 1;
        }

        .form-container {
            max-width: 700px;
            margin: 30px auto;
            background: rgba(255, 255, 255, 0.95);
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.3);
        }

        .btn-primary {
            background-color: #60A5FA;
            border: none;
            font-weight: bold;
        }

        .btn-primary:hover {
            background-color: #3B82F6;
        }

        .btn-danger {
            background-color: #EF4444;
            border: none;
            font-weight: bold;
        }

        .btn-danger:hover {
            background-color: #DC2626;
        }

        footer {
            background-color: #f8f9fa;
            padding: 20px 0;
            text-align: center;
        }
    </style>
</head>

<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm">
        <div class="container">
            <a class="navbar-brand d-flex align-items-center" href="#">
                <img src="https://upload.wikimedia.org/wikipedia/commons/f/fa/Apple_logo_black.svg" alt="Apple Logo">
                Apple Store
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="index">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="mac">Mac</a></li>
                    <li class="nav-item"><a class="nav-link" href="iphone">iPhone</a></li>
                    <li class="nav-item"><a class="nav-link" href="contact">Contact</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Content Area -->
    <div class="content">
        <div class="container">
            <h1 class="mt-4">Profile Information</h1>

            <div class="form-container">
                <form action="profilePage" method="post">

                    <!-- 🔹 Visible Inputs -->
                    <div class="mb-3">
                        <label class="form-label">First Name</label>
                        <input type="text" class="form-control" value="${dto.firstName}" readonly>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Last Name</label>
                        <input type="text" class="form-control" value="${dto.lastName}" readonly>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Email</label>
                        <input type="email" class="form-control" value="${dto.email}" readonly>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Phone</label>
                        <input type="text" class="form-control" value="${dto.phone}" readonly>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Date of Birth</label>
                        <input type="text" class="form-control" value="${dto.dob}" readonly>
                    </div>


                    <div class="mb-3">
                        <label class="form-label">Country</label>
                        <input type="text" class="form-control" value="${dto.country}" readonly>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">State</label>
                        <input type="text" class="form-control" value="${dto.state}" readonly>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">City</label>
                        <input type="text" class="form-control" value="${dto.city}" readonly>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Pincode</label>
                        <input type="text" class="form-control" value="${dto.pincode}" readonly>
                    </div>

                    <!-- 🔹 Hidden Inputs for form submission -->
                    <input type="hidden" name="firstName" value="${dto.firstName}">
                    <input type="hidden" name="lastName" value="${dto.lastName}">

                    <input type="hidden" name="pincode" value="${dto.pincode}">
                    <input type="hidden" name="password" value="${dto.password}">


                    <div class="d-grid gap-2">
                        <button type="submit" formaction="updateProfile" formmethod="post" class="btn btn-danger">Update</button>
                         <button type="submit" formaction="logout" formmethod="post" class="btn btn-danger">Logout</button>
                    </div>

                </form>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer>
        <p>&copy; 2025 Apple Showroom | <a href="https://www.apple.com/legal/privacy/en-ww/">Terms & Conditions</a></p>
        <div id="date-time"></div>
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

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
</body>

</html>
