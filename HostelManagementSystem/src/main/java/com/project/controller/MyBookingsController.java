package com.project.controller;

import java.io.IOException;
import java.util.List;

import com.project.DAO.BookingDAO;
import com.project.model.Booking;
import com.project.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/MyBookingsController")
public class MyBookingsController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(false);
		User user = (User) session.getAttribute("loggedUser");

		if (user == null) {
			response.sendRedirect(request.getContextPath() + "/login.jsp");
			return;
		}

		BookingDAO dao = new BookingDAO();
		List<Booking> bookings = dao.getUserBookings(user.getUserId());

		request.setAttribute("bookings", bookings);
		request.getRequestDispatcher("myBookings.jsp").forward(request, response);
	}
}