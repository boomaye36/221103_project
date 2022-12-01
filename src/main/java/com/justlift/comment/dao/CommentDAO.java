package com.justlift.comment.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.justlift.comment.model.Comment;

@Repository 
public interface CommentDAO {
	public void insertComment(@Param("qnaId") int qnaId, @Param("userId") int userId, @Param("userLoginId") String userLoginId, @Param("type") String type, @Param("content") String content);
	
	public List<Comment> selectCommentListByQnaIdAndUserid(@Param("id") int id, @Param("userId") int userId);

	public void deleteComment(@Param("id") int id);

}
