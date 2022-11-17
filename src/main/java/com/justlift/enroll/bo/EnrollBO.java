package com.justlift.enroll.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.justlift.enroll.dao.EnrollDAO;

@Service
public class EnrollBO {
	@Autowired
	private EnrollDAO enrollDAO;
	public void addEnroll(int month,int userId, int gymId) {
		enrollDAO.insertEnroll(month, userId, gymId);
	}
}
