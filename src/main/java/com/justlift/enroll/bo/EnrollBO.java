package com.justlift.enroll.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.justlift.enroll.dao.EnrollDAO;
import com.justlift.enroll.model.Enroll;

@Service
public class EnrollBO {
	@Autowired
	private EnrollDAO enrollDAO;
	public void addEnroll(int month,int userId, int gymId, int newMonth) {
		if (gymId == null) {
			newMonth += month;
		}
		enrollDAO.insertEnroll(month, userId, gymId, newMonth);
	}
	public List<Enroll> getMyEnrollList(int userId){
		return enrollDAO.selectMyEnrollList(userId);
	}
	public int getMyEnrollCount(int userId) {
		return enrollDAO.selectMyEnrollCount(userId);
	}
}
