package com.justlift.like.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.justlift.like.model.Like;

@Repository
public interface LikeDAO {

	public boolean existLike(
			@Param("workoutId") int workoutId, 
			@Param("userId") int userId,
			@Param("type") String type);
	
	public void insertLike(
			@Param("workoutId") int workoutId, 
			@Param("userId") int userId,
			@Param("type") String type);
	
	public void deleteLikeByWorkoutIdUserId(
			@Param("workoutId") int workoutId, 
			@Param("userId") int userId,
			@Param("type") String type);
	
	public int selectLikeCountByWorkoutIdOrUserId(
			@Param ("workoutId") int workoutId, 
			@Param ("userId")Integer userId,
			@Param("type") String type);
	public int getLikeCountByGymIdAndType(@Param ("gymId") int gymId, @Param("type") String type);
	public void deleteLikeByWorkoutId(@Param("workoutId")int workoutId, @Param("type") String type);

	
	public Like selectLikeIdFromUserId(@Param("userId")int userId);
	
	public boolean selectHeart(@Param("userId")int userId, @Param("gymId")int gymId);
	
	public boolean selectTrainerHeart(@Param("userId")int userId, @Param("trainerId")int trainerId);
	
	public int selectGymLikeCountByUserIdAndType(@Param("userId") int userId, @Param("type")String type);

}
