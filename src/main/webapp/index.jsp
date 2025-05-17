<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100">
<div class="flex">
    <!-- Sidebar -->
    <aside class="w-64 bg-blue-800 text-white p-4 h-screen sticky top-0">
        <h1 class="text-2xl font-bold mb-8">Admin Dashboard</h1>
        <nav>
            <ul class="space-y-2">
                <li>
                    <a href="#dashboard" class="block p-2 hover:bg-blue-700 rounded">Dashboard</a>
                </li>
                <li>
                    <a href="#user-management" class="block p-2 hover:bg-blue-700 rounded">User Management</a>
                </li>
                <li>
                    <a href="#driver-management" class="block p-2 hover:bg-blue-700 rounded">Driver Management</a>
                </li>
                <li>
                    <a href="#ride-history" class="block p-2 hover:bg-blue-700 rounded">Ride History</a>
                </li>
                <li>
                    <a href="#" class="block p-2 hover:bg-blue-700 rounded">Settings</a>
                </li>
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
                    <p class="text-2xl text-blue-600">1,234</p>
                </div>
                <div class="bg-white p-6 rounded-xl shadow-md">
                    <h3 class="text-lg font-semibold">Total Drivers</h3>
                    <p class="text-2xl text-green-600">234</p>
                </div>
                <div class="bg-white p-6 rounded-xl shadow-md">
                    <h3 class="text-lg font-semibold">Active Rides</h3>
                    <p class="text-2xl text-yellow-500">12</p>
                </div>
                <div class="bg-white p-6 rounded-xl shadow-md">
                    <h3 class="text-lg font-semibold">Total Revenue</h3>
                    <p class="text-2xl text-red-500">$7,850</p>
                </div>
            </div>
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
                    <tbody>
                    <tr class="border-b">
                        <td class="p-4">John Doe</td>
                        <td class="p-4">john@example.com</td>
                        <td class="p-4 text-green-600">Active</td>
                        <td class="p-4 space-x-2">
                            <button class="px-3 py-1 bg-blue-500 text-white rounded hover:bg-blue-600">Edit</button>
                            <button class="px-3 py-1 bg-red-500 text-white rounded hover:bg-red-600">Delete</button>
                        </td>
                    </tr>
                    <tr class="border-b">
                        <td class="p-4">Alice Johnson</td>
                        <td class="p-4">alice@example.com</td>
                        <td class="p-4 text-green-600">Active</td>
                        <td class="p-4 space-x-2">
                            <button class="px-3 py-1 bg-blue-500 text-white rounded hover:bg-blue-600">Edit</button>
                            <button class="px-3 py-1 bg-red-500 text-white rounded hover:bg-red-600">Delete</button>
                        </td>
                    </tr>
                    <tr class="border-b">
                        <td class="p-4">Bob Williams</td>
                        <td class="p-4">bob@example.com</td>
                        <td class="p-4 text-red-500">Inactive</td>
                        <td class="p-4 space-x-2">
                            <button class="px-3 py-1 bg-blue-500 text-white rounded hover:bg-blue-600">Edit</button>
                            <button class="px-3 py-1 bg-red-500 text-white rounded hover:bg-red-600">Delete</button>
                        </td>
                    </tr>
                    </tbody>
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
                    <tbody>
                    <tr class="border-b">
                        <td class="p-4">Jane Smith</td>
                        <td class="p-4 text-yellow-500">Pending</td>
                        <td class="p-4">4.7</td>
                        <td class="p-4 space-x-2">
                            <button class="px-3 py-1 bg-green-500 text-white rounded hover:bg-green-600">Approve</button>
                            <button class="px-3 py-1 bg-red-500 text-white rounded hover:bg-red-600">Reject</button>
                        </td>
                    </tr>
                    <tr class="border-b">
                        <td class="p-4">Mike Brown</td>
                        <td class="p-4 text-green-600">Approved</td>
                        <td class="p-4">4.9</td>
                        <td class="p-4 space-x-2">
                            <button class="px-3 py-1 bg-blue-500 text-white rounded hover:bg-blue-600">View</button>
                            <button class="px-3 py-1 bg-red-500 text-white rounded hover:bg-red-600">Suspend</button>
                        </td>
                    </tr>
                    <tr class="border-b">
                        <td class="p-4">Sarah Davis</td>
                        <td class="p-4 text-red-500">Rejected</td>
                        <td class="p-4">-</td>
                        <td class="p-4 space-x-2">
                            <button class="px-3 py-1 bg-green-500 text-white rounded hover:bg-green-600">Re-evaluate</button>
                        </td>
                    </tr>
                    </tbody>
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
                    <tbody>
                    <tr class="border-b">
                        <td class="p-4">John Doe</td>
                        <td class="p-4">Jane Smith</td>
                        <td class="p-4">2025-05-09</td>
                        <td class="p-4">Kaduwela</td>
                        <td class="p-4">Malabe</td>
                        <td class="p-4">$15.00</td>
                    </tr>
                    <tr class="border-b">
                        <td class="p-4">Alice Johnson</td>
                        <td class="p-4">Mike Brown</td>
                        <td class="p-4">2025-05-08</td>
                        <td class="p-4">Colombo</td>
                        <td class="p-4">Negombo</td>
                        <td class="p-4">$25.50</td>
                    </tr>
                    <tr class="border-b">
                        <td class="p-4">Bob Williams</td>
                        <td class="p-4">Jane Smith</td>
                        <td class="p-4">2025-05-07</td>
                        <td class="p-4">Kotte</td>
                        <td class="p-4">Battaramulla</td>
                        <td class="p-4">$8.75</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </section>
    </main>
</div>
</body>
</html>