package com.project.controller;

import java.io.IOException;

import com.project.DAO.BookingDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/CancelBookingController")
public class CancelBookingController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int bookingId = Integer.parseInt(request.getParameter("bookingId"));

		BookingDAO dao = new BookingDAO();
		dao.cancelBooking(bookingId);

		response.sendRedirect(request.getContextPath() + "/MyBookingsController");
	}
}