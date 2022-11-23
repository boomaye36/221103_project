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
import com.justlift.trainer.bo.TrainerBO;
import com.justlift.trainer.model.Trainer;

@Controller
@RequestMapping("/trainer")
public class TrainerController {
	@Autowired
	private TrainerBO trainerBO;
	@Autowired
	private GymBO gymBO;
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
				Model model) {
			List<Trainer> trainerDetailList = trainerBO.getTrainerDetailListByTrainerId(trainerId);
			model.addAttribute("viewName", "trainer/trainerDetail");
			model.addAttribute("trainerDetailList", trainerDetailList);
			return "template/layout";
		}
	@GetMapping("/gym_detail_view")
	public String gymDetailView(HttpSession session, Model model,
			@RequestParam("gymId") int gymId) {
		Gym detailGym = gymBO.getGymDetailListByGymId(gymId);
		model.addAttribute("gymName", detailGym.getName());
		model.addAttribute("gymImage", detailGym.getImage());
		//model.addAttribute("gymId", detailGym.getId());
		session.setAttribute("gymId", detailGym.getId());
		model.addAttribute("gymIntroduce", detailGym.getIntroduce());
		model.addAttribute("gymPhoneNumber", detailGym.getPhoneNumber());
		model.addAttribute("gymLocation", detailGym.getLocation());
		model.addAttribute("categoryId",detailGym.getCategoryId());
		
		model.addAttribute("viewName", "gym/gymDetailList");

		return "template/layout";

	}
	
}
