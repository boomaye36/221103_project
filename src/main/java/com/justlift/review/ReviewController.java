package com.justlift.review;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.justlift.review.bo.ReviewBO;
import com.justlift.review.model.Review;
import com.justlift.review.model.ReviewCountView;

@Controller
@RequestMapping("/review")
public class ReviewController {
	@Autowired
	private ReviewBO reviewBO;
	@RequestMapping("/view")
	public String reviewView(
			@RequestParam("workoutId") int workoutId,
			@RequestParam("type") String type,
			@RequestParam("gymName") String gymName,
			@RequestParam(value = "sort", required=false) String sort,
			HttpSession session, Model model) {
		//List<Review>gymReviewList = reviewBO.getReveiwListByWorkoutIdAndType(workoutId, type);
		Integer userId = (Integer)session.getAttribute("userId");
		
		List<ReviewCountView> reviewCountList = reviewBO.getReviewCountByWorkoutIdAndTypeAndUserId(workoutId, type, userId, sort);
		model.addAttribute("reviewCountList", reviewCountList);
		
		model.addAttribute("viewName", "gym/gymReview");
		//model.addAttribute("gymReviewList", gymReviewList);
		model.addAttribute("gymName", gymName);
		model.addAttribute("workoutId", workoutId);
		model.addAttribute("type", type);
		String userLoginId = (String)session.getAttribute("userLoginId");
		model.addAttribute("userLoginId", userLoginId);
		return "template/layout";
	}
	@GetMapping("/review_write_view")
	public String reviewWriteView(
			@RequestParam("workoutId") int workoutId,
			@RequestParam("type") String type,	
			@RequestParam("gymName") String gymName,	
			HttpSession session, Model model) {
		model.addAttribute("workoutId", workoutId);
		model.addAttribute("type", type);
		String userLoginId = (String)session.getAttribute("userLoginId");
		Integer userId = (Integer)session.getAttribute("userId");
		//Review review = reviewBO.getReviewIdByWorkoutIdAndType(workoutId,type);
		//model.addAttribute("reviewId", review.getId());
		model.addAttribute("gymName", gymName);
		model.addAttribute("viewName", "gym/gymReviewInsert");
		model.addAttribute("userLoginId", userLoginId);
		model.addAttribute("userId", userId);
		return "template/layout";

	}
	@GetMapping("/review_detail_view")
	public String reviewDetail(
			@RequestParam("reviewId") int reviewId,
			@RequestParam("gymName") String gymName,
			Model model, HttpSession session) {
		Integer userId = (Integer)session.getAttribute("userId");
		int reviewCount = reviewBO.getReviewCountByReviewIdAndUserId(reviewId, userId);
		model.addAttribute("reviewCount", reviewCount);
		List<Review> reviewDetailList = reviewBO.getDetailReviewById(reviewId);
		
		model.addAttribute("reviewDetailList", reviewDetailList);
		model.addAttribute("viewName", "gym/reviewDetail");
		return "template/layout";

	}
	
	
	
}
