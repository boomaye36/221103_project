package com.justlift.gym;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.justlift.gym.bo.GymBO;
import com.justlift.gym.model.Category;

@RestController
@RequestMapping("/gym")
public class GymRestController {
@Autowired
private GymBO gymBO;
	@PostMapping("/create")
	public Map<String, Object> gym(
			@RequestParam("location") String location,
			@RequestParam("categoryId") int categoryId,
			HttpSession session){
		Map<String, Object> result = new HashMap<>();
		Category category = gymBO.getCategoryNameByCategoryId(categoryId);
		//HttpSession session = request.getSession();
		//session.setAttribute("location", location);
		//session.setAttribute("categoryId", categoryId);
		session.setAttribute("categoryName", category.getCategory());
		System.out.println("categoryId = " + categoryId);
		int count = gymBO.getGymListByLocationAndCategoryId(categoryId, location);
		//List<Gym> ()
		if (count > 0) {
			result.put("code", 100);
		}else {
			result.put("code", 400);
			result.put("errorMessage", "글 수정에 실패했습니다.");
		}		return result;
	}
}
