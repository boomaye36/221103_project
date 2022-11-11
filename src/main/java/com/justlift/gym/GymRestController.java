package com.justlift.gym;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.justlift.gym.model.Gym;

@RestController
@RequestMapping("/gym")
public class GymRestController {

	@PostMapping("/create")
	public Map<String, Object> gym(
			@RequestParam("location") String location,
			@RequestParam("categoryId") int categoryId,
			HttpServletRequest request){
		Map<String, Object> result = new HashMap<>();
		HttpSession session = request.getSession();
		session.setAttribute("location", location);
		session.setAttribute("categoryId", categoryId);
		List<Gym> gym
		result.put("code", 100);
		return result;
	}
}
