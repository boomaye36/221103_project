package com.justlift.review;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
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
			@RequestParam("content") String content,
			Model model, HttpSession session
			){
		Integer userId = (Integer)session.getAttribute("userId");
		reviewBO.addReview(workoutId, type, content, userId);
		Map<String, Object> result = new HashMap<>();
		result.put("code", 100);
		return result;
		
	}
}
