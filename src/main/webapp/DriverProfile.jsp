<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*, lk.sliit.taxibooking.taxibooking.DriverDetails" %>
<%@ page session="true" %>
<%
    DriverDetails driver = (DriverDetails) session.getAttribute("driver");

    if (driver == null) {
        String driverName = (String) session.getAttribute("username");
        if (driverName == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String path = "C:\\Users\\Udama\\Documents\\Taxibooking-udama[1]\\Taxibooking-udama\\Taxibooking\\Taxibooking\\src\\main\\webapp\\WEB-INF\\users.txt";
        BufferedReader br = new BufferedReader(new FileReader(path));
        String line;
        while ((line = br.readLine()) != null) {
            String[] parts = line.split(",");
            if (parts.length >= 6 && parts[1].equalsIgnoreCase(driverName) && parts[5].equalsIgnoreCase("driver")) {
                driver = new DriverDetails(parts[0], parts[1], parts[2], parts[4]);
                break;
            }
        }
        br.close();


    }

// If driver exists, check in driverDetails.txt for extended data
    if (driver != null) {
        String detailsPath = "C:\\Users\\Udama\\Documents\\Taxibooking-udama[1]\\Taxibooking-udama\\Taxibooking\\Taxibooking\\src\\main\\webapp\\WEB-INF\\driverDetails.txt";
        BufferedReader br = new BufferedReader(new FileReader(detailsPath));
        String line;
        while ((line = br.readLine()) != null) {
            String[] parts = line.split(",");
            if (parts.length >= 9 && parts[0].equals(driver.getUserID())) {
                driver.setLicenseNumber(parts[4]);
                driver.setVehicleType(parts[5]);
                driver.setWorkStatus(parts[6]);
                driver.setExperience(Integer.parseInt(parts[7]));
                driver.setRating(Double.parseDouble(parts[8]));
                break;
            }
        }
        br.close();

        session.setAttribute("driver", driver);
        double totalRating = 0;
        int ratingCount = 0;
        String rewpath = "C:\\Users\\Udama\\Documents\\Taxibooking-udama[1]\\Taxibooking-udama\\Taxibooking\\Taxibooking\\src\\main\\webapp\\WEB-INF\\reviews.txt";
        BufferedReader br2 = new BufferedReader(new FileReader(rewpath));
        String line2;
        while ((line2 = br2.readLine()) != null) {
            String[] reviewParts = line2.split(",");
            if (reviewParts.length >= 2 && reviewParts[0].trim().equalsIgnoreCase(driver.getName().trim())) {
                try {
                    double rating = Double.parseDouble(reviewParts[1].trim());
                    if (rating >= 0 && rating <= 5) {
                        totalRating += rating;
                        ratingCount++;
                    }
                } catch (NumberFormatException e) {
                    // Ignore invalid ratings
                }
            }
        }
        br2.close();

        double avgRating = ratingCount > 0 ? totalRating / ratingCount : 0;
        avgRating = Math.min(avgRating, 5.0); // Cap at 5.0
        avgRating = Math.round(avgRating * 100.0) / 100.0; // Round to 2 decimal places

        driver.setRating(avgRating);
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Driver Profile</title>
    <link rel="stylesheet" href="css/style1.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
    <link rel="icon" href="images/favicon.png" type="image/png">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

</head>
<body>
<nav class="navbar">
    <div class="logo"><i class="fas fa-car"></i> Driver Panel</div>
    <div class="nav-links">
        <a href="driverDashboard.jsp"><i class="fas fa-tachometer-alt"></i> Dashboard</a>
        <a href="rides.jsp"><i class="fas fa-road"></i> My Rides</a>
        <a href="rating.jsp"><i class="fas fa-star"></i> My Rating</a>
        <a href="earnings.jsp"><i class="fas fa-money-bill-wave"></i> Earnings</a>
        <a href="DriverProfile.jsp"><i class="fas fa-user"></i> Profile</a>
        <a href="logout" class="logout"><i class="fas fa-sign-out-alt"></i> Logout</a>
    </div>
</nav>


<div class="form-container">
    <h2>Your Driver Profile</h2>

    <div class="readonly-info">
        <p><strong>ID:</strong> <%= driver.getUserID() %></p>
        <p><strong>Name:</strong> <%= driver.getName() %></p>
        <p><strong>Email:</strong> <%= driver.getEmail() %></p>
        <p><strong>Phone Number:</strong> <%= driver.getPhoneNumber() %></p>
        <p><strong>Rating:</strong> <%= driver.getRating() %></p>
    </div>

    <form action="DriverProfileServlet" method="post">
        <input type="hidden" name="userID" value="<%= driver.getUserID() %>" />

        <label>License Number: </label>
        <input type="text" name="licenseNumber" value="<%= driver.getLicenseNumber() != null ? driver.getLicenseNumber() : "" %>" required /><br/>

        <label>Vehicle Type: </label>
        <input type="text" name="vehicleType" value="<%= driver.getVehicleType() != null ? driver.getVehicleType() : "" %>" required /><br/>

        <label>Work Status: </label>
        <select name="workStatus">
            <option value="Full-Time" <%= "Full-Time".equals(driver.getWorkStatus()) ? "selected" : "" %>>Full-Time</option>
            <option value="Part-Time" <%= "Part-Time".equals(driver.getWorkStatus()) ? "selected" : "" %>>Part-Time</option>
        </select><br/>

        <label>Experience (years): </label>
        <input type="number" name="experience" value="<%= driver.getExperience() %>" required /><br/>

        <input type="submit" value="Save" />
    </form>


</div>
</body>
</html>
