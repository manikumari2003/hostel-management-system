package com.project.controller;

import java.io.IOException;

import com.project.DAO.BookingDAO;
import com.project.model.Booking;
import com.project.model.User;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/BookHostelController")
public class BookHostelController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {

		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("loggedUser");
		int userId = user.getUserId();
		System.out.println(user.getUserId());
		int hostelId = Integer.parseInt(request.getParameter("hostelId"));
		// String userId=(String) session.getAttribute("user_id");
		System.out.println(hostelId);
		Booking booking = new Booking();
		booking.setUserId(userId);
		booking.setHostelId(hostelId);
		BookingDAO dao = new BookingDAO();

		int roomId = dao.getRoomIdByHostel(hostelId);

		booking.setRoomId(roomId);

		if(dao.bookHostel(booking)) {
			response.sendRedirect("myBookings.jsp");

		}
		else {
			response.sendRedirect("bookHostel.jsp");

		}
	}
}
