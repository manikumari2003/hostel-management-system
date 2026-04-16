package com.project.controller;

import java.io.IOException;

import com.project.DAO.HostelDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/RejectHostelController")
public class RejectHostelController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        int hostelId = Integer.parseInt(req.getParameter("hostelId"));
        HostelDAO dao = new HostelDAO();
        dao.updateHostelStatus(hostelId, "REJECTED");

        // Redirect to servlet that loads pending hostels
        resp.sendRedirect(req.getContextPath() + "/ViewPendingHostelsController");
    }
}