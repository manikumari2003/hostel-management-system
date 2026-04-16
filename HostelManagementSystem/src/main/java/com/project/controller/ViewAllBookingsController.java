package com.project.controller;

import java.io.IOException;
import java.util.List;

import com.project.DAO.BookingDAO;
import com.project.model.Booking;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ViewAllBookingsController")
public class ViewAllBookingsController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		BookingDAO dao = new BookingDAO();

		List<Booking> bookings = dao.getAllBookings();
		System.out.println("========================");
		request.setAttribute("bookings", bookings);

		request.getRequestDispatcher("viewAllBookings.jsp").forward(request, response);
	}
}