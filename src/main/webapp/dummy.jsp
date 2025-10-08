<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Apple Showroom</title>

    <!-- ✅ Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            padding-top: 70px; /* prevent navbar overlap */
            font-family: Arial, sans-serif;
        }

        /* Navbar customization */
        .navbar-brand {
            font-weight: bold;
            font-size: 20px;
        }

        .navbar-nav .nav-link.active {
            color: #60A5FA !important; /* highlight active link */
        }

        /* Footer styling */
        footer {
            background: #000;
            color: #fff;
            font-size: 14px;
            padding: 12px 20px;
            position: fixed;
            bottom: 0;
            width: 100%;
        }

        .footer-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        footer a {
            color: #60A5FA;
            text-decoration: none;
        }

        footer a:hover {
            text-decoration: underline;
        }

        #date-time {
            font-size: 13px;
            color: #ccc;
        }

        /* Profile Icon */
        .profile-icon {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            object-fit: cover;
            border: 2px solid #fff;
            cursor: pointer;
            transition: transform 0.2s;
        }

        .profile-icon:hover {
            transform: scale(1.1);
        }
    </style>
</head>
<body>

<!-- ✅ Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container-fluid">
        <a class="navbar-brand d-flex align-items-center" href="#">
            <img src="https://upload.wikimedia.org/wikipedia/commons/f/fa/Apple_logo_black.svg"
                 alt="Apple Logo" width="40" class="me-2">
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
            <a href="profilePage">
                <img src="img src=displayImage?email=${dto.email}" alt="Profile" class="profile-icon">
            </a>
        </div>
    </div>
</nav>

<footer>
    <div class="footer-content">
        <div>&copy; 2025 Apple Showroom | <a href="#">Terms & Conditions</a></div>
        <div id="date-time"></div>
    </div>
</footer>

<!-- ✅ Date & Time Script -->
<script>
    function updateDateTime() {
        const now = new Date();
        const options = { day: '2-digit', month: 'short', year: 'numeric', hour: '2-digit', minute: '2-digit', hour12: true };
        document.getElementById('date-time').textContent = now.toLocaleString('en-US', options);
    }
    setInterval(updateDateTime, 1000);
    updateDateTime();
</script>

<!-- ✅ Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
