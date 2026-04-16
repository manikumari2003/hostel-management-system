package com.project.controller;

import java.io.IOException;

import com.project.DAO.HostelDAO;
import com.project.model.Hostel;
import com.project.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/AddHostelController")
public class AddHostelController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("loggedUser");

        if (user == null) {
            resp.sendRedirect("login.jsp");
            return;
        }

        Hostel hostel = new Hostel();
        hostel.setOwnerId(user.getUserId());
        hostel.setHostelName(req.getParameter("hostelName"));
        hostel.setLocation(req.getParameter("location"));
        hostel.setAddress(req.getParameter("address"));
        hostel.setHostelType(req.getParameter("hostelType"));

        // Price parsing
        String priceStr = req.getParameter("price");
        double price = 0;
        if(priceStr != null && !priceStr.isEmpty()) {
            price = Double.parseDouble(priceStr);
        }
        hostel.setPrice(price);

        hostel.setStatus("PENDING");  // Always set to PENDING initially

        HostelDAO dao = new HostelDAO();
        boolean result = dao.addHostel(hostel);

        if (result) {
            resp.sendRedirect(req.getContextPath() + "/owneraddHostel.jsp?msg=success");
        } else {
            resp.sendRedirect(req.getContextPath() + "/owneraddHostel.jsp?error=true");
        }

    }
}