package com.justlift.gym.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.justlift.gym.model.Category;
import com.justlift.gym.model.Gym;

public interface GymDAO {
	public List<Gym> selectGymListByLocationAndCategory(
			@Param("categoryId") int categoryId,
			@Param("location") String location,
			@Param("standardId") Integer standardId,
			@Param("direction") String direction, 
			@Param("limit") int limit);
	
	public int selectPostIdByCategoryIdAndSort(
			@Param("categoryId") int categoryId,
			@Param("sort")String sort);

	public Category selectCategoryNameByCategoryId(
			@Param("categoryId")int categoryId);

	public int selectGymListByLocationAndCategoryId(
			@Param("categoryId")int categoryId,
			@Param("location")String location);
}
