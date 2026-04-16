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
    if (user == null || !"USER".equalsIgnoreCase(user.getRole())) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Dashboard</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
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
    .logout-btn {
        color: #b91c1c;
        font-weight: 600;
        text-decoration: none;
    }
</style>
</head>

<body>

<div class="container py-5">

    <!-- Header -->
    <div class="d-flex justify-content-between align-items-center mb-5">
        <h2 class="dashboard-title">
            <i class="bi bi-person-circle me-2"></i>
            Welcome, <%= user.getName() %>
        </h2>

        <a href="<%=request.getContextPath()%>/logout" class="logout-btn">
            <i class="bi bi-box-arrow-right me-1"></i>
            Logout
        </a>
    </div>

    <!-- Cards -->
<div class="row g-4">

    <!-- Search Hostels -->
    <div class="col-md-4">
        <div class="card dashboard-card h-100 text-center p-4">
            <div class="icon-circle mx-auto">
                <i class="bi bi-search"></i>
            </div>
            <h5>Search Hostels</h5>
            <p class="text-muted">Browse approved hostels</p>
            <a href="SearchHostelController"
               class="btn btn-purple w-100">
                Explore
            </a>
        </div>
    </div>

    <!-- Book Hostel -->
    <div class="col-md-4">
        <div class="card dashboard-card h-100 text-center p-4">
            <div class="icon-circle mx-auto">
                <i class="bi bi-calendar-check-fill"></i>
            </div>
            <h5>Book Hostel</h5>
            <p class="text-muted">Choose & book your hostel</p>
            <a href="SearchHostelController"
               class="btn btn-purple w-100">
                Book Now
            </a>
        </div>
    </div>

    <!-- My Bookings -->
    <div class="col-md-4">
        <div class="card dashboard-card h-100 text-center p-4">
            <div class="icon-circle mx-auto">
                <i class="bi bi-journal-check"></i>
            </div>
            <h5>My Bookings</h5>
            <p class="text-muted">View your bookings</p>
           <a href="<%=request.getContextPath()%>/MyBookingsController"
   class="btn btn-purple w-100">
    View
</a>


            </a>
        </div>
    </div>

</div>