package com.justlift.comment.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.justlift.comment.dao.CommentDAO;
import com.justlift.comment.model.Comment;

@Service
public class CommentBO {
	@Autowired
	private CommentDAO commentDAO;
	public void putComment(int qnaId,int userId,String userLoginId,String type, String content ) {
		commentDAO.insertComment(qnaId, userId, userLoginId,type, content);
	}
	public List<Comment> getCommentListByQnaIdAndUserid(int id, int userId){
		return commentDAO.selectCommentListByQnaIdAndUserid(id, userId);
	}
	public void deleteComment(int id) {
		commentDAO.deleteComment(id);
	}
}
