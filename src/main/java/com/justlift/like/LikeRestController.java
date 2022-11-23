package com.justlift.like;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.justlift.like.bo.LikeBO;

@RestController
@RequestMapping("/like")
public class LikeRestController {
@Autowired
private LikeBO likeBO;
	@RequestMapping("/{workoutId}")
	public Map<String, Object>like(
			@PathVariable int workoutId,
			@RequestParam("type") String type, HttpSession session, Model model){
		Integer userId = (Integer) session.getAttribute("userId");
		//Like like = likeBO.getLikeIdFromUserId(userId);
		//session.setAttribute("userName", like.getName());
		
			//Integer gymId = (Integer)session.getAttribute("gymId");
			
//			boolean like = likeBO.getHeart(userId, gymId);
//			model.addAttribute("isLike", like);
		Map<String, Object> result = new HashMap<>();
		likeBO.likeToggle(workoutId, userId, type);
		result.put("code", 100);
//		result.put("isLiked", like);
		return result;
		
	}
}
