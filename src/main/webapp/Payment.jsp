<%@ page import="lk.sliit.taxibooking.taxibooking.Booking" %>
<%
    Booking booking = (Booking) session.getAttribute("currentBooking");
    if (booking == null) {
        response.sendRedirect("booking.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Payment</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
    <style>
        body {
            background: #f0f8ff;
            font-family: 'Inter', sans-serif;
            margin: 0;
            padding: 0;
        }

        .navbar {
            background: #2563eb;
            color: white;
            padding: 1rem 2rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logo {
            font-size: 24px;
            font-weight: bold;
        }

        nav a {
            color: white;
            text-decoration: none;
            margin-left: 15px;
            font-weight: 500;
        }

        .form-container {
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 60px 20px;
        }

        .form-box {
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            max-width: 500px;
            width: 100%;
        }

        h2 {
            margin-top: 0;
            color: #111827;
        }

        .subtitle {
            color: #6b7280;
            font-size: 14px;
            margin-bottom: 20px;
        }

        .display-field {
            margin-bottom: 15px;
            font-size: 16px;
        }

        .btn-primary {
            background: #22c55e;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 16px;
        }

        .btn-primary:hover {
            background: #16a34a;
        }

        .login-link {
            margin-top: 10px;
            font-size: 14px;
        }

        .login-link a {
            color: #2563eb;
            text-decoration: underline;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<header class="navbar">
    <div class="logo">VehicleRental</div>
    <nav>
        <a href="dashboard.jsp">Dashboard</a>
        <a href="logout.jsp">Logout</a>
    </nav>
</header>

<!-- Payment Summary -->
<div class="form-container">
    <div class="form-box">
        <h2>Confirm Payment</h2>
        <p class="subtitle">Review your booking details before payment</p>

        <div class="display-field">
            <strong>Passenger Name:</strong> <%= booking.getPassengerName() %>
        </div>
        <div class="display-field">
            <strong>Driver Name:</strong> <%= booking.getAssignedDriverName() %>
        </div>
        <div class="display-field">
            <strong>Pickup Location:</strong> <%= booking.getPickupLocation() %>
        </div>
        <div class="display-field">
            <strong>Fare (LKR):</strong> <%= booking.getFare() %>
        </div>

        <!-- Submit to processPayment -->
        <form method="post" action="processPayment">
            <button type="submit" class="btn-primary">Pay Now</button>
        </form>

        <p class="login-link">Having issues? <a href="contact.jsp">Contact support</a></p>
    </div>
</div>

</body>
</html>