package com.justlift.like.model;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/like")
public class LikeRestController {

	@RequestMapping("/{workoutId}")
	public Map<String, Object>like(
			@PathVariable int workoutId,
			@RequestParam("type") String type, HttpSession session){
		Integer userId = (Integer) session.getAttribute("userId");
		
		
	}
}
