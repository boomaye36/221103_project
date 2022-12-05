package com.justlift.review.bo;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.justlift.review.dao.ReviewDAO;
import com.justlift.review.model.Review;
import com.justlift.review.model.ReviewCountView;

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
	public int getReviewCountIdByWorkoutIdAndTypeAndUserId(int workoutId, String type, int userId) {
		
		
		return reviewDAO.selectReviewCountIdByWorkoutIdAndTypeAndUserId(workoutId, type, userId);
	}

	public List<ReviewCountView> getReviewCountByWorkoutIdAndTypeAndUserId(int workoutId, String type, int userId, String sort){
		//System.out.println(sort);
		if (sort.equals("access")) {
			List<ReviewCountView> reviewCountList = new ArrayList<>();
			System.out.println("dfsadfsafas");
			List<Review> reviewList1 = reviewDAO.selectReviewList(workoutId, type, sort);
			for (Review review1 : reviewList1) {
				ReviewCountView reviewCount1 = new ReviewCountView();
				reviewCount1.setReview(review1);
				reviewCount1.setReviewCount(reviewDAO.selectReviewCountByReviewIdAndUserId(review1.getId(), userId ));
				reviewCountList.add(reviewCount1);

			}
			Collections.sort(reviewCountList);
			return reviewCountList;
		}
		else {
			List<ReviewCountView> reviewCountList1 = new ArrayList<>();

		List<Review> reviewList = reviewDAO.selectReviewList(workoutId, type, sort);
		for (Review review : reviewList) {
			ReviewCountView reviewCount = new ReviewCountView();
				reviewCount.setReview(review);
				reviewCount.setReviewCount(reviewDAO.selectReviewCountByReviewIdAndUserId(review.getId(), userId ));
				reviewCountList1.add(reviewCount);
			}
		return reviewCountList1;

		}

	}
}
