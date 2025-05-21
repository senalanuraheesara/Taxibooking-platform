<%--
  Created by IntelliJ IDEA.
  User: Irumi Dhananjana
  Date: 5/20/2025
  Time: 4:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.io.*, java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete User</title>
</head>
<body>
<h2>Delete User</h2>

<table border="1">
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Email</th>
        <th>Phone</th>
        <th>Role</th>
        <th>Action</th>
    </tr>

    <%
        String filePath = application.getRealPath("/WEB-INF/users.txt");
        File file = new File(filePath);
        if (file.exists()) {
            BufferedReader reader = new BufferedReader(new FileReader(file));
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts.length >= 6) {
                    String id = parts[0];
    %>
    <tr>
        <td><%= parts[0] %></td>
        <td><%= parts[1] %></td>
        <td><%= parts[2] %></td>
        <td><%= parts[4] %></td>
        <td><%= parts[5] %></td>
        <td>
            <form action="delete-user" method="post" onsubmit="return confirm('Are you sure you want to delete this user?');">
                <input type="hidden" name="id" value="<%= id %>"/>
                <input type="submit" value="Delete"/>
            </form>
        </td>
    </tr>
    <%
            }
        }
        reader.close();
    } else {
    %>
    <tr><td colspan="6">No users found.</td></tr>
    <%
        }
    %>
</table>

</body>
</html>
