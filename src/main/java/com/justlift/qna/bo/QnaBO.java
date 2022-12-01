package com.justlift.qna.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.justlift.comment.model.Comment;
import com.justlift.qna.dao.QnaDAO;
import com.justlift.qna.model.Qna;

@Service
public class QnaBO {
	@Autowired
	private QnaDAO qnaDAO;
	public void insertQna(int userId, int workoutId, String type, String title, String content) {
		qnaDAO.insertQna(userId, workoutId, type, title, content);
	}
	public List<Qna> getQnaListByUserId(int userId){
		return qnaDAO.selectQnaListByUserId(userId);
	}
	public Qna getQnaDetailListById(int id) {
		return qnaDAO.getQnaDetailListById(id);
	}
	public void deleteQnaById( int id) {
		 qnaDAO.deleteQnaById(id);
	}
	public void updateQnaById( int id, String title, String content) {
		qnaDAO.updateQnaById(id, title, content);
	}
	
}
