package com.justlift.qna.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.justlift.comment.model.Comment;
import com.justlift.qna.model.Qna;

@Repository
public interface QnaDAO {
	public void insertQna(@Param("userId")int userId,@Param("workoutId") int workoutId,@Param("type") String type,@Param("title") String title,@Param("content") String content);
	
	public List<Qna> selectQnaListByUserId(@Param("userId") int userId);

	public Qna getQnaDetailListById(@Param("id") int id);

	public void deleteQnaById(@Param("id") int id);
	public void updateQnaById(@Param("id") int id, @Param("title") String title, @Param("content") String content);
	

}
