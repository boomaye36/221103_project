package com.justlift.enroll.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface EnrollDAO {
	public void insertEnroll(
			@Param("month")int month,
			@Param("userId")int userId,
			@Param("gymId")int gymId);

}
