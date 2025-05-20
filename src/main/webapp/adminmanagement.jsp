<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Admin Management | City Cab Service</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Tailwind CSS CDN -->
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">

    <style>
        body {
            font-family: 'Poppins', sans-serif;
        }
    </style>
</head>
<body class="bg-gray-100 text-gray-800">

<!-- Navbar -->
<header class="bg-white shadow">
    <div class="container mx-auto flex justify-between items-center px-6 py-4">
        <div class="text-2xl font-semibold text-yellow-600 flex items-center gap-2">
            <i class="fas fa-taxi"></i> Admin Panel
        </div>
        <ul class="flex gap-6 text-sm font-medium">
            <li><a href="adminmanagement.jsp" class="text-blue-600 hover:text-blue-500 border-b-2 border-yellow-600">Dashboard</a></li>
            <li><a href="manage-users.jsp" class="hover:text-blue-500">Users</a></li>
            <li><a href="manage-drivers.jsp" class="hover:text-blue-500">Drivers</a></li>
            <li><a href="manage-rides.jsp" class="hover:text-blue-500">Rides</a></li>
            <li><a href="system-settings.jsp" class="hover:text-blue-500">Settings</a></li>
            <li><a href="logout" class="hover:text-red-500">Logout</a></li>
        </ul>
    </div>
</header>

<!-- Main Dashboard -->
<main class="container mx-auto px-6 py-10">
    <!-- Overview Section -->
    <section class="text-center mb-10">
        <h1 class="text-4xl font-bold text-gray-800 mb-2">Admin Management Dashboard</h1>
        <p class="text-gray-600">Manage users, rides, drivers, and platform settings from here.</p>
    </section>

    <!-- Admin Action Cards -->
    <section class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
        <!-- Card 1 -->
        <div class="bg-white rounded-xl shadow-lg p-6 text-center hover:shadow-2xl transition duration-300">
            <i class="fas fa-users text-4xl text-yellow-500 mb-4"></i>
            <h3 class="text-xl font-semibold mb-2">Manage Users</h3>
            <p class="text-gray-600 mb-4">View, edit, or delete user accounts.</p>
            <a href="manage-users.jsp" class="inline-block bg-blue-500 text-white px-4 py-2 rounded hover:bg-yellow-600">Manage</a>
        </div>

        <!-- Card 2 -->
        <div class="bg-white rounded-xl shadow-lg p-6 text-center hover:shadow-2xl transition duration-300">
            <i class="fas fa-id-badge text-4xl text-yellow-500 mb-4"></i>
            <h3 class="text-xl font-semibold mb-2">Manage Drivers</h3>
            <p class="text-gray-600 mb-4">Add, update, or deactivate drivers.</p>
            <a href="manage-drivers.jsp" class="inline-block bg-yellow-500 text-white px-4 py-2 rounded hover:bg-yellow-600">Manage</a>
        </div>

        <!-- Card 3 -->
        <div class="bg-white rounded-xl shadow-lg p-6 text-center hover:shadow-2xl transition duration-300">
            <i class="fas fa-road text-4xl text-yellow-500 mb-4"></i>
            <h3 class="text-xl font-semibold mb-2">Manage Rides</h3>
            <p class="text-gray-600 mb-4">Monitor and control ongoing and past rides.</p>
            <a href="manage-rides.jsp" class="inline-block bg-yellow-500 text-white px-4 py-2 rounded hover:bg-yellow-600">Manage</a>
        </div>

        <!-- Card 4 -->
        <div class="bg-white rounded-xl shadow-lg p-6 text-center hover:shadow-2xl transition duration-300">
            <i class="fas fa-cogs text-4xl text-blue-500 mb-4"></i>
            <h3 class="text-xl font-semibold mb-2">System Settings</h3>
            <p class="text-gray-600 mb-4">Update system-wide configurations and policies.</p>
            <a href="system-settings.jsp" class="inline-block bg-yellow-500 text-white px-4 py-2 rounded hover:bg-yellow-600">Manage</a>
        </div>
    </section>
</main>

</body>
</html>