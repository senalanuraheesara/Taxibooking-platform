<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Management - Admin Panel</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/css/styles.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
</head>
<body class="admin-dashboard">
<div class="wrapper">
    <!-- Sidebar -->
    <nav id="sidebar" class="bg-dark text-white">
        <div class="sidebar-header p-3">
            <h4>Cab Service Admin</h4>
        </div>

        <ul class="list-unstyled components pt-2">
            <li>
                <a href="adminDashboard.jsp" class="text-white d-block p-3">
                    <i class="bi bi-speedometer2 me-2"></i> Dashboard
                </a>
            </li>
            <li class="active">
                <a href="userList.jsp" class="text-white d-block p-3 bg-primary">
                    <i class="bi bi-people me-2"></i> User Management
                </a>
            </li>
            <li>
                <a href="driverList.jsp" class="text-white d-block p-3">
                    <i class="bi bi-car-front me-2"></i> Driver Management
                </a>
            </li>
            <li>
                <a href="bookingList.jsp" class="text-white d-block p-3">
                    <i class="bi bi-journal-check me-2"></i> Booking Management
                </a>
            </li>
            <li>
                <a href="reports.jsp" class="text-white d-block p-3">
                    <i class="bi bi-graph-up me-2"></i> Reports
                </a>
            </li>
        </ul>
    </nav>

    <!-- Page Content -->
    <div id="content" class="bg-light">
        <!-- Top Navigation -->
        <nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm">
            <div class="container-fluid">
                <button type="button" id="sidebarCollapse" class="btn btn-outline-secondary">
                    <i class="bi bi-list"></i>
                </button>

                <div class="ms-auto d-flex align-items-center">
                    <div class="dropdown me-3">
                        <a href="#" class="d-flex align-items-center text-decoration-none dropdown-toggle"
                           id="dropdownUser" data-bs-toggle="dropdown" aria-expanded="false">
                            <img src="assets/images/admin-avatar.jpg" alt="Admin" width="32" height="32"
                                 class="rounded-circle me-2">
                            <span>Admin</span>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownUser">
                            <li><a class="dropdown-item" href="profile.jsp">Profile</a></li>
                            <li><a class="dropdown-item" href="settings.jsp">Settings</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item" href="UserServlet?action=logout">Sign out</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </nav>

        <!-- Main Content -->
        <div class="container-fluid p-4 fade-in">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h2 class="mb-0">User Management</h2>
                <div>
                    <a href="addUser.jsp" class="btn btn-primary">
                        <i class="bi bi-plus-lg me-1"></i> Add User
                    </a>
                </div>
            </div>

            <div class="card shadow-sm">
                <div class="card-header bg-white border-bottom">
                    <div class="row align-items-center">
                        <div class="col-md-6">
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="Search users...">
                                <button class="btn btn-outline-secondary" type="button">
                                    <i class="bi bi-search"></i>
                                </button>
                            </div>
                        </div>
                        <div class="col-md-6 text-end">
                            <div class="dropdown d-inline-block me-2">
                                <button class="btn btn-outline-secondary dropdown-toggle" type="button"
                                        id="filterDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                                    <i class="bi bi-funnel me-1"></i> Filter
                                </button>
                                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="filterDropdown">
                                    <li><a class="dropdown-item" href="#">All Users</a></li>
                                    <li><a class="dropdown-item" href="#">Active Only</a></li>
                                    <li><a class="dropdown-item" href="#">Inactive</a></li>
                                    <li><hr class="dropdown-divider"></li>
                                    <li><a class="dropdown-item" href="#">Passengers</a></li>
                                    <li><a class="dropdown-item" href="#">Drivers</a></li>
                                    <li><a class="dropdown-item" href="#">Admins</a></li>
                                </ul>
                            </div>
                            <div class="dropdown d-inline-block">
                                <button class="btn btn-outline-secondary dropdown-toggle" type="button"
                                        id="sortDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                                    <i class="bi bi-arrow-down-up me-1"></i> Sort
                                </button>
                                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="sortDropdown">
                                    <li><a class="dropdown-item" href="#">Newest First</a></li>
                                    <li><a class="dropdown-item" href="#">Oldest First</a></li>
                                    <li><hr class="dropdown-divider"></li>
                                    <li><a class="dropdown-item" href="#">Name (A-Z)</a></li>
                                    <li><a class="dropdown-item" href="#">Name (Z-A)</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="card-body p-0">
                    <div class="table-responsive">
                        <table class="table table-hover mb-0">
                            <thead class="table-light">
                            <tr>
                                <th width="50">ID</th>
                                <th>User</th>
                                <th>Contact</th>
                                <th>Type</th>
                                <th>Status</th>
                                <th>Joined</th>
                                <th width="120">Actions</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="user" items="${userList}">
                                <tr>
                                    <td>${user.userId}</td>
                                    <td>
                                        <div class="d-flex align-items-center">
                                            <img src="assets/images/avatar/${user.userId}.jpg"
                                                 onerror="this.src='assets/images/default-avatar.jpg'"
                                                 alt="${user.fullName}" class="rounded-circle me-2" width="32" height="32">
                                            <div>
                                                <div class="fw-semibold">${user.fullName}</div>
                                                <small class="text-muted">${user.email}</small>
                                            </div>
                                        </div>
                                    </td>
                                    <td>${user.phone}</td>
                                    <td>
                                                <span class="badge ${user.userType == 'ADMIN' ? 'bg-danger' :
                                                    (user.userType == 'DRIVER' ? 'bg-primary' : 'bg-success')}">
                                                        ${user.userType}
                                                </span>
                                    </td>
                                    <td>
                                                <span class="badge ${user.active ? 'bg-success' : 'bg-secondary'}">
                                                        ${user.active ? 'Active' : 'Inactive'}
                                                </span>
                                    </td>
                                    <td>
                                        <small class="text-muted">${user.joinDate}</small>
                                    </td>
                                    <td>
                                        <div class="btn-group btn-group-sm" role="group">
                                            <a href="UserServlet?action=edit&id=${user.userId}"
                                               class="btn btn-outline-primary" title="Edit">
                                                <i class="bi bi-pencil"></i>
                                            </a>
                                            <a href="UserServlet?action=toggle&id=${user.userId}"
                                               class="btn btn-outline-${user.active ? 'warning' : 'success'}"
                                               title="${user.active ? 'Deactivate' : 'Activate'}">
                                                <i class="bi bi-${user.active ? 'x-circle' : 'check-circle'}"></i>
                                            </a>
                                            <a href="UserServlet?action=delete&id=${user.userId}"
                                               class="btn btn-outline-danger" title="Delete"
                                               onclick="return confirm('Are you sure you want to delete this user?')">
                                                <i class="bi bi-trash"></i>
                                            </a>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>

                <div class="card-footer bg-white">
                    <div class="row align-items-center">
                        <div class="col-md-6">
                            <p class="mb-0 text-muted">Showing <strong>1-10</strong> of <strong>${userList.size()}</strong> users</p>
                        </div>
                        <div class="col-md-6">
                            <nav aria-label="Page navigation" class="float-end">
                                <ul class="pagination mb-0">
                                    <li class="page-item disabled">
                                        <a class="page-link" href="#" tabindex="-1">Previous</a>
                                    </li>
                                    <li class="page-item active"><a class="page-link" href="#">1</a></li>
                                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                                    <li class="page-item">
                                        <a class="page-link" href="#">Next</a>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // Sidebar toggle
    document.addEventListener('DOMContentLoaded', function() {
        const sidebar = document.getElementById('sidebar');
        const content = document.getElementById('content');
        const sidebarCollapse = document.getElementById('sidebarCollapse');

        sidebarCollapse.addEventListener('click', function() {
            sidebar.classList.toggle('active');
            content.classList.toggle('active');
        });
    });
</script>
</body>
</html>