<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.io.*, java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Manage Drivers | City Cab Service</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <style> body { font-family: 'Poppins', sans-serif; } </style>
</head>
<body class="bg-gray-100 text-gray-800">

<header class="bg-white shadow">
    <div class="container mx-auto flex justify-between items-center px-6 py-4">
        <div class="text-2xl font-semibold text-blue-600 flex items-center gap-2">
            <i class="fas fa-taxi"></i> Admin Panel
        </div>
        <ul class="flex gap-6 text-sm font-medium">
            <li><a href="adminmanagement.jsp" class="hover:text-blue-500">Dashboard</a></li>
            <li><a href="manage-drivers.jsp" class="text-blue-600 border-b-2 border-blue-600">Drivers</a></li>
            <li><a href="logout.jsp" class="hover:text-red-500">Logout</a></li>
        </ul>
    </div>
</header>

<main class="container mx-auto px-6 py-10">
    <section class="mb-10">
        <h1 class="text-3xl font-bold mb-2">Manage Drivers</h1>
        <p class="text-gray-600">Showing user details from driverDeatils.txt.txt</p>
    </section>

    <section class="overflow-x-auto bg-white rounded-xl shadow-lg p-6">
        <table class="min-w-full table-auto">
            <thead class="bg-blue-100 text-blue-800">
            <tr>
                <th class="px-4 py-2 text-left">#</th>
                <th class="px-4 py-2 text-left">Username</th>
                <th class="px-4 py-2 text-left">Email</th>
                <th class="px-4 py-2 text-left">Phone</th>
                <th class="px-4 py-2 text-left">Role</th>
            </tr>
            </thead>
            <tbody class="text-gray-700">
            <%
                String filePath = application.getRealPath("/WEB-INF/driverDetails.txt");
                File file = new File(filePath);
                int i = 1;

                if (file.exists()) {
                    BufferedReader reader = new BufferedReader(new FileReader(file));
                    String line;
                    while ((line = reader.readLine()) != null) {
                        String[] parts = line.split(",");
                        if (parts.length >= 6) {
                            String username = parts[1];
                            String email = parts[2];
                            String phone = parts[4];
                            String role = parts[5];
            %>
            <tr class="border-b hover:bg-blue-50">
                <td class="px-4 py-2"><%= i++ %></td>
                <td class="px-4 py-2"><%= username %></td>
                <td class="px-4 py-2"><%= email %></td>
                <td class="px-4 py-2"><%= phone %></td>
                <td class="px-4 py-2"><%= role %></td>
            </tr>
            <%
                    }
                }
                reader.close();
            } else {
            %>
            <tr><td colspan="5" class="px-4 py-2 text-red-500">User file not found!</td></tr>
            <%
                }
            %>
            </tbody>
        </table>
    </section>
</main>

</body>
</html>
