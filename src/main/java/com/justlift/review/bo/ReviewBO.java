package com.justlift.review.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.justlift.review.model.ReviewCount;
import com.justlift.review.dao.ReviewDAO;
import com.justlift.review.model.Review;

@Service
public class ReviewBO {
	@Autowired 
	private ReviewDAO reviewDAO;
	public List<Review> getReveiwListByWorkoutIdAndType(int workoutId, String type){
		return reviewDAO.selectGymReveiwListByWorkoutIdAndType(workoutId, type);
	}
	public void addReview(int workoutId, String type, String title, String content, int rank, int userId) {
		reviewDAO.InsertReview(workoutId, type,title, content,rank, userId);
	}
	public List<Review> getMyReviewByUserId(int userId){
		return reviewDAO.selectMyReviewByUserId(userId);
	}
	public void deleteReview(int reviewId) {
		reviewDAO.deleteReview(reviewId);
	}
	public List<Review> getDetailReviewById(int reviewId){
		return reviewDAO.selectDetailReviewById(reviewId);
	}
	public int getReviewCountByWorkoutidAndType(int userId ,int workoutId, String type) {
		return reviewDAO.selectReviewCountByWorkoutidAndType(userId, workoutId, type);
	}
	public int getReviewCountByReviewIdAndUserId(int reviewId, int userId) {
		return reviewDAO.selectReviewCountByReviewIdAndUserId(reviewId, userId);
	}
	public void addReviewCount(int reviewId, int userId) {
		reviewDAO.insertReviewCount(reviewId, userId);
	}
	public List<ReviewCount> getReviewCountIdByWorkoutIdAndTypeAndUserId(int workoutId, String type, int userId) {
		return reviewDAO.selectReviewCountIdByWorkoutIdAndTypeAndUserId(workoutId, type, userId);
	}
}
