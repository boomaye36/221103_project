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
	public void addEnroll(int month,int userId, Integer gymId, int newMonth, String dateString) {
		boolean gymCount = enrollDAO.selectGymByGymIdAndUserId(gymId, userId);
//		Enroll enrollMonth = enrollDAO.seletMonthByUserIdAndGymId(userId, gymId);
//		month = enrollMonth.getMonth();
		if (gymCount == true) {
			Enroll enrollMonth = enrollDAO.seletMonthByUserIdAndGymId(userId, gymId);
			month = enrollMonth.getMonth();
			newMonth += month;
		}
		enrollDAO.insertEnroll(month, userId, gymId, newMonth, dateString);
	}
	public List<Enroll> getMyEnrollList(int userId){
		return enrollDAO.selectMyEnrollList(userId);
	}
	public int getMyEnrollCount(int userId) {
		return enrollDAO.selectMyEnrollCount(userId);
	}
	public void deleteEnroll(int enrollId) {
		enrollDAO.deleteEnroll(enrollId);
	}
}
