package com.justlift.trainer;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.justlift.trainer.bo.TrainerBO;
import com.justlift.trainer.model.Trainer;

@Controller
@RequestMapping("/trainer")
public class TrainerController {
	@Autowired
	private TrainerBO trainerBO;
	@GetMapping("/trainer_view")
	public String trainerView(HttpSession session, Model model,
			@RequestParam("area") String area, 
			@RequestParam("categoryId") int categoryId) {
		
		List<Trainer> trainerList = trainerBO.getTrainerListByAreaAndCategoryId(area, categoryId);
		model.addAttribute("trainerList", trainerList);
		model.addAttribute("viewName", "trainer/trainer");
		return "template/layout";
		
	}
}
