<%@ page import="lk.sliit.taxibooking.taxibooking.User" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>City Cab Service | Ride in Minutes</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            background-color: #f9f9f9;
        }
        .hero {
            background: url('images/hero-cab.png') no-repeat center center/cover;
            color: white;
            padding: 100px 0;
            text-align: center;
        }
        .hero h1 {
            font-size: 3rem;
            margin-bottom: 20px;
        }
        .hero p {
            font-size: 1.2rem;
            max-width: 600px;
            margin: auto;
            color: white; /* <<< updated color to white */
        }
        .hero-buttons .btn {
            margin: 10px;
        }
        .middle-image {
            text-align: center;
            padding: 60px 0;
            background-color: #fff;
        }
        .middle-image img {
            width: 80%;
            max-width: 700px;
            border-radius: 15px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.1);
        }
    </style>
</head>
<body>
<% User user = (User) session.getAttribute("user"); %>

<header class="navbar">
    <div class="container">
        <div class="logo">
            <i class="fas fa-taxi"></i> City Cab Service
        </div>
        <nav>
            <ul class="nav-links">
                <li><a href="#">Home</a></li>
                <li><a href="#">About</a></li>
                <li><a href="#">Services</a></li>
                <li><a href="#">Contact</a></li>
                <% if (user == null) { %>
                <li><a href="login.jsp">Login</a></li>
                <% } else { %>
                <li><a href="logout">Logout</a></li>
                <% } %>
            </ul>
        </nav>
    </div>
</header>

<section class="hero">
    <div class="container hero-content">
        <h1>Book a ride in seconds</h1>
        <p>Fast, reliable, and affordable taxi service at your fingertips. Available 24/7 throughout the city.</p>
        <% if (user == null) { %>
        <div class="hero-buttons">
            <a href="register.jsp" class="btn primary"><i class="fas fa-user-plus"></i> Sign Up</a>
            <a href="login.jsp" class="btn primary"><i class="fas fa-user-plus"></i> Login</a>
        </div>
        <% } else { %>
        <div class="hero-buttons">
            <a href="booking.jsp" class="btn primary"><i class="fas fa-car"></i> Book a Ride</a>
        </div>
        <% } %>
    </div>
</section>

<section class="features">
    <div class="container">
        <h2>Why Choose Us?</h2>
        <div class="features-grid">
            <div class="feature-card">
                <i class="fas fa-clock feature-icon"></i>
                <h3>Quick Pickup</h3>
                <p>Average wait time of just 5 minutes in city areas</p>
            </div>
            <div class="feature-card">
                <i class="fas fa-dollar-sign feature-icon"></i>
                <h3>Affordable Rates</h3>
                <p>Competitive pricing with no hidden charges</p>
            </div>
            <div class="feature-card">
                <i class="fas fa-shield-alt feature-icon"></i>
                <h3>Safe Rides</h3>
                <p>Verified drivers and 24/7 customer support</p>
            </div>
        </div>
    </div>
</section>

<footer class="footer">
    <div class="container">
        <p>&copy; 2025 City Cab Service. All rights reserved.</p>
    </div>
</footer>

</body>
</html>
