package com.justlift.comment.model;

import java.util.List;

import com.justlift.user.model.User;

public class SecondComment {
	
	private List<Comment> commentList;
	private Comment comment;
	private User user;
	public Comment getComment() {
		return comment;
	}
	public void setComment(Comment comment) {
		this.comment = comment;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public List<Comment> getCommentList() {
		return commentList;
	}
	public void setCommentList(List<Comment> commentList) {
		this.commentList = commentList;
	}
	
	
}
