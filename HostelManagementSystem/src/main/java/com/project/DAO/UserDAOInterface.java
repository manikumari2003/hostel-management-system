package com.project.DAO;

import com.project.model.User;

public interface UserDAOInterface {
	User login(String email, String password);

	boolean register(User user);
}
