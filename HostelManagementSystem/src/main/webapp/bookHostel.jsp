<%@ page import="com.project.model.User" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<%
User user = (User) session.getAttribute("loggedUser");
if (user == null || !"USER".equalsIgnoreCase(user.getRole())) {
    response.sendRedirect("../login.jsp");
    return;
}

String hostelId = request.getParameter("hostelId");
String hostelName = request.getParameter("hostelName");
String location = request.getParameter("location");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book Hostel</title>
</head>
<body>

<h2>Confirm Hostel Booking</h2>

<form action="../BookHostelController" method="get">

    <input type="hidden" name="hostelId" value="<%= hostelId %>">

    <p><b>Hostel Name:</b> <%= hostelName %></p>
    <p><b>Location:</b> <%= location %></p>

    <br>

    <input type="submit" value="Confirm Booking">

</form>

<br>
<a href="searchHostel.jsp">Cancel</a>

</body>
</html>
