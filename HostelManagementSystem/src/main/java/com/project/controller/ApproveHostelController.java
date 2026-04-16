package com.project.controller;

import java.io.IOException;

import com.project.DAO.HostelDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ApproveHostelController")
public class ApproveHostelController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        int hostelId = Integer.parseInt(req.getParameter("hostelId"));
        HostelDAO dao = new HostelDAO();
        dao.updateHostelStatus(hostelId, "APPROVED");

        // Redirect to servlet that loads pending hostels
        resp.sendRedirect(req.getContextPath() + "/ViewPendingHostelsController");
    }
}
