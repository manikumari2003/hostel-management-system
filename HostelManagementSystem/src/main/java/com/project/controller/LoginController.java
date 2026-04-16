package com.project.controller;

import java.io.IOException;

import com.project.DAO.UserDAO;
import com.project.DAO.UserDAOInterface;
import com.project.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/LoginController")
public class LoginController extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String email = request.getParameter("email");
		String password = request.getParameter("password");

		UserDAOInterface dao = new UserDAO();
		User user = dao.login(email, password);

		if (user != null) {

			HttpSession session = request.getSession();
			session.setAttribute("loggedUser", user);

			if ("ADMIN".equalsIgnoreCase(user.getRole())) {
				response.sendRedirect("admindashboard.jsp");

			} else if ("OWNER".equalsIgnoreCase(user.getRole())) {
				response.sendRedirect("ownerdashboard.jsp");

			} else {
				response.sendRedirect("userdashboard.jsp");

			}

		} else {

			response.sendRedirect("login.jsp?error=invalid");
		}
	}
}