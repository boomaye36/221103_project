package com.justlift.gym.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.justlift.gym.model.Category;
import com.justlift.gym.model.Gym;
@Repository
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

	public List<Gym> selectGymListByLocationAndCategoryId(
			@Param("categoryId")int categoryId,
			@Param("location")String location);
	
	public Gym selectGymDetailListByGymId(
			@Param("gymId") int gymId);
	public List<Gym> selectGymList();
	
	public List<Gym> selectGymListByUserId(@Param("userId") int userId);
	
	public List<Gym> selectGymLikeListByUserIdAndType(@Param("userId") int userId, @Param("type") String type);
	
	public List<Gym> selectGymListByUserIdAndFromQna(@Param("userId") int userId);

	public List<Gym> getHotGymList();
	
	public List<Gym> selectSearchList(@Param("name") String name, @Param("switchstatus") String switchstatus);
	
	public int selectSearchCount(@Param("name") String name, @Param("switchstatus") String switchstatus);



}
