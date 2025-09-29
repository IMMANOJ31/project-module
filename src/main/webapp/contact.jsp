<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact - Apple Showroom</title>
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
                <li class="nav-item"><a class="nav-link" href="iphone">iPhone</a></li>
                <li class="nav-item"><a class="nav-link active" href="contact">Contact</a></li>
            </ul>
            <a href="useRegister" class="btn btn-primary">Register</a>
        </div>
    </div>
</nav>

<!-- Extra Products Section -->
<div class="container mt-4">
    <h2 class="text-center mb-4">Our Top Picks</h2>
    <div class="row g-4">
        <div class="col-md-3">
            <div class="card shadow">
                <img src="https://rukminim2.flixcart.com/image/416/416/xif0q/computer/o/x/e/-original-imah2thbvcyxcazg.jpeg?q=70&crop=false" alt="MacBook Air M2">
                <div class="card-body text-center">
                    <h6>MacBook Air (M2)</h6>
                    <p>₹1,14,900</p>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card shadow">
                <img src="https://rukminim2.flixcart.com/image/416/416/xif0q/mobile/h/r/e/-original-imaghxeeme2n7hy7.jpeg?q=70&crop=false" alt="iPhone 14 Pro">
                <div class="card-body text-center">
                    <h6>iPhone 14 Pro</h6>
                    <p>₹1,29,900</p>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card shadow">
                <img src="https://rukminim2.flixcart.com/image/416/416/xif0q/computer/c/n/d/-original-imah697n9dharp9z.jpeg?q=70&crop=false" alt="MacBook Pro 14-inch">
                <div class="card-body text-center">
                    <h6>MacBook Pro 14-inch</h6>
                    <p>₹1,99,900</p>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card shadow">
                <img src="https://rukminim2.flixcart.com/image/416/416/ktketu80/mobile/s/l/c/iphone-13-mlpf3hn-a-apple-original-imag6vzz5qvejz8z.jpeg?q=70&crop=false" alt="iPhone 13">
                <div class="card-body text-center">
                    <h6>iPhone 13</h6>
                    <p>₹69,900</p>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Contact Form -->
<div class="container my-5">
    <h2 class="text-center mb-4">Contact Us</h2>
    <form>
        <div class="mb-3">
            <label class="form-label">Name</label>
            <input type="text" class="form-control" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Email</label>
            <input type="email" class="form-control" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Message</label>
            <textarea class="form-control" rows="5" required></textarea>
        </div>
        <button type="submit" class="btn btn-dark w-100">Send</button>
    </form>
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
