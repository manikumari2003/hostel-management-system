<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>\
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    
   // <%
//User user = (User) session.getAttribute("user");

//if(user == null || !user.getRole().equals("OWNER")){
    //response.sendRedirect("../login.jsp");
//}
//%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>Welcome Hostel Owner</h2>

<ul>
    <li><a href="addHostel.jsp">Add Hostel</a></li>
    <li><a href="viewMyHostels.jsp">My Hostels</a></li>
    <li><a href="viewBookings.jsp">View Bookings</a></li>
    <li><a href="../logout.jsp">Logout</a></li>
</ul>

</body>
</html>