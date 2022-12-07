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
import com.justlift.like.bo.LikeBO;
import com.justlift.review.bo.ReviewBO;
import com.justlift.review.model.Review;
import com.justlift.trainer.bo.TrainerBO;
import com.justlift.trainer.model.Trainer;
import com.justlift.user.bo.UserBO;

@Controller
@RequestMapping("/timeline")
public class TimelineController {
	@Autowired
	private EnrollBO enrollBO;
	@Autowired
	private GymBO gymBO;
	@Autowired
	private TrainerBO trainerBO;
	@Autowired
	private ReviewBO reviewBO;
	@Autowired
	private LikeBO likeBO;
	@Autowired
	private UserBO userBO;
	@RequestMapping("/timeline_view")
	public String timelineView(Model model, HttpSession session) {
		//Integer userId = (Integer)session.getAttribute("userId");

		
		model.addAttribute("viewName", "timeline/timeline");
		return "template/layout";
	}
	@GetMapping("/timeline_mypage_view")
	public String timelineMypageView(Model model, HttpSession session , @RequestParam(value = "amount", required=false) Integer amount) {
		Integer userId = (Integer)session.getAttribute("userId");
		if(userId == null) {
			return "redirect:/user/sign_in_view";
		}
		int dday = userBO.getDdayFromUser(userId);
		model.addAttribute("amountPrice", amount);
		List<Trainer> hotTrainerList = trainerBO.getTrainerList();
		model.addAttribute("hotTrainerList", hotTrainerList);
		List<Gym> hotGymList = gymBO.getHotGymList();
		model.addAttribute("hotGymList", hotGymList);
		model.addAttribute("dday", dday);
		model.addAttribute("viewName", "timeline/mypage");
			return "template/layout";
	}
	@RequestMapping("/enroll_view")
	public String enrollView(Model model, HttpSession session) {
		Integer userId = (Integer)session.getAttribute("userId");
		List<Enroll> myEnrollList = enrollBO.getMyEnrollList(userId);
		model.addAttribute("myEnrollList",myEnrollList);
		List<Gym> myGymList = gymBO.getGymListByUserId(userId);
		int enrollCount = enrollBO.getMyEnrollCount(userId);
		model.addAttribute("enrollCount", enrollCount);
		model.addAttribute("myGymList",myGymList);
		model.addAttribute("viewName", "timeline/myGym");
		return "template/layout";
	}
	@GetMapping("/gym_like_view")
	public String gymLikeView(Model model, HttpSession session, @RequestParam("type") String type) {
		Integer userId = (Integer)session.getAttribute("userId");
		List<Gym> LikeGymList = gymBO.getGymLikeListByUserIdAndType(userId, type);
		int LikeCount = likeBO.getGymLikeCountByUserIdAndType(userId, type);
		model.addAttribute("LikeGymList", LikeGymList);
		model.addAttribute("LikeCount", LikeCount);
		model.addAttribute("viewName", "timeline/myLike");
		model.addAttribute("type", type);
		return "template/layout";


	}
	@GetMapping("/trainer_like_view")
	public String trainerLikeView(Model model, HttpSession session, @RequestParam("type") String type) {
		Integer userId = (Integer)session.getAttribute("userId");
		List<Trainer> LikeTrainerList = trainerBO.getTrainerLikeListByUserIdAndType(userId, type);
		int LikeCount = likeBO.getGymLikeCountByUserIdAndType(userId, type);
		model.addAttribute("LikeCount", LikeCount);

		model.addAttribute("LikeTrainerList", LikeTrainerList);
		model.addAttribute("viewName", "timeline/myLike");
		model.addAttribute("type", type);
		return "template/layout";
		
		
	}
	@RequestMapping("/myReview")
	public String myReviewView(Model model, HttpSession session) {
		Integer userId = (Integer)session.getAttribute("userId");
		List<Review> myReview = reviewBO.getMyReviewByUserId(userId);
		model.addAttribute("myReview", myReview);
		model.addAttribute("viewName", "timeline/myReview");
		return "template/layout";

	}
	
}
