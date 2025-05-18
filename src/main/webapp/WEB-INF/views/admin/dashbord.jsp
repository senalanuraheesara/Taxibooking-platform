<%--
  Created by IntelliJ IDEA.
  User: Irumi Dhananjana
  Date: 5/17/2025
  Time: 12:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body class="bg-gray-100">
<div class="flex">
    <!-- Sidebar -->
    <aside class="w-64 bg-blue-800 text-white p-4 h-screen sticky top-0">
        <h1 class="text-2xl font-bold mb-8">Admin Dashboard</h1>
        <nav>
            <ul class="space-y-2">
                <li><a href="#dashboard" class="block p-2 hover:bg-blue-700 rounded">Dashboard</a></li>
                <li><a href="#user-management" class="block p-2 hover:bg-blue-700 rounded">User Management</a></li>
                <li><a href="#driver-management" class="block p-2 hover:bg-blue-700 rounded">Driver Management</a></li>
                <li><a href="#ride-history" class="block p-2 hover:bg-blue-700 rounded">Ride History</a></li>
                <li><a href="#" class="block p-2 hover:bg-blue-700 rounded">Settings</a></li>
            </ul>
        </nav>
    </aside>

    <!-- Main Content -->
    <main class="flex-1 p-8">
        <header class="mb-8">
            <h1 class="text-3xl font-bold">Welcome Back, Admin</h1>
        </header>

        <!-- Stats Cards -->
        <section id="dashboard" class="mb-12">
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
                <div class="bg-white p-6 rounded-xl shadow-md">
                    <h3 class="text-lg font-semibold">Total Users</h3>
                    <p id="total-users" class="text-2xl text-blue-600">Loading...</p>
                </div>
                <div class="bg-white p-6 rounded-xl shadow-md">
                    <h3 class="text-lg font-semibold">Total Drivers</h3>
                    <p id="total-drivers" class="text-2xl text-green-600">Loading...</p>
                </div>
                <div class="bg-white p-6 rounded-xl shadow-md">
                    <h3 class="text-lg font-semibold">Active Rides</h3>
                    <p id="active-rides" class="text-2xl text-yellow-500">Loading...</p>
                </div>
                <div class="bg-white p-6 rounded-xl shadow-md">
                    <h3 class="text-lg font-semibold">Total Revenue</h3>
                    <p id="total-revenue" class="text-2xl text-red-500">Loading...</p>
                </div>
            </div>
            <canvas id="revenueChart" class="mt-6"></canvas>
        </section>

        <!-- User Management -->
        <section id="user-management" class="mb-12">
            <h2 class="text-2xl font-bold mb-4">User Management</h2>
            <div class="overflow-x-auto">
                <table class="w-full text-left bg-white shadow rounded-lg">
                    <thead class="bg-gray-200">
                    <tr>
                        <th class="p-4">Name</th>
                        <th class="p-4">Email</th>
                        <th class="p-4">Status</th>
                        <th class="p-4">Actions</th>
                    </tr>
                    </thead>
                    <tbody id="user-table-body"></tbody>
                </table>
            </div>
        </section>

        <!-- Driver Management -->
        <section id="driver-management" class="mb-12">
            <h2 class="text-2xl font-bold mb-4">Driver Management</h2>
            <div class="overflow-x-auto">
                <table class="w-full text-left bg-white shadow rounded-lg">
                    <thead class="bg-gray-200">
                    <tr>
                        <th class="p-4">Name</th>
                        <th class="p-4">Status</th>
                        <th class="p-4">Rating</th>
                        <th class="p-4">Actions</th>
                    </tr>
                    </thead>
                    <tbody id="driver-table-body"></tbody>
                </table>
            </div>
        </section>

        <!-- Ride History -->
        <section id="ride-history">
            <h2 class="text-2xl font-bold mb-4">Ride History</h2>
            <div class="overflow-x-auto">
                <table class="w-full text-left bg-white shadow rounded-lg">
                    <thead class="bg-gray-200">
                    <tr>
                        <th class="p-4">User</th>
                        <th class="p-4">Driver</th>
                        <th class="p-4">Date</th>
                        <th class="p-4">Start</th>
                        <th class="p-4">End</th>
                        <th class="p-4">Cost</th>
                    </tr>
                    </thead>
                    <tbody id="ride-table-body"></tbody>
                </table>
            </div>
        </section>
    </main>
</div>

<script src="${pageContext.request.contextPath}/assets/js/scripts.js"></script>
</body>
</html>