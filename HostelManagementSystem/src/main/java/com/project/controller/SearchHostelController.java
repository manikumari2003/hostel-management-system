package com.project.controller;



import java.io.IOException;
import java.util.List;

import com.project.DAO.HostelDAO;
import com.project.model.Hostel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/SearchHostelController")
public class SearchHostelController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HostelDAO dao = new HostelDAO();
        List<Hostel> hostelList = dao.getApprovedHostels();

        request.setAttribute("hostels", hostelList);
        request.getRequestDispatcher("searchHostel.jsp")
               .forward(request, response);
	}

}