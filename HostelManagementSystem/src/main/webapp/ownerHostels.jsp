<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.project.model.User" %>
<%@ page import="com.project.model.Hostel" %>
<%@ page import="com.project.DAO.HostelDAO" %>

<%
User user = (User) session.getAttribute("loggedUser");
if (user == null || !"OWNER".equalsIgnoreCase(user.getRole())) {
    response.sendRedirect("unauthorized.jsp");
    return;
}

HostelDAO dao = new HostelDAO();
List<Hostel> hostels = dao.getHostelsByOwner(user.getUserId());
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Hostels</title>

<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
    body {
        background: linear-gradient(135deg, #ede9fe, #f5f3ff);
    }
    .badge-pending { background-color: #facc15; color: #000; }
    .badge-approved { background-color: #22c55e; }
    .badge-rejected { background-color: #ef4444; }
</style>
</head>

<body>

<div class="container mt-5">
    <h3 class="text-center mb-4 text-primary">My Hostels</h3>

    <div class="card shadow-lg">
        <div class="card-body">

            <table class="table table-hover text-center align-middle">
                <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>Hostel Name</th>
                        <th>Location</th>
                        <th>Type</th>
                        <th>Price</th>
                        <th>Status</th>
                        <th>Created At</th>
                    </tr>
                </thead>

                <tbody>
                <%
                if (hostels != null && !hostels.isEmpty()) {
                    for (Hostel h : hostels) {
                %>
                    <tr>
                        <td><%= h.getHostelId() %></td>
                        <td><%= h.getHostelName() %></td>
                        <td><%= h.getLocation() %></td>
                        <td><%= h.getHostelType() %></td>
                        <td>₹ <%= h.getPrice() %></td>
                        <td>
                            <span class="badge 
                                <%= "APPROVED".equals(h.getStatus()) ? "badge-approved" :
                                    "REJECTED".equals(h.getStatus()) ? "badge-rejected" :
                                    "badge-pending" %>">
                                <%= h.getStatus() %>
                            </span>
                        </td>
                        <td><%= h.getCreatedAt() %></td>
                    </tr>
                <%
                    }
                } else {
                %>
                    <tr>
                        <td colspan="7" class="text-muted">
                            No hostels found.
                        </td>
                    </tr>
                <%
                }
                %>
                </tbody>
            </table>

            <div class="text-center mt-3">
                <a href="ownerdashboard.jsp" class="btn btn-secondary">
                    Back to Dashboard
                </a>
            </div>

        </div>
    </div>
</div>

</body>
</html>