<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="com.project.model.Hostel"%>

<%
Hostel hostel = (Hostel) request.getAttribute("hostel");
%>

<!DOCTYPE html>
<html>
<head>
<title>Confirm Booking</title>

<style>
body {
	font-family: Arial;
	background: #f4f6f9;
}

.container {
	width: 400px;
	margin: 80px auto;
	background: white;
	padding: 30px;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h2 {
	text-align: center;
}

.details {
	margin-top: 20px;
}

.details p {
	font-size: 16px;
}

button {
	width: 100%;
	padding: 12px;
	background: #2ecc71;
	border: none;
	color: white;
	font-size: 16px;
	border-radius: 5px;
	cursor: pointer;
}

button:hover {
	background: #27ae60;
}
</style>

</head>

<body>

	<div class="container">

		<h2>Confirm Booking</h2>

		<div class="details">

			<p>
				<b>Hostel Name:</b>
				<%=hostel.getHostelName()%></p>

			<p>
				<b>Location:</b>
				<%=hostel.getLocation()%></p>

			<p>
				<b>Price:</b> ₹<%=hostel.getPrice()%></p>

		</div>

		<!-- 🔹 BOOKING FORM -->

		<form action="ConfirmBookingController" method="post">

			<input type="hidden" name="hostelId"
				value="<%=hostel.getHostelId()%>"> <br>

			<button type="submit">Confirm Booking</button>

		</form>

	</div>

</body>
</html>