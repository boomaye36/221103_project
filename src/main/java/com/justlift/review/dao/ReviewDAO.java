package com.justlift.review.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.justlift.review.model.ReviewCount;
import com.justlift.review.model.Review;

@Repository
public interface ReviewDAO {
	public List<Review> selectGymReveiwListByWorkoutIdAndType(@Param("workoutId") int workoutId, @Param("type") String type);
	
	public void InsertReview(
			@Param("workoutId") int workoutId,
			@Param("type") String type,
			@Param("title") String title,
			@Param("content") String content,
			@Param("rank") int rank,
			@Param("userId") int userId
			);
	
	public List<Review> selectMyReviewByUserId(@Param("userId") int userId);
	
	public void deleteReview(@Param("reviewId") int reviewId); 
	
	public List<Review> selectDetailReviewById(@Param("reviewId") int reviewId);

	public int selectReviewCountByWorkoutidAndType(@Param("userId") int userId,@Param("workoutId") int workoutId,
			@Param("type") String type) ;
	
	public int selectReviewCountByReviewIdAndUserId(@Param("reviewId") int reviewId, @Param("userId") int userId);

	public void insertReviewCount(@Param("reviewId") int reviewId, @Param("userId") int userId);

	public List<ReviewCount> selectReviewCountIdByWorkoutIdAndTypeAndUserId(@Param("workoutId") int workoutId,@Param("type") String type, @Param("userId") int userId); 


}

