<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Admin Management | City Cab Service</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/adminmanagement.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
</head>
<body>
<header>
    <div class="admin-navbar">
        <div class="logo"><i class="fas fa-taxi"></i> Admin Panel</div>
        <ul class="nav-links">
            <li><a href="adminmanagement.jsp" class="active">Dashboard</a></li>
            <li><a href="manage-users.jsp">Users</a></li>
            <li><a href="manage-drivers.jsp">Drivers</a></li>
            <li><a href="manage-rides.jsp">Rides</a></li>
            <li><a href="system-settings.jsp">Settings</a></li>
            <li><a href="logout.jsp">Logout</a></li>
        </ul>
    </div>
</header>

<main class="admin-dashboard">
    <section class="admin-overview">
        <h1>Admin Management Dashboard</h1>
        <p>Manage users, rides, drivers, and platform settings from here.</p>
    </section>

    <section class="admin-actions">
        <div class="admin-card">
            <i class="fas fa-users"></i>
            <h3>Manage Users</h3>
            <p>View, edit, or delete user accounts.</p>
            <a href="manage-users.jsp">Manage</a>
        </div>

        <div class="admin-card">
            <i class="fas fa-id-badge"></i>
            <h3>Manage Drivers</h3>
            <p>Add, update, or deactivate drivers.</p>
            <a href="manage-drivers.jsp">Manage</a>
        </div>

        <div class="admin-card">
            <i class="fas fa-road"></i>
            <h3>Manage Rides</h3>
            <p>Monitor and control ongoing and past rides.</p>
            <a href="manage-rides.jsp">Manage</a>
        </div>

        <div class="admin-card">
            <i class="fas fa-cogs"></i>
            <h3>System Settings</h3>
            <p>Update system-wide configurations and policies.</p>
            <a href="system-settings.jsp">Manage</a>
        </div>
    </section>
</main>
</body>
</html>
