package com.justlift.trainer;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.justlift.gym.bo.GymBO;
import com.justlift.gym.model.Gym;
import com.justlift.like.bo.LikeBO;
import com.justlift.trainer.bo.TrainerBO;
import com.justlift.trainer.model.Trainer;

@Controller
@RequestMapping("/trainer")
public class TrainerController {
	@Autowired
	private TrainerBO trainerBO;
	@Autowired
	private GymBO gymBO;
	@Autowired
	private LikeBO likeBO;
	@GetMapping("/trainer_view")
	public String trainerView(HttpSession session, Model model,
			@RequestParam("area") String area, 
			@RequestParam("categoryId") int categoryId) {
		
		List<Trainer> trainerList = trainerBO.getTrainerListByAreaAndCategoryId(area, categoryId);
		model.addAttribute("trainerList", trainerList);
		model.addAttribute("viewName", "trainer/trainer");
		return "template/layout";
		
	}
	@GetMapping("/trainer_detail_view")
		
		public String trainerDetailView(
				@RequestParam("trainerId") int trainerId,
				Model model, HttpSession session) {
			List<Trainer> trainerDetailList = trainerBO.getTrainerDetailListByTrainerId(trainerId);
			Integer userId = (Integer) session.getAttribute("userId");
			boolean like = likeBO.getTrainerHeart(userId, trainerId);
			String type = "trainer";
			int likeCount = likeBO.getLikeCountByGymIdAndType(trainerId, type);
			model.addAttribute("likeCount", likeCount);
			model.addAttribute("isLike", like);
			model.addAttribute("viewName", "trainer/trainerDetail");
			model.addAttribute("trainerDetailList", trainerDetailList);
			return "template/layout";
		}
	
	@GetMapping("/trainer_view1")
	public String trainerViewByGym(Model model,
			@RequestParam("gymId") int gymId) {
		List<Trainer> trainerList = trainerBO.getTrainerListByGymId(gymId);
		model.addAttribute("trainerList", trainerList);
		model.addAttribute("viewName", "trainer/trainer");
		return "template/layout";
		
	}
	@GetMapping("/gym_detail_view")
	public String gymDetailView(Model model, HttpSession session,
			@RequestParam ("gymId") int gymId
			) {
		model.addAttribute("viewName", "gym/gymDetailList");
		Gym detailGym = gymBO.getGymDetailListByGymId(gymId);
		model.addAttribute("gymName", detailGym.getName());
		model.addAttribute("gymImage", detailGym.getImage());
		//session.setAttribute("gymId", detailGym.getId());
		Integer userId = (Integer) session.getAttribute("userId");
		//Integer gymId = (Integer)session.getAttribute("gymId");
		boolean like = likeBO.getHeart(userId, gymId);
		String type = "gym";
		int likeCount = likeBO.getLikeCountByGymIdAndType(gymId, type);
		model.addAttribute("isLike", like);
		model.addAttribute("likeCount", likeCount);
		model.addAttribute("gymIntroduce", detailGym.getIntroduce());
		model.addAttribute("gymPhoneNumber", detailGym.getPhoneNumber());
		model.addAttribute("gymLocation", detailGym.getLocation());
		model.addAttribute("categoryId",detailGym.getCategoryId());
		//model.addAttribute("location", location);
		model.addAttribute("gymId", gymId);
		return "template/layout";
		
	}

	
}
