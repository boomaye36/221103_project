package com.justlift.answer.model;

import java.util.List;

import com.justlift.comment.model.Comment;
import com.justlift.user.model.User;

public class AnswerView {
	private User user;
	private Comment comment;
	private List<Answer> answerList;
	private Answer answer;
	
	public Answer getAnswer() {
		return answer;
	}
	public void setAnswer(Answer answer) {
		this.answer = answer;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Comment getComment() {
		return comment;
	}
	public void setComment(Comment comment) {
		this.comment = comment;
	}
	public List<Answer> getAnswerList() {
		return answerList;
	}
	public void setAnswerList(List<Answer> answerList) {
		this.answerList = answerList;
	}
	
	
}
