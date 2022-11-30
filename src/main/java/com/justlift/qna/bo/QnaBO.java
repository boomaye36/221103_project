package com.justlift.qna.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.justlift.qna.dao.QnaDAO;

@Service
public class QnaBO {
	@Autowired
	private QnaDAO qnaDAO;
	public void insertQna(int userId, int workoutId, String type, String title, String content) {
		qnaDAO.insertQna(userId, workoutId, type, title, content);
	}
}
