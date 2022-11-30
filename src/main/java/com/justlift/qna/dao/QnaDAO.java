package com.justlift.qna.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface QnaDAO {
	public void insertQna(@Param("userId")int userId,@Param("workoutId") int workoutId,@Param("type") String type,@Param("title") String title,@Param("content") String content);
	
}
