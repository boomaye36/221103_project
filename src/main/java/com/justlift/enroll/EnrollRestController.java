package com.justlift.enroll;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.justlift.enroll.bo.EnrollBO;

@RestController
@RequestMapping("/enroll")

public class EnrollRestController {
	@Autowired
	private EnrollBO enrollBO;
	@RequestMapping("/create")
	public Map<String, Object> createEnroll(@RequestParam("month") int month,@RequestParam("gymId") int gymId,
			HttpSession session) {
		//Integer gymId = (Integer)session.getAttribute("gymId");
		
		Integer userId = (Integer)session.getAttribute("userId");
		Map<String, Object> result = new HashMap<>();
		int newMonth = month;
		enrollBO.addEnroll(month, userId, gymId, newMonth);
		result.put("code", 100);
		return result;
	}
	@RequestMapping("/delete")
	public Map<String, Object> deleteEnroll(@RequestParam("enrollId") int enrollId){
		enrollBO.deleteEnroll(enrollId);
		Map<String, Object> result = new HashMap<>();
		result.put("code", 100);
		return result;

	}
	

}
