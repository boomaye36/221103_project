package com.justlift.gym;

import java.util.HashMap;
//import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.justlift.gym.bo.GymBO;
import com.justlift.gym.model.Category;
//import com.justlift.gym.model.Gym;

@RestController
@RequestMapping("/gym")
public class GymRestController {
@Autowired
private GymBO gymBO;
	@PostMapping("/create")
	public Map<String, Object> gym(
			@RequestParam("location") String location,
			@RequestParam("categoryId") int categoryId,
			HttpSession session,
			Model model){
		Map<String, Object> result = new HashMap<>();
		Category category = gymBO.getCategoryNameByCategoryId(categoryId);
		//HttpSession session = request.getSession();
		session.setAttribute("location", location);
		session.setAttribute("categoryId", categoryId);
		model.addAttribute("categoryName", category.getCategory());
		//List<Gym> count = gymBO.getGymListByLocationAndCategoryId(categoryId, location);
		//List<Gym> ()
	
			result.put("code", 100);
				return result;
	}
}
