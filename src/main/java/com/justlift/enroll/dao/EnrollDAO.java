package com.justlift.enroll.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.justlift.enroll.model.Enroll;

@Repository
public interface EnrollDAO {
	public void insertEnroll(
			@Param("month")int month,
			@Param("userId")int userId,
			@Param("gymId")int gymId,
			@Param("newMonth")int newMonth);

	public List<Enroll> selectMyEnrollList(@Param("userId")int userId);
	
	public int selectMyEnrollCount(@Param("userId") int userId);
}
