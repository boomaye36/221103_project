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
	@RequestMapping("/admin_goods_view")
	public String adminGoods() {
		return "admin/goods";
	}
	@RequestMapping("/admin_stock_view")
	public String adminStock() {
		return "admin/stock";
	}
}
