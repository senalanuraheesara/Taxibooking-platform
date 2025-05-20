<%@ page import="java.io.*, java.util.*" %>
<%@ page import="lk.sliit.taxibooking.taxibooking.User" %>
<%
    String userId = request.getParameter("id");
    String filePath = application.getRealPath("/WEB-INF/users.txt");
    User user = null;

    BufferedReader reader = new BufferedReader(new FileReader(filePath));
    String line;
    while ((line = reader.readLine()) != null) {
        String[] parts = line.split(",");
        if (parts.length >= 6 && parts[0].equals(userId)) {
            user = new User(parts[0], parts[1], parts[2], parts[3], parts[4], parts[5]);
            break;
        }
    }
    reader.close();
%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit User</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 p-10">
    <div class="max-w-xl mx-auto bg-white p-8 shadow-md rounded">
        <h2 class="text-2xl font-bold mb-6 text-blue-600">Edit User</h2>
        <form method="post" action="edit-user">
            <input type="hidden" name="id" value="<%= user.getId() %>"/>
            <div class="mb-4">
                <label>Name</label>
                <input name="name" value="<%= user.getName() %>" class="w-full border p-2 rounded" required />
            </div>
            <div class="mb-4">
                <label>Email</label>
                <input name="email" value="<%= user.getEmail() %>" class="w-full border p-2 rounded" required />
            </div>
            <div class="mb-4">
                <label>Phone</label>
                <input name="phone" value="<%= user.getPhone() %>" class="w-full border p-2 rounded" required />
            </div>
            <div class="mb-4">
                <label>Role</label>
                <select name="role" class="w-full border p-2 rounded">
                    <option value="Driver" <%= user.getRole().equalsIgnoreCase("Driver") ? "selected" : "" %>>Driver</option>
                    <option value="Passenger" <%= user.getRole().equalsIgnoreCase("Passenger") ? "selected" : "" %>>Passenger</option>
                </select>
            </div>
            <button type="submit" class="bg-blue-600 text-white px-4 py-2 rounded hover:bg-blue-700">Update User</button>
        </form>
    </div>
</body>
</html>
