package com.justlift.review.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.justlift.review.dao.ReviewDAO;
import com.justlift.review.model.Review;

@Service
public class ReviewBO {
	@Autowired 
	private ReviewDAO reviewDAO;
	public List<Review> getReveiwListByWorkoutIdAndType(int workoutId, String type){
		return reviewDAO.selectGymReveiwListByWorkoutIdAndType(workoutId, type);
	}
	public void addReview(int workoutId, String type, String content, int userId) {
		reviewDAO.InsertReview(workoutId, type, content, userId);
	}
}
