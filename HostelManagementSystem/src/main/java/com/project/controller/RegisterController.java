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


@WebServlet("/RegisterController")
public class RegisterController extends HttpServlet {
//	private static final long serialVersionUID = 1L;
  
    

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		String role=request.getParameter("role");
		
		User user=new User();
		user.setName(name);
		user.setEmail(email);
		user.setPassword(password);
		user.setRole(role);
		
		UserDAOInterface ud=new UserDAO();
		boolean status =ud.register(user);
		if(status) {
			response.sendRedirect("login.jsp?msg=registered");
		}else {
			response.sendRedirect("register.jsp?error=failed");
		}
		
		
	}

}
