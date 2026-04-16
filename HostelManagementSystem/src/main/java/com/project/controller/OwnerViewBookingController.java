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

@WebServlet("/OwnerViewBookings")
public class OwnerViewBookingController extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();
		User owner = (User) session.getAttribute("loggedUser");

		if (owner == null || !"OWNER".equalsIgnoreCase(owner.getRole())) {
			resp.sendRedirect("unauthorized.jsp");
			return;
		}

		BookingDAO dao = new BookingDAO();
		List<Booking> bookings = dao.getBookingsByOwner(owner.getUserId());

		req.setAttribute("bookings", bookings);
		req.getRequestDispatcher("ownerBookings.jsp").forward(req, resp);
	}
}