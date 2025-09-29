<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mac - Apple Showroom</title>
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
                <li class="nav-item"><a class="nav-link active" href="mac">Mac</a></li>
                <li class="nav-item"><a class="nav-link" href="iphone">iPhone</a></li>
                <li class="nav-item"><a class="nav-link" href="contact">Contact</a></li>
            </ul>
            <a href="useRegister" class="btn btn-primary">Register</a>
        </div>
    </div>
</nav>

<!-- MacBook Series -->
<div class="container my-5">
    <h2 class="text-center mb-4">Latest MacBooks</h2>
    <div class="row g-4">
        <!-- MacBook Air M2 -->
        <div class="col-md-3">
            <div class="card shadow">
                <img src="https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/macbook-air-m2-midnight-select-202206?wid=640&hei=528&fmt=jpeg&qlt=90&.v=1653493200207" class="card-img-top" alt="MacBook Air M2">
                <div class="card-body text-center">
                    <h5 class="card-title">MacBook Air (M2)</h5>
                    <p class="card-text">₹1,14,900</p>
                    <a href="#" class="btn btn-dark">Buy Now</a>
                </div>
            </div>
        </div>
        <!-- MacBook Pro 13-inch -->
        <div class="col-md-3">
            <div class="card shadow">
                <img src="https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/mbp13touch-silver-select-202005_GEO_IN?wid=640&hei=528&fmt=jpeg&qlt=90&.v=1587460552755" class="card-img-top" alt="MacBook Pro 13-inch">
                <div class="card-body text-center">
                    <h5 class="card-title">MacBook Pro (13-inch)</h5>
                    <p class="card-text">₹1,29,900</p>
                    <a href="#" class="btn btn-dark">Buy Now</a>
                </div>
            </div>
        </div>
        <!-- MacBook Pro 14-inch -->
        <div class="col-md-3">
            <div class="card shadow">
                <img src="https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/mbp14-spacegray-select-202110?wid=640&hei=528&fmt=jpeg&qlt=90&.v=1633657387000" class="card-img-top" alt="MacBook Pro 14-inch">
                <div class="card-body text-center">
                    <h5 class="card-title">MacBook Pro (14-inch)</h5>
                    <p class="card-text">₹1,99,900</p>
                    <a href="#" class="btn btn-dark">Buy Now</a>
                </div>
            </div>
        </div>
        <!-- MacBook Pro 16-inch -->
        <div class="col-md-3">
            <div class="card shadow">
                <img src="https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/mbp16-spacegray-select-202110?wid=640&hei=528&fmt=jpeg&qlt=90&.v=1633657387000" class="card-img-top" alt="MacBook Pro 16-inch">
                <div class="card-body text-center">
                    <h5 class="card-title">MacBook Pro (16-inch)</h5>
                    <p class="card-text">₹2,49,900</p>
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
            &copy; 2025 Apple Showroom | <a href="https://www.apple.com/legal/privacy/en-ww/">Terms & Conditions</a>
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
