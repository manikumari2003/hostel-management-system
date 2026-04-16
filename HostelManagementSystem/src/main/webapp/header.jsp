<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.project.model.User" %>
<%
    User user = (User) session.getAttribute("loggedUser");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f7f7f7;
        margin: 0;
        padding: 0;
    }
    .navbar {
        background-color: #333;
        padding: 10px 20px;
        display: flex;
        align-items: center;
    }
    .navbar span {
        color: white;
        font-weight: bold;
        margin-right: 20px;
    }
    .navbar a {
        color: white;
        text-decoration: none;
        padding: 8px 15px;
        margin-right: 10px;
        border-radius: 4px;
        background-color: #4CAF50;
    }
    .navbar a.logout {
        background-color: #f44336;
        margin-left: auto;
    }
    .navbar a:hover {
        opacity: 0.8;
    }
</style>
<div class="navbar">
    <span>Welcome, <%= user.getName() %></span>
    <a href="addHostel.jsp">Add Hostel</a>
    <a href="ViewMyHostels">View My Hostels</a>
    <a href="ViewBookings">View Bookings</a>
    <a class="logout" href="LogoutController">Logout</a>
</div>