package com.justlift.review.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.justlift.review.model.Review;

@Repository
public interface ReviewDAO {
	public List<Review> selectGymReveiwListByWorkoutIdAndType(@Param("workoutId") int workoutId, @Param("type") String type);
	
	public void InsertReview(
			@Param("workoutId") int workoutId,
			@Param("type") String type,
			@Param("content") String content,
			@Param("rank") int rank,
			@Param("userId") int userId
			);
}

