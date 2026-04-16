<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.project.model.User" %>
<%
response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
response.setHeader("Pragma","no-cache");
response.setDateHeader("Expires", 0);
%>

<%
User user = (User) session.getAttribute("loggedUser");
if (user == null || !"OWNER".equalsIgnoreCase(user.getRole())) {
    response.sendRedirect("login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Owner Dashboard</title>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
      rel="stylesheet">

<!-- Bootstrap Icons -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css"
      rel="stylesheet">

<style>
    body {
        background: linear-gradient(135deg, #ede9fe, #f5f3ff);
        min-height: 100vh;
    }
    .card {
        transition: transform 0.3s ease, box-shadow 0.3s ease;
        border-radius: 15px;
    }
    .card:hover {
        transform: translateY(-6px);
        box-shadow: 0 12px 25px rgba(0,0,0,0.15);
    }
</style>
</head>

<body>

<!-- HEADER -->
<nav class="navbar navbar-dark bg-dark px-4">
    <span class="navbar-brand mb-0 h4">
        <i class="bi bi-speedometer2 me-2"></i>
        Owner Dashboard
    </span>

    <div class="text-white">
        Welcome, <strong><%= user.getName() %></strong>
        <a href="<%=request.getContextPath()%>/logout"
   class="btn btn-danger btn-sm ms-3">
    <i class="bi bi-box-arrow-right"></i> Logout
</a>

    </div>
</nav>

<!-- DASHBOARD CONTENT -->
<div class="container mt-5">
    <div class="row g-4">

        <!-- ADD HOSTEL -->
        <div class="col-md-4">
            <div class="card shadow h-100">
                <div class="card-body text-center">
                    <i class="bi bi-house-add-fill text-primary fs-1"></i>
                    <h5 class="mt-3">Add Hostel</h5>
                    <p class="text-muted">Register a new hostel</p>
                    <a href="<%=request.getContextPath()%>/owneraddHostel.jsp"
                       class="btn btn-primary">
                        Add Hostel
                    </a>
                </div>
            </div>
        </div>

        <!-- MY HOSTELS -->
        <div class="col-md-4">
            <div class="card shadow h-100">
                <div class="card-body text-center">
                    <i class="bi bi-buildings-fill text-success fs-1"></i>
                    <h5 class="mt-3">My Hostels</h5>
                    <p class="text-muted">View your hostels</p>
                    <a href="<%=request.getContextPath()%>/ownerHostels.jsp"
                       class="btn btn-success">
                        View Hostels
                    </a>
                </div>
            </div>
        </div>

        <!-- VIEW BOOKINGS -->
        <div class="col-md-4">
            <div class="card shadow h-100">
                <div class="card-body text-center">
                    <i class="bi bi-journal-check text-warning fs-1"></i>
                    <h5 class="mt-3">View Bookings</h5>
                    <p class="text-muted">Check hostel bookings</p>
                    <a href="<%=request.getContextPath()%>/OwnerBookings.jsp"
                       class="btn btn-warning text-white">
                        View Bookings
                    </a>
                </div>
            </div>
        </div>

    </div>
</div>

</body>
</html>