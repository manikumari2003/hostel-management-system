package com.project.controller;

import java.io.IOException;
import java.util.List;

import com.project.DAO.HostelDAO;
import com.project.model.Hostel;
import com.project.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class MyHostelsController
 */
@WebServlet("/MyHostelsController")
public class MyHostelsController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

    	HttpSession session = req.getSession(false);
        if (session == null) {
            resp.sendRedirect("login.jsp");
            return;
        }

        User owner = (User) session.getAttribute("loggedUser");
        if (owner == null || !"OWNER".equalsIgnoreCase(owner.getRole())) {
            resp.sendRedirect("login.jsp");
            return;
        }

        HostelDAO dao = new HostelDAO();
        List<Hostel> hostels = dao.getHostelsByOwner(owner.getUserId());

        req.setAttribute("hostelList", hostels);
        req.getRequestDispatcher("myHostels.jsp").forward(req, resp);
    }
}
