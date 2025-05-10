<%@ page import="lk.sliit.taxibooking.taxibooking.User" %>
<%
  User user = (User) session.getAttribute("user");
  if (user == null) {
    response.sendRedirect("login.jsp");
    return;
  }
%>
<!DOCTYPE html>
<html>
<head>
  <title>User Profile</title>
  <link rel="stylesheet" href="css/style.css">
</head>
<body>
<!-- Navbar -->
<div class="navbar">
  <div class="navbar-logo">
    <i class="fas fa-taxi"></i> City Cab Service
  </div>
  <div>
    <a href="index.jsp"><i class="fas fa-home"></i> Home</a>
  </div>
</div>
<div class="profile-container">
  <h2>Welcome, <%= user.getName() %>!</h2>

  <div class="profile-card">
    <form method="post" action="profile" class="profile-form">
      <div class="form-group">
        <label for="name">Name:</label>
        <input id="name" name="name" value="<%= user.getName() %>" required />
      </div>
      <div class="form-group">
        <label for="phone">Phone:</label>
        <input id="phone" name="phone" value="<%= user.getPhone() %>" required />
      </div>
      <button type="submit" class="btn primary-btn">Update Profile</button>
    </form>

    <form method="post" action="user/delete" class="profile-form">
      <input type="hidden" id="userid" name="id" value="<%= user.getId() %>">
      <button type="submit" class="btn danger-btn">Delete Account</button>
    </form>

    <p class="user-role"><strong>Role:</strong> <%= user instanceof lk.sliit.taxibooking.taxibooking.Driver ? "Driver" : "Passenger" %></p>

    <div class="nav-links">
      <a href="index.jsp" class="btn link-btn">Back to Home</a>
      <a href="logout" class="btn secondary-btn">Logout</a>
    </div>
  </div>
</div>
</body>
</html>
