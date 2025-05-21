<%@ page import="java.io.*, java.util.*" %>
<%@ page import="lk.sliit.taxibooking.taxibooking.DriverDetails" %>
<%
    String userId = request.getParameter("id");
    DriverDetails driver = null;

    if (userId != null && !userId.trim().isEmpty()) {
        String filePath = application.getRealPath("/WEB-INF/driverDetails.txt");
        BufferedReader reader = new BufferedReader(new FileReader(filePath));
        String line;
        while ((line = reader.readLine()) != null) {
            String[] parts = line.split(",");
            if (parts.length >= 9 && parts[0].equals(userId)) {
                driver = new DriverDetails(parts[0], parts[1], parts[2], parts[3]);
                driver.setLicenseNumber(parts[4]);
                driver.setVehicleType(parts[5]);
                driver.setWorkStatus(parts[6]);
                driver.setExperience(Integer.parseInt(parts[7]));
                driver.setRating(Double.parseDouble(parts[8]));
                break;
            }
        }
        reader.close();
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Driver</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 p-10">
<div class="max-w-xl mx-auto bg-white p-8 shadow-md rounded">
    <h2 class="text-2xl font-bold mb-6 text-blue-600">Edit Driver</h2>

    <% if (driver != null) { %>
    <form method="post" action="edit-driver">
        <input type="hidden" name="id" value="<%= driver.getUserID() %>"/>
        <div class="mb-4">
            <label>Name</label>
            <input name="name" value="<%= driver.getName() %>" class="w-full border p-2 rounded" required />
        </div>
        <div class="mb-4">
            <label>Email</label>
            <input name="email" value="<%= driver.getEmail() %>" class="w-full border p-2 rounded" required />
        </div>
        <div class="mb-4">
            <label>Phone</label>
            <input name="phone" value="<%= driver.getPhoneNumber() %>" class="w-full border p-2 rounded" required />
        </div>
        <div class="mb-4">
            <label>License Number</label>
            <input name="license" value="<%= driver.getLicenseNumber() %>" class="w-full border p-2 rounded" required />
        </div>
        <div class="mb-4">
            <label>Vehicle Type</label>
            <input name="vehicleType" value="<%= driver.getVehicleType() %>" class="w-full border p-2 rounded" required />
        </div>
        <div class="mb-4">
            <label>Work Status</label>
            <input name="workStatus" value="<%= driver.getWorkStatus() %>" class="w-full border p-2 rounded" required />
        </div>
        <div class="mb-4">
            <label>Experience</label>
            <input name="experience" type="number" value="<%= driver.getExperience() %>" class="w-full border p-2 rounded" required />
        </div>
        <div class="mb-4">
            <label>Rating</label>
            <input name="rating" type="number" step="0.1" value="<%= driver.getRating() %>" class="w-full border p-2 rounded" required />
        </div>
        <button type="submit" class="bg-blue-600 text-white px-4 py-2 rounded hover:bg-blue-700">Update Driver</button>
    </form>
    <% } else { %>
    <p class="text-red-600 font-semibold">Error: Driver not found. Please go back and try again.</p>
    <% } %>
</div>
</body>
</html>
