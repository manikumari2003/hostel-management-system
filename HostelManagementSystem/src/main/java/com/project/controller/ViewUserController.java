package com.project.controller;

import java.io.IOException;
import java.util.List;

import com.project.DAO.UserDAO;
import com.project.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ViewUsersController")
public class ViewUserController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        UserDAO dao = new UserDAO();
        List<User> users = dao.getAllUsers();

        request.setAttribute("users", users);
        request.getRequestDispatcher("viewUsers.jsp")
               .forward(request, response);
    }
    
}