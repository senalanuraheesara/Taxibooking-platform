<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>City Cab Service - Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/css/styles.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
</head>
<body class="home-page">
<nav class="navbar navbar-expand-lg navbar-dark bg-primary shadow-sm">
    <div class="container">
        <a class="navbar-brand" href="index.jsp">
            <i class="bi bi-car-front-fill me-2"></i>City Cab Service
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link active" href="index.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="about.jsp">About</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="services.jsp">Services</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="contact.jsp">Contact</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="login.jsp">Login</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<main class="container my-5">
    <div class="row align-items-center">
        <div class="col-md-6">
            <h1 class="display-4 fw-bold mb-4">Book a ride in seconds</h1>
            <p class="lead mb-4">Fast, reliable, and affordable taxi service at your fingertips. Available 24/7 throughout the city.</p>
            <div class="d-grid gap-2 d-md-flex">
                <a href="register.jsp" class="btn btn-primary btn-lg px-4 me-md-2">
                    <i class="bi bi-person-plus me-1"></i> Sign Up
                </a>
                <a href="login.jsp" class="btn btn-outline-primary btn-lg px-4">
                    <i class="bi bi-box-arrow-in-right me-1"></i> Login
                </a>
            </div>
        </div>
        <div class="col-md-6">
            <img src="assets/images/taxi-hero.png" alt="Taxi Service" class="img-fluid rounded shadow">
        </div>
    </div>

    <div class="row mt-5">
        <div class="col-12">
            <h2 class="text-center mb-4">Why Choose Us?</h2>
        </div>
        <div class="col-md-4 mb-4">
            <div class="card h-100 shadow-sm">
                <div class="card-body text-center">
                    <i class="bi bi-clock-history display-4 text-primary mb-3"></i>
                    <h3>Quick Pickup</h3>
                    <p>Average wait time of just 5 minutes in city areas</p>
                </div>
            </div>
        </div>
        <div class="col-md-4 mb-4">
            <div class="card h-100 shadow-sm">
                <div class="card-body text-center">
                    <i class="bi bi-currency-dollar display-4 text-primary mb-3"></i>
                    <h3>Affordable Rates</h3>
                    <p>Competitive pricing with no hidden charges</p>
                </div>
            </div>
        </div>
        <div class="col-md-4 mb-4">
            <div class="card h-100 shadow-sm">
                <div class="card-body text-center">
                    <i class="bi bi-shield-check display-4 text-primary mb-3"></i>
                    <h3>Safe Rides</h3>
                    <p>Verified drivers and 24/7 customer support</p>
                </div>
            </div>
        </div>
    </div>
</main>

<footer class="bg-dark text-white py-4 mt-5">
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <h5>City Cab Service</h5>
                <p>Your reliable transportation partner since 2023.</p>
            </div>
            <div class="col-md-4">
                <h5>Quick Links</h5>
                <ul class="list-unstyled">
                    <li><a href="index.jsp" class="text-white">Home</a></li>
                    <li><a href="about.jsp" class="text-white">About Us</a></li>
                    <li><a href="services.jsp" class="text-white">Services</a></li>
                    <li><a href="contact.jsp" class="text-white">Contact</a></li>
                </ul>
            </div>
            <div class="col-md-4">
                <h5>Contact Us</h5>
                <ul class="list-unstyled">
                    <li><i class="bi bi-telephone me-2"></i> +94 76 123 4567</li>
                    <li><i class="bi bi-envelope me-2"></i> info@citycab.lk</li>
                    <li><i class="bi bi-geo-alt me-2"></i> 123 Galle Road, Colombo</li>
                </ul>
            </div>
        </div>
        <hr>
        <div class="text-center">
            <p class="mb-0">&copy; 2023 City Cab Service. All rights reserved.</p>
        </div>
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>