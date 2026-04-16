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

@WebServlet("/ViewApprovedHostelsController")
public class ViewApprovedHostelsController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HostelDAO dao = new HostelDAO();
        List<Hostel> approvedHostels = dao.getApprovedHostels();

        request.setAttribute("hostels", approvedHostels);
        request.getRequestDispatcher("approvedhostels.jsp")
               .forward(request, response);
    }
}