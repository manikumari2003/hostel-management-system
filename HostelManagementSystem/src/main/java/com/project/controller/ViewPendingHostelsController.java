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

@WebServlet("/ViewPendingHostelsController")
public class ViewPendingHostelsController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HostelDAO dao = new HostelDAO();
        List<Hostel> hostels = dao.getPendingHostels();

        // ✅ Forward to the correct JSP file
        request.setAttribute("hostels", hostels);
        request.getRequestDispatcher("viewPendingHostels.jsp")
               .forward(request, response);
    }
}