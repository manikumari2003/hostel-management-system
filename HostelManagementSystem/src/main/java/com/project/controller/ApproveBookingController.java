package com.project.controller;

import java.io.IOException;

import com.project.DAO.BookingDAO;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ApproveBookingController")
public class ApproveBookingController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {

		int bookingId = Integer.parseInt(request.getParameter("bookingId"));
		System.out.println("--------------------------------"+bookingId);
		BookingDAO dao = new BookingDAO();
		dao.updateStatus(bookingId, "CONFIRMED");

		response.sendRedirect(request.getContextPath() + "/ViewAllBookingsController");
	}
}