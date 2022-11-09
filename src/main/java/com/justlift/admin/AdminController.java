package com.justlift.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@RequestMapping("/admin")
@Controller
public class AdminController {
	@RequestMapping("/admin_gym_view")
	public String adminGym() {
		return "admin/gym";
	}
	@RequestMapping("/admin_trainer_view")
	public String adminTrainer() {
		return "admin/trainer";
	}
}
