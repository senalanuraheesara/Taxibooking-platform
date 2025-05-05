<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>My Profile - Cab Service</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/css/styles.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary shadow-sm">
  <div class="container">
    <a class="navbar-brand d-flex align-items-center" href="#">
      <img src="assets/images/logo-white.png" alt="Logo" height="30" class="me-2">
      Cab Service
    </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav ms-auto">
        <li class="nav-item">
          <a class="nav-link" href="dashboard.jsp"><i class="bi bi-speedometer2 me-1"></i> Dashboard</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="profile.jsp"><i class="bi bi-person me-1"></i> Profile</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="UserServlet?action=logout"><i class="bi bi-box-arrow-right me-1"></i> Logout</a>
        </li>
      </ul>
    </div>
  </div>
</nav>

<div class="container my-5 fade-in">
  <div class="row">
    <div class="col-lg-4">
      <div class="card shadow-sm mb-4">
        <div class="card-body text-center">
          <img src="assets/images/avatar/${user.userId}.jpg" onerror="this.src='assets/images/default-avatar.jpg'"
               alt="Profile" class="profile-avatar mb-3">
          <h4 class="card-title mb-1">${user.fullName}</h4>
          <p class="text-muted mb-2">
                            <span class="badge ${user.userType == 'ADMIN' ? 'bg-danger' :
                                (user.userType == 'DRIVER' ? 'bg-primary' : 'bg-success')}">
                              ${user.userType}
                            </span>
          </p>
          <p class="text-muted small">
            <i class="bi bi-geo-alt me-1"></i> ${user.address != null ? user.address : 'No address provided'}
          </p>
          <hr>
          <div class="d-flex justify-content-center">
            <a href="#" class="btn btn-sm btn-outline-primary me-2">
              <i class="bi bi-pencil"></i> Edit Photo
            </a>
            <a href="#" class="btn btn-sm btn-outline-secondary">
              <i class="bi bi-eye"></i> View Public
            </a>
          </div>
        </div>
      </div>

      <div class="card shadow-sm">
        <div class="card-header bg-light">
          <h6 class="mb-0"><i class="bi bi-shield-lock me-1"></i> Security</h6>
        </div>
        <div class="card-body">
          <div class="d-flex justify-content-between align-items-center mb-3">
            <span>Two-factor Authentication</span>
            <div class="form-check form-switch">
              <input class="form-check-input" type="checkbox" id="twoFactor">
              <label class="form-check-label" for="twoFactor"></label>
            </div>
          </div>
          <div class="d-flex justify-content-between align-items-center">
            <span>Login Notifications</span>
            <div class="form-check form-switch">
              <input class="form-check-input" type="checkbox" id="loginNotifications" checked>
              <label class="form-check-label" for="loginNotifications"></label>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="col-lg-8">
      <div class="card shadow-sm">
        <div class="card-header bg-light">
          <ul class="nav nav-tabs card-header-tabs">
            <li class="nav-item">
              <a class="nav-link active" href="#profile" data-bs-toggle="tab">Profile</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#password" data-bs-toggle="tab">Password</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#activity" data-bs-toggle="tab">Activity</a>
            </li>
          </ul>
        </div>
        <div class="card-body">
          <div class="tab-content">
            <div class="tab-pane fade show active" id="profile">
              <form action="UserServlet" method="post">
                <input type="hidden" name="action" value="update">

                <div class="row mb-3">
                  <div class="col-md-6">
                    <label for="fullName" class="form-label">Full Name</label>
                    <input type="text" class="form-control" id="fullName" name="fullName"
                           value="${user.fullName}" required>
                  </div>
                  <div class="col-md-6">
                    <label for="email" class="form-label">Email</label>
                    <input type="email" class="form-control" id="email" name="email"
                           value="${user.email}" required>
                  </div>
                </div>

                <div class="mb-3">
                  <label for="phone" class="form-label">Phone Number</label>
                  <input type="tel" class="form-control" id="phone" name="phone"
                         value="${user.phone}" required>
                </div>

                <div class="mb-3">
                  <label for="address" class="form-label">Address</label>
                  <textarea class="form-control" id="address" name="address" rows="2">${user.address}</textarea>
                </div>

                <div class="mb-3">
                  <label for="bio" class="form-label">Bio</label>
                  <textarea class="form-control" id="bio" name="bio" rows="3">${user.bio}</textarea>
                  <div class="form-text">Tell us a little about yourself</div>
                </div>

                <div class="mb-3">
                  <label for="currentPassword" class="form-label">Current Password</label>
                  <input type="password" class="form-control" id="currentPassword" name="currentPassword" required>
                  <div class="form-text">Enter your current password to confirm changes</div>
                </div>

                <div class="d-flex justify-content-end">
                  <button type="submit" class="btn btn-primary px-4">Save Changes</button>
                </div>
              </form>
            </div>

            <div class="tab-pane fade" id="password">
              <form action="UserServlet" method="post">
                <input type="hidden" name="action" value="changePassword">

                <div class="mb-3">
                  <label for="currentPasswordChange" class="form-label">Current Password</label>
                  <input type="password" class="form-control" id="currentPasswordChange"
                         name="currentPassword" required>
                </div>

                <div class="mb-3">
                  <label for="newPassword" class="form-label">New Password</label>
                  <input type="password" class="form-control" id="newPassword"
                         name="newPassword" minlength="8" required>
                  <div class="form-text">Minimum 8 characters</div>
                </div>

                <div class="mb-3">
                  <label for="confirmNewPassword" class="form-label">Confirm New Password</label>
                  <input type="password" class="form-control" id="confirmNewPassword"
                         name="confirmNewPassword" required>
                </div>

                <div class="d-flex justify-content-end">
                  <button type="submit" class="btn btn-primary px-4">Update Password</button>
                </div>
              </form>
            </div>

            <div class="tab-pane fade" id="activity">
              <h6 class="mb-3">Recent Activity</h6>
              <div class="list-group">
                <a href="#" class="list-group-item list-group-item-action">
                  <div class="d-flex w-100 justify-content-between">
                    <small class="text-muted">Today, 10:45 AM</small>
                  </div>
                  <p class="mb-1">Changed profile picture</p>
                </a>
                <a href="#" class="list-group-item list-group-item-action">
                  <div class="d-flex w-100 justify-content-between">
                    <small class="text-muted">Yesterday, 3:20 PM</small>
                  </div>
                  <p class="mb-1">Updated phone number</p>
                </a>
                <a href="#" class="list-group-item list-group-item-action">
                  <div class="d-flex w-100 justify-content-between">
                    <small class="text-muted">Monday, 9:15 AM</small>
                  </div>
                  <p class="mb-1">Booked a ride to Colombo City Center</p>
                </a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>