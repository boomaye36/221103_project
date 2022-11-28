package com.justlift.user.bo;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.justlift.user.dao.UserDAO;
import com.justlift.user.model.User;

@Service
public class UserBO {
	@Autowired
	private UserDAO userDAO;
	public int existingLoginId(String userId) {
		return userDAO.existingLoginId(userId);

	}
	public void addUser(String userId, String userPw, String name, String email, String phoneNumber) {
		userDAO.insertUser(userId, userPw, name, email, phoneNumber);
	}
	public User getUserByUserIdandPassword(String loginId, String password) {
		return userDAO.selectUserByUserIdandPassword(loginId, password);
	}
	
	public int getDdayFromUser(int userId) {
		 return userDAO.selectDdayFromUser(userId);
		
	}
	
}
