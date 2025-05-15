<%@ page import="lk.sliit.taxibooking.taxibooking.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>User Dashboard | City Cab Service</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/dashboard.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
</head>
<body>
<header>
    <div class="navbar">
        <div class="logo"><i class="fas fa-taxi"></i> City Cab Service</div>
        <ul class="nav-links">
            <li><a href="dashboard.jsp" class="active">Dashboard</a></li>
            <li><a href="book-ride.jsp">Book a Ride</a></li>
            <li><a href="ride-history.jsp">My Rides</a></li>
            <li><a href="profile.jsp">Account</a></li>
            <li><a href="logout" class="btn secondary-btn">Logout</a></li>
        </ul>
    </div>
</header>

<main class="dashboard-content">
    <section class="welcome-box">
        <h2>Welcome, <%= user.getName() %>!</h2>
        <p>Manage your rides, view history, and update account settings easily.</p>
        <a href="book-ride.jsp" class="btn-primary"><i class="fas fa-car"></i> Book a New Ride</a>
    </section>

    <section class="quick-links">
        <div class="card">
            <i class="fas fa-car-side"></i>
            <h3>Book a Ride</h3>
            <p>Request a taxi with just a few clicks.</p>
            <a href="book-ride.jsp">Go</a>
        </div>
        <div class="card">
            <i class="fas fa-clock-rotate-left"></i>
            <h3>Ride History</h3>
            <p>Review your past trips and bookings.</p>
            <a href="ride-history.jsp">Go</a>
        </div>
        <div class="card">
            <i class="fas fa-user-cog"></i>
            <h3>Account Settings</h3>
            <p>Edit your profile and change your password.</p>
            <a href="profile.jsp">Go</a>
        </div>
    </section>
</main>
</body>
</html>
