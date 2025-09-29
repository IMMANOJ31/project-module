<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>iPhones - Apple Showroom</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            padding-top: 80px;
            padding-bottom: 60px;
            background: #1F2937;
            color: #fff;
        }
        .card img {
            width: 100%;
            height: 250px;
            object-fit: contain;
            background-color: #f5f5f7;
            border-radius: 10px 10px 0 0;
        }
        .card {
            border-radius: 10px;
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
            justify-content: center;
            align-items: center;
            position: relative;
        }
        .footer-center {
            text-align: center;
            flex-grow: 1;
        }
        #date-time {
            position: absolute;
            right: 20px;
            font-size: 14px;
            color: #ddd;
        }
    </style>
</head>
<body>

<!-- Header -->
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
                <li class="nav-item"><a class="nav-link active" href="iphone">iPhone</a></li>
                <li class="nav-item"><a class="nav-link" href="contact">Contact</a></li>
            </ul>
            <a href="useRegister" class="btn btn-primary">Register</a>
        </div>
    </div>
</nav>

<!-- iPhone Series -->
<div class="container my-5">
    <h2 class="text-center mb-4">Latest iPhones</h2>
    <div class="row g-4">
        <!-- iPhone 14 Pro -->
        <div class="col-md-3">
            <div class="card shadow">
                <img src="https://www.apple.com/v/iphone-14-pro/a/images/meta/og__e3qjlgjz1q0y.png" class="card-img-top" alt="iPhone 14 Pro">
                <div class="card-body text-center">
                    <h5 class="card-title">iPhone 14 Pro</h5>
                    <p class="card-text">₹1,29,900</p>
                    <a href="#" class="btn btn-dark">Buy Now</a>
                </div>
            </div>
        </div>
        <!-- iPhone 13 -->
        <div class="col-md-3">
            <div class="card shadow">
                <img src="https://www.apple.com/v/iphone-13/b/images/meta/og__euj5zkzdvyaa_overview.png" class="card-img-top" alt="iPhone 13">
                <div class="card-body text-center">
                    <h5 class="card-title">iPhone 13</h5>
                    <p class="card-text">₹69,900</p>
                    <a href="#" class="btn btn-dark">Buy Now</a>
                </div>
            </div>
        </div>
        <!-- iPhone 14 -->
        <div class="col-md-3">
            <div class="card shadow">
                <img src="https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-14-finish-select-202209-6-1inch-purple_AV1?wid=5120&hei=2880&fmt=p-jpg&qlt=80&.v=1661027785879" class="card-img-top" alt="iPhone 14">
                <div class="card-body text-center">
                    <h5 class="card-title">iPhone 14</h5>
                    <p class="card-text">₹79,900</p>
                    <a href="#" class="btn btn-dark">Buy Now</a>
                </div>
            </div>
        </div>
        <!-- iPhone SE -->
        <div class="col-md-3">
            <div class="card shadow">
                <img src="https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/iphone-se-finish-select-202207-red?wid=5120&hei=2880&fmt=p-jpg&qlt=80&.v=1655316886203" class="card-img-top" alt="iPhone SE">
                <div class="card-body text-center">
                    <h5 class="card-title">iPhone SE (3rd Gen)</h5>
                    <p class="card-text">₹49,900</p>
                    <a href="#" class="btn btn-dark">Buy Now</a>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Footer -->
<footer>
    <div class="footer-content">
        <div class="footer-center">
            &copy; 2025 Apple Showroom | <a href="#">Terms & Conditions</a>
        </div>
        <div id="date-time"></div>
    </div>
</footer>

<!-- Scripts -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
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
</script>

</body>
</html>
