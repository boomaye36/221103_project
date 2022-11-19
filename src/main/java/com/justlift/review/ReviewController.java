package com.justlift.review;

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
			HttpSession session, Model model) {
		List<Review>gymReviewList = reviewBO.getReveiwListByWorkoutIdAndType(workoutId, type);
		model.addAttribute("viewName", "gym/gymReview");
		model.addAttribute("gymReviewList", gymReviewList);
		model.addAttribute("gymName", gymName);
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
		model.addAttribute("gymName", gymName);
		model.addAttribute("viewName", "gym/gymReviewInsert");
		model.addAttribute("userLoginId", userLoginId);
		model.addAttribute("userId", userId);
		return "template/layout";

	}
	
	
}
