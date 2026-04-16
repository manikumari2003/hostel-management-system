<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.project.model.Booking" %>
<%@ page import="com.project.model.User" %>

<%
    User user = (User) session.getAttribute("loggedUser");
    if (user == null || !"USER".equalsIgnoreCase(user.getRole())) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }

    List<Booking> bookings =
        (List<Booking>) request.getAttribute("bookings");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Bookings</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">

<style>
    body {
        background: linear-gradient(135deg, #f3e8ff, #ede9fe);
        min-height: 100vh;
    }
    .title {
        color: #5b21b6;
        font-weight: 700;
    }
    .badge-confirmed {
        background-color: #16a34a;
    }
    .badge-cancelled {
        background-color: #dc2626;
    }
</style>
</head>

<body>

<div class="container py-5">

    <!-- Success Message -->
    <%
        if ("booked".equals(request.getParameter("success"))) {
    %>
    <div class="alert alert-success alert-dismissible fade show">
        🎉 Booking confirmed successfully!
        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
    </div>
    <%
        }
    %>

    <h2 class="title mb-4">
        <i class="bi bi-journal-text me-2"></i>
        My Bookings
    </h2>

    <table class="table table-hover bg-white shadow rounded">
        <thead class="table-light">
            <tr>
                <th>Hostel</th>
                <th>Location</th>
                <th>Booking Date</th>
                <th>Status</th>
                <th>Action</th>
            </tr>
        </thead>

        <tbody>
        <%
            if (bookings != null && !bookings.isEmpty()) {
                for (Booking b : bookings) {
        %>
            <tr>
                <td><%= b.getHostelName() %></td>
                <td><%= b.getLocation() %></td>
                <td><%= b.getBookingDate() %></td>
                <td>
                    <% if ("CONFIRMED".equalsIgnoreCase(b.getStatus())) { %>
                        <span class="badge badge-confirmed">CONFIRMED</span>
                    <% } else { %>
                        <span class="badge badge-cancelled">CANCELLED</span>
                    <% } %>
                </td>

                <!-- ✅ CANCEL BUTTON -->
                <td>
                <% if ("CONFIRMED".equalsIgnoreCase(b.getStatus())) { %>
                    <a href="<%=request.getContextPath()%>/CancelBookingController?bookingId=<%=b.getBookingId()%>"
                       class="btn btn-sm btn-danger"
                       onclick="return confirmCancel();">
                        Cancel
                    </a>
                <% } else { %>
                    <span class="text-muted">—</span>
                <% } %>
                </td>
            </tr>
        <%
                }
            } else {
        %>
            <tr>
                <td colspan="5" class="text-center text-muted">
                    No bookings found
                </td>
            </tr>
        <%
            }
        %>
        </tbody>
    </table>

    <a href="<%=request.getContextPath()%>/userdashboard.jsp"
       class="btn btn-secondary mt-3">
       ← Back to Dashboard
    </a>

</div>

<!-- ✅ CONFIRMATION POPUP -->
<script>
function confirmCancel() {
    return confirm("Are you sure you want to cancel this booking?");
}
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>