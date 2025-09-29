<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page  isELIgnored="false" %>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>index</title>
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
        padding-top: 80px;
        padding-bottom: 60px;
        background: #1F2937; /* Unique dim background color */
        color: #fff; /* Makes text readable on dark background */
    }
    .form-container {
        background: #2C3E50; /* Dim card background */
        color: #fff;
        border-radius: 12px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.5);
    }
    label {
        color: #f1f1f1;
    }

    .navbar-brand img {
      width: 40px;
      margin-right: 10px;
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
    .card img {
        width: 100%;
        height: 250px; /* keeps cards uniform height */
        object-fit: contain; /* ensures full image is visible */
        border-radius: 10px 10px 0 0;
        background-color: #f5f5f7; /* optional: makes extra space look clean */
    }
    .card {
      border-radius: 10px;
    }
  </style>
</head>
<body>

  <!-- Header -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container-fluid">
      <a class="navbar-brand d-flex align-items-center" href="#">
        <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/1/1b/Apple_logo_grey.svg/758px-Apple_logo_grey.svg.png?20220821122206" alt="Apple Logo">
        Apple
      </a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
        <ul class="navbar-nav me-3">
          <li class="nav-item"><a class="nav-link active" href="index">Home</a></li>
          <li class="nav-item"><a class="nav-link" href="mac">Mac</a></li>
          <li class="nav-item"><a class="nav-link" href="iphone">iPhone</a></li>
          <li class="nav-item"><a class="nav-link" href="contact">Contact</a></li>
        </ul>
        <a href="useRegister" class="btn btn-primary">Register</a><br><br>
        <a href="userLogin" class="btn btn-primary">Login</a>
      </div>
    </div>
  </nav>

  <!-- Main Content -->
  <div class="container mt-4 mb-5">
    <!-- MacBook Series -->
    <h2 class="text-center mb-4">MacBook Series</h2>
    <div class="row g-4">
      <div class="col-md-4">
        <div class="card shadow">
          <img src="https://rukminim2.flixcart.com/image/416/416/xif0q/computer/o/x/e/-original-imah2thbvcyxcazg.jpeg?q=70&crop=false" alt="MacBook Air">
          <div class="card-body">
            <h5 class="card-title">MacBook Air (M2)</h5>
            <p class="card-text">Lightweight, thin, and powerful with the Apple M2 chip for stunning performance and all-day battery life.</p>
          </div>
        </div>
      </div>
      <div class="col-md-4">
        <div class="card shadow">
          <img src="https://rukminim2.flixcart.com/image/416/416/xif0q/computer/c/n/d/-original-imah697n9dharp9z.jpeg?q=70&crop=false" alt="MacBook Pro 14-inch">
          <div class="card-body">
            <h5 class="card-title">MacBook Pro (14-inch)</h5>
            <p class="card-text">Experience pro-level performance with the M2 Pro chip, Liquid Retina XDR display, and exceptional speed.</p>
          </div>
        </div>
      </div>
      <div class="col-md-4">
        <div class="card shadow">
          <img src="https://rukminim2.flixcart.com/image/416/416/xif0q/computer/7/8/4/-original-imahayjpdhdyghzh.jpeg?q=70&crop=false" alt="MacBook Pro 13-inch">
          <div class="card-body">
            <h5 class="card-title">MacBook Pro (13-inch)</h5>
            <p class="card-text">Compact powerhouse featuring the M2 chip, incredible graphics, and a sleek design perfect for portability.</p>
          </div>
        </div>
      </div>
    </div>

    <!-- iPhone Series -->
    <h2 class="text-center mt-5 mb-4">iPhone Series</h2>
    <div class="row g-4">
      <div class="col-md-4">
        <div class="card shadow">
          <img src="https://rukminim2.flixcart.com/image/416/416/xif0q/mobile/h/r/e/-original-imaghxeeme2n7hy7.jpeg?q=70&crop=false" alt="iPhone 14 Pro">
          <div class="card-body">
            <h5 class="card-title">iPhone 14 Pro</h5>
            <p class="card-text">Dynamic Island, A16 Bionic chip, and ProMotion display for the ultimate smartphone experience.</p>
          </div>
        </div>
      </div>
      <div class="col-md-4">
        <div class="card shadow">
          <img src="https://rukminim2.flixcart.com/image/416/416/ktketu80/mobile/s/l/c/iphone-13-mlpf3hn-a-apple-original-imag6vzz5qvejz8z.jpeg?q=70&crop=false" alt="iPhone 13">
          <div class="card-body">
            <h5 class="card-title">iPhone 13</h5>
            <p class="card-text">A15 Bionic chip, Super Retina XDR display, and improved battery life in a stylish design.</p>
          </div>
        </div>
      </div>
      <div class="col-md-4">
        <div class="card shadow">
          <img src="https://rukminim2.flixcart.com/image/416/416/k9loccw0/mobile/6/b/z/apple-iphone-se-mxd12hn-a-original-imafrcqf9nze6evk.jpeg?q=70&crop=false" alt="iPhone SE">
          <div class="card-body">
            <h5 class="card-title">iPhone SE (3rd Gen)</h5>
            <p class="card-text">Compact and affordable with the A15 Bionic chip, great performance, and Touch ID security.</p>
          </div>
        </div>
      </div>
    </div>
  </div>


  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

  <!-- JavaScript for Dynamic Date & Time -->
<!-- Footer -->
<footer>
    <div class="footer-content">
        <div class="footer-center">
            &copy; 2025 Apple Showroom | <a href="https://www.apple.com/legal/privacy/en-ww/">Terms & Conditions</a>
        </div>
        <div id="date-time"></div>
    </div>
</footer>

  <!-- JavaScript for Dynamic Date & Time -->
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
