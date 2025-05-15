<%@ page import="lk.sliit.taxibooking.taxibooking.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Driver Dashboard | City Cab Service</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/driverdashboard.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
</head>
<body>
<header class="driver-navbar">
    <div class="logo"><i class="fas fa-car-side"></i> Driver Panel</div>
    <ul class="nav-links">
        <li><a href="driverdashboard.jsp" class="active">Dashboard</a></li>
        <li><a href="driver-rides.jsp">My Rides</a></li>
        <li><a href="driver-availability.jsp">Availability</a></li>
        <li><a href="driver-earnings.jsp">Earnings</a></li>
        <li><a href="profile.jsp">Profile</a></li>
        <li><a href="logout" class="btn secondary-btn">Logout</a></li>
    </ul>
</header>

<main class="dashboard">
    <section class="welcome-section">
        <h2>Welcome, <%= user.getName() %>!</h2>
        <p>Here is your daily overview and quick access to tools.</p>
    </section>

    <section class="dashboard-grid">
        <div class="dashboard-card">
            <i class="fas fa-road"></i>
            <h3>My Rides</h3>
            <p>View and manage assigned and completed rides.</p>
            <a href="driver-rides.jsp">View</a>
        </div>

        <div class="dashboard-card">
            <i class="fas fa-toggle-on"></i>
            <h3>Availability</h3>
            <p>Update your availability status.</p>
            <a href="driver-availability.jsp">Update</a>
        </div>

        <div class="dashboard-card">
            <i class="fas fa-wallet"></i>
            <h3>Earnings</h3>
            <p>Track your daily and monthly earnings.</p>
            <a href="driver-earnings.jsp">Check</a>
        </div>

        <div class="dashboard-card">
            <i class="fas fa-user-circle"></i>
            <h3>My Profile</h3>
            <p>Edit your driver profile information.</p>
            <a href="profile.jsp">Edit</a>
        </div>
    </section>
</main>
</body>
</html>
