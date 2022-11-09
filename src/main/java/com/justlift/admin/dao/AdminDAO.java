package com.justlift.admin.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository

public interface AdminDAO {
	public int insertGym(
			@Param("name") String name,
			@Param("categoryId") int categoryId,
			@Param("location") String location,
			@Param("phoneNumber") String phoneNumber,
			@Param("introduce") String introduce,
			@Param("rank") double rank,
			@Param("imagePath") String imagePath
			);
}
