package com.justlift.answer.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.justlift.answer.model.Answer;

@Repository
public interface AnswerDAO {
	public void insertAnswer(@Param("qnaId") int qnaId, @Param("commentId") int commentId, @Param("userId") int userId, @Param("userLoginId") String userLoginId, @Param("content") String content);
	
	public List<Answer> selectAnswerListByCommentIdAndUserId(@Param("commentId") int commentId, @Param("userId") int userId);
}
