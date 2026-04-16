<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.project.model.User" %>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<%
User admin = (User) session.getAttribute("loggedUser");
if (admin == null || !"ADMIN".equalsIgnoreCase(admin.getRole())) {
    response.sendRedirect("../login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>
</head>
<body class="bg-light">

<div class="container mt-5">
    <div class="card shadow">
        <div class="card-header bg-dark text-white">
            <h4>Welcome Admin, <%= admin.getName() %></h4>
        </div>

        <div class="card-body">
            <ul class="list-group">

                <li class="list-group-item">
                    <a href="<%=request.getContextPath()%>/admin/viewPendingHostels.jsp">
                        View Pending Hostels
                    </a>
                </li>

                <li class="list-group-item">
                    <a href="<%=request.getContextPath()%>/admin/viewApprovedHostels.jsp">
                        View Approved Hostels
                    </a>
                </li>

                <li class="list-group-item">
                    <a href="<%=request.getContextPath()%>/admin/viewUsers.jsp">
                        View Users
                    </a>
                </li>

                <li class="list-group-item">
                    <a href="<%=request.getContextPath()%>/logout.jsp">
                        Logout
                    </a>
                </li>

            </ul>
        </div>
    </div>
</div>

</body>
</html>
