package com.justlift.review;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.justlift.review.bo.ReviewBO;

@RestController
@RequestMapping("/review")
public class ReviewRestController {
	@Autowired
	private ReviewBO reviewBO;
	@RequestMapping("/create")
	public Map<String, Object> createReview(
			@RequestParam("workoutId") int workoutId,
			@RequestParam("type") String type,
			@RequestParam("title") String title,
			@RequestParam("content") String content,
			@RequestParam("rank") int rank,
			
			Model model, HttpSession session
			){
		Integer userId = (Integer)session.getAttribute("userId");
		reviewBO.addReview(workoutId, type, title, content, rank, userId);
		Map<String, Object> result = new HashMap<>();
		result.put("code", 100);
		return result;
		
	}
	@PostMapping("/delete")
	public Map<String, Object> deleteReview(
			@RequestParam("reviewId") int reviewId){
		reviewBO.deleteReview(reviewId);
		Map<String, Object> result = new HashMap<>();
		result.put("code", 100);
		return result;
	}
	@PostMapping("/review_count_insert")
	public Map<String, Object>reviewCount(
			@RequestParam("reviewId") int reviewId, HttpSession session){
		Integer userId = (Integer) session.getAttribute("userId");
		session.setAttribute("reviewId", reviewId);

		reviewBO.addReviewCount(reviewId, userId);
		Map<String, Object> result = new HashMap<>();
		result.put("code", 100);
		return result;
	}
}
