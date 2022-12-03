package com.justlift.answer.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.justlift.answer.dao.AnswerDAO;
import com.justlift.answer.model.Answer;
import com.justlift.answer.model.AnswerView;
import com.justlift.comment.bo.CommentBO;
import com.justlift.comment.model.Comment;

@Service
public class AnswerBO {
	@Autowired
	private AnswerDAO answerDAO;
	@Autowired
	private CommentBO commentBO;
	public void putAnswer(int qnaId, int commentId, int userId, String userLoginId, String content) {
		 answerDAO.insertAnswer(qnaId, commentId, userId, userLoginId, content);
	}
	public List<AnswerView> getAnswerViewList(int userId, Integer commentId, int id){
		List<AnswerView> answerViewList = new ArrayList<>();
		List<Comment> commentList = commentBO.getCommentListByQnaIdAndUserid(id, userId);
		for (Comment comment : commentList) {
			AnswerView answerview = new AnswerView();
			answerview.setComment(comment);
			List<Answer> answerList = answerDAO.selectAnswerListByCommentIdAndUserId(comment.getId(), userId);
			answerview.setAnswerList(answerList);
			//Answer answers = answerDAO.selectAnswerListByCommentIdAndUserId(comment.getId(), userId);
			//answerview.setAnswer(answers);
			
			answerViewList.add(answerview);
			
		}
		return answerViewList;
	}
	
	public List<Answer> getAnswerListByCommentIdAndUserId(Integer commentId, int userId){
		return answerDAO.selectAnswerListByCommentIdAndUserId(commentId, userId);
	}
	
	public void deleteAnswer(int id) {
		answerDAO.deleteAnswer(id);
	}
}
