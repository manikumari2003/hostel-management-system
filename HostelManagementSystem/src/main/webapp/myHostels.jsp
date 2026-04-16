<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.project.model.Hostel" %>
<%@ page import="com.project.model.User" %>
<%@ include file="header.jsp" %>

<%
    List<Hostel> hostelList = (List<Hostel>) request.getAttribute("hostelList");
%>

<h2 style="text-align:center; margin-top:20px;">My Hostels</h2>

<%
    if (hostelList == null || hostelList.isEmpty()) {
%>
    <p style="text-align:center;">You have not added any hostels yet.</p>
<%
    } else {
%>

<table style="border-collapse: collapse; width: 90%; margin: 20px auto; background: white; box-shadow: 0px 2px 5px rgba(0,0,0,0.2);">
    <tr style="background-color:#4CAF50; color:white;">
        <th>ID</th>
        <th>Name</th>
        <th>Location</th>
        <th>Address</th>
        <th>Type</th>
        <th>Price</th>
        <th>Status</th>
        <th>Actions</th>
    </tr>
    <%
        for (Hostel h : hostelList) {
    %>
    <tr>
        <td><%= h.getHostelId() %></td>
        <td><%= h.getHostelName() %></td>
        <td><%= h.getLocation() %></td>
        <td><%= h.getAddress() %></td>
        <td><%= h.getHostelType() %></td>
        <td><%= h.getPrice() %></td>
        <td><%= h.getStatus() %></td>
        <td>
            <a class="button" href="EditHostelController?hostelId=<%= h.getHostelId() %>">Edit</a>
            <a class="button delete" href="DeleteHostelController?hostelId=<%= h.getHostelId() %>">Delete</a>
        </td>
    </tr>
    <%
        }
    %>
</table>
<%
    }
%>

<style>
    a.button {
        padding: 5px 10px;
        background-color: #4CAF50;
        color: white;
        text-decoration: none;
        border-radius: 4px;
        margin: 2px;
    }
    a.button.delete {
        background-color: #f44336;
    }
</style>