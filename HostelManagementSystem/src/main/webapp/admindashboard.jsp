<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.project.model.User" %>

<%
    User admin = (User) session.getAttribute("loggedUser");
    if (admin == null || !"ADMIN".equalsIgnoreCase(admin.getRole())) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>

<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Icons -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">

<style>
    body {
        background: linear-gradient(135deg, #f3e8ff, #ede9fe);
        min-height: 100vh;
    }

    .dashboard-title {
        color: #5b21b6;
        font-weight: 700;
    }

    .dashboard-card {
        border: none;
        border-radius: 18px;
        transition: all 0.3s ease;
    }

    .dashboard-card:hover {
        transform: translateY(-8px);
        box-shadow: 0 20px 35px rgba(88, 28, 135, 0.25);
    }

    .icon-circle {
        width: 60px;
        height: 60px;
        border-radius: 50%;
        background: linear-gradient(135deg, #7c3aed, #5b21b6);
        display: flex;
        align-items: center;
        justify-content: center;
        color: white;
        font-size: 1.6rem;
        margin-bottom: 15px;
    }

    .btn-purple {
        background: linear-gradient(135deg, #7c3aed, #5b21b6);
        border: none;
        color: white;
    }

    .btn-purple:hover {
        background: linear-gradient(135deg, #6d28d9, #4c1d95);
        color: white;
    }
</style>
</head>

<body>

<div class="container py-5">

    <!-- Header -->
    <div class="d-flex justify-content-between align-items-center mb-5">
        <h2 class="dashboard-title">
            <i class="bi bi-shield-lock-fill me-2"></i>
            Welcome, <%= admin.getName() %>
        </h2>

        <a href="<%=request.getContextPath()%>/logout"
           class="btn btn-outline-danger">
            <i class="bi bi-box-arrow-right me-1"></i> Logout
        </a>
    </div>

    <!-- Dashboard Cards -->
    <div class="row g-4">

        <!-- Approve Hostels / Pending Hostels -->
        <div class="col-md-4">
            <div class="card dashboard-card h-100 text-center p-4">
                <div class="icon-circle mx-auto">
                    <i class="bi bi-check2-square"></i>
                </div>
                <h5>Approve Hostels</h5>
                <p class="text-muted">
                    Review and approve pending hostels
                </p>
                <!-- ✅ Corrected button: call servlet, not JSP directly -->
                <a href="<%=request.getContextPath()%>/ViewPendingHostelsController"
                   class="btn btn-purple w-100">
                    View Pending
                </a>
            </div>
        </div>

        <!-- View Approved Hostels -->
        <div class="col-md-4">
            <div class="card dashboard-card h-100 text-center p-4">
                <div class="icon-circle mx-auto">
                    <i class="bi bi-building"></i>
                </div>
                <h5>Approved Hostels</h5>
                <p class="text-muted">
                    View all approved hostels
                </p>
                <a href="<%=request.getContextPath()%>/ViewApprovedHostelsController"
                   class="btn btn-purple w-100">
                    View Approved
                </a>
            </div>
        </div>

        <!-- View Users -->
        <div class="col-md-4">
            <div class="card dashboard-card h-100 text-center p-4">
                <div class="icon-circle mx-auto">
                    <i class="bi bi-people-fill"></i>
                </div>
                <h5>View Users</h5>
                <p class="text-muted">
                    Manage registered users and owners
                </p>
                <a href="<%=request.getContextPath()%>/ViewUsersController"
                   class="btn btn-purple w-100">
                    View Users
                </a>
            </div>
        </div>

        <!-- View Bookings -->
        <div class="col-md-4">
            <div class="card dashboard-card h-100 text-center p-4">
                <div class="icon-circle mx-auto">
                    <i class="bi bi-card-checklist"></i>
                </div>
                <h5>View Bookings</h5>
                <p class="text-muted">
                    See all hostel bookings
                </p>
                <a href="<%=request.getContextPath()%>/ViewAllBookingsController"
                   class="btn btn-purple w-100">
                    View Bookings
                </a>
            </div>
        </div>

    </div>
</div>

</body>
</html>