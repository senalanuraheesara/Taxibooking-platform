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
    String usersPath = "C:\\Users\\Udama\\Documents\\Taxibooking-udama[1]\\Taxibooking-udama\\Taxibooking\\Taxibooking\\src\\main\\webapp\\WEB-INF\\users.txt";
    BufferedReader br = new BufferedReader(new FileReader(usersPath));
    String line;
    while ((line = br.readLine()) != null) {
      String[] parts = line.split(",");
      if (parts.length >= 6 && parts[1].equalsIgnoreCase(driverName) && parts[5].equalsIgnoreCase("driver")) {
        driver = new DriverDetails(parts[0], parts[1], parts[2], parts[4]);
        session.setAttribute("driver", driver);
        break;
      }
    }
    br.close();
    if (driver == null) {
      System.out.println("<h3 style='color:red;'>Driver not found </h3>");
      return;
    }
  }
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Driver Dashboard</title>
  <link rel="stylesheet" href="css/style1.css">
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
  <link rel="icon" href="images/favicon.png" type="image/png">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

  <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
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


<main class="main-container">
  <h1>Welcome, <%= driver.getName() %>!</h1>
  <p class="subtitle">Here is your daily overview and quick access to tools.</p>
  <div class="highlight-message">
    Still you didn’t fill your other details or want to update your profile?
    <a href="DriverProfile.jsp">Click here</a>
  </div>
  <div class="card-grid">
    <div class="card">
      <i class="fas fa-road icon"></i>
      <h3>My Rides</h3>
      <p>View and manage assigned and completed rides.</p>
      <a href="rides.jsp">View</a>
    </div>
    <div class="card">
      <i class="fas fa-star-half-alt"></i>
      <h3>Ratings</h3>
      <p> Your Rating status.</p>
      <a href="rating.jsp">View</a>
    </div>
    <div class="card">
      <i class="fas fa-wallet icon"></i>
      <h3>Earnings</h3>
      <p>Track your daily and monthly earnings.</p>
      <a href="earnings.jsp">Check</a>
    </div>
    <div class="card">
      <i class="fas fa-user icon"></i>
      <h3>My Profile</h3>
      <p>Edit your driver profile information.</p>
      <a href="DriverProfile.jsp">Edit</a>
    </div>
  </div>

</main>
</body>
</html>
