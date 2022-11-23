package com.justlift.like;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.justlift.like.bo.LikeBO;

@Controller
public class LikeController {
	@Autowired
	private LikeBO likeBO;
	@RequestMapping("/gym/like")
	public String gymLike(HttpSession session, Model model) {
		Integer userId = (Integer) session.getAttribute("userId");
		Integer gymId = (Integer)session.getAttribute("gymId");
		boolean like = likeBO.getHeart(userId, gymId);
		model.addAttribute("isLike", like);
		model.addAttribute("viewName", "gym/gymDetailList");
		return "template/layout";

	}
	
}
