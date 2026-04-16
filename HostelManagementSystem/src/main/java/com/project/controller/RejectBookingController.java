package com.project.controller;

import java.io.IOException;

import com.project.DAO.BookingDAO;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/RejectBookingController")
public class RejectBookingController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {

		int bookingId = Integer.parseInt(request.getParameter("bookingId"));

		BookingDAO dao = new BookingDAO();
		dao.updateStatus(bookingId, "CANCELLED");

		response.sendRedirect(request.getContextPath() + "/ViewAllBookingsController");
	}
}