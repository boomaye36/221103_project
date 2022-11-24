package com.justlift.timeline;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.justlift.enroll.bo.EnrollBO;
import com.justlift.enroll.model.Enroll;
import com.justlift.gym.bo.GymBO;
import com.justlift.gym.model.Gym;
import com.justlift.trainer.bo.TrainerBO;
import com.justlift.trainer.model.Trainer;

@Controller
@RequestMapping("/timeline")
public class TimelineController {
	@Autowired
	private EnrollBO enrollBO;
	@Autowired
	private GymBO gymBO;
	@Autowired
	private TrainerBO trainerBO;
	@RequestMapping("/timeline_view")
	public String timelineView(Model model, HttpSession session) {
		Integer userId = (Integer)session.getAttribute("userId");

		if(userId == null) {
			return "redirect:/user/sign_in_view";
		}
		model.addAttribute("viewName", "timeline/timeline");
		return "template/layout";
	}
	@RequestMapping("/timeline_mypage_view")
	public String timelineMypageView(Model model) {
		//Integer userId = (Integer)session.getAttribute("userId");
		
		
		model.addAttribute("viewName", "timeline/mypage");
			return "template/layout";
	}
	@RequestMapping("/enroll_view")
	public String enrollView(Model model, HttpSession session) {
		Integer userId = (Integer)session.getAttribute("userId");
		List<Enroll> myEnrollList = enrollBO.getMyEnrollList(userId);
		model.addAttribute("myEnrollList",myEnrollList);
		List<Gym> myGymList = gymBO.getGymListByUserId(userId);
		model.addAttribute("myGymList",myGymList);
		model.addAttribute("viewName", "timeline/myGym");
		return "template/layout";
	}
	@GetMapping("/gym_like_view")
	public String gymLikeView(Model model, HttpSession session, @RequestParam("type") String type) {
		Integer userId = (Integer)session.getAttribute("userId");
		List<Gym> LikeGymList = gymBO.getGymLikeListByUserIdAndType(userId, type);
		model.addAttribute("LikeGymList", LikeGymList);
		model.addAttribute("viewName", "timeline/myLike");
		model.addAttribute("type", type);
		return "template/layout";


	}
	@GetMapping("/trainer_like_view")
	public String trainerLikeView(Model model, HttpSession session, @RequestParam("type") String type) {
		Integer userId = (Integer)session.getAttribute("userId");
		List<Trainer> LikeTrainerList = trainerBO.getTrainerLikeListByUserIdAndType(userId, type);
		model.addAttribute("LikeTrainerList", LikeTrainerList);
		model.addAttribute("viewName", "timeline/myLike");
		model.addAttribute("type", type);
		return "template/layout";
		
		
	}
	
}
