package com.project.controller;

import java.io.IOException;
import java.time.LocalDate;

import com.project.DAO.BookingDAO;
import com.project.DAO.HostelDAO;
import com.project.model.Booking;
import com.project.model.Hostel;
import com.project.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/ConfirmBookingController")
public class ConfirmBookingController extends HttpServlet {

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int hostelId = Integer.parseInt(request.getParameter("hostelId"));

		HostelDAO hostelDAO = new HostelDAO();
		Hostel hostel = hostelDAO.getHostelById(hostelId);

		request.setAttribute("hostel", hostel);

		request.getRequestDispatcher("confirmBooking.jsp").forward(request, response);
	}

	// SAVE BOOKING
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(false);

		
		if (session == null) {
			response.sendRedirect("login.jsp");
			return;
		}

		User user = (User) session.getAttribute("loggedUser");

		if (user == null) {
			response.sendRedirect("login.jsp");
			return;
		}

		int hostelId = Integer.parseInt(request.getParameter("hostelId"));

		Booking booking = new Booking();
		booking.setUserId(user.getUserId());
		booking.setHostelId(hostelId);
		booking.setBookingDate(LocalDate.now());
		booking.setStatus("PENDING");

		BookingDAO dao = new BookingDAO();
		dao.bookHostel(booking);

		response.sendRedirect(request.getContextPath() + "/MyBookingsController");
	}
}