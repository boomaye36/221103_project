package com.justlift.user;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.justlift.user.bo.UserBO;
import com.justlift.user.model.User;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserBO userBO;
	@RequestMapping("/sign_up_view")
	public String signUpView(Model model) {
		model.addAttribute("viewName", "user/signUp");
		return "template/layout";
	}
	@RequestMapping("/sign_in_view")
	public String signInView(Model model) {
		model.addAttribute("viewName", "user/signIn");
		return "template/layout";
	}
	@RequestMapping("/sign_out")
	public String signOut(HttpSession session) {
		session.removeAttribute("userName");
		session.removeAttribute("userLoginId");
		session.removeAttribute("userId");
		return "redirect:/user/sign_in_view"; 
	}
	
	@RequestMapping("/find_id")
	public String findId(Model model) {
		model.addAttribute("viewName", "user/findId");
		return "template/layout";
	}
	@GetMapping("/show_id")
	public String showId(Model model, @RequestParam("email") String email, @RequestParam("phoneNumber") String phoneNumber,
			@RequestParam("name") String name) {
		User user = userBO.getLoginIdByEmailAndPhoneNumber(name, email, phoneNumber);
		
		model.addAttribute("name", user.getName());
		model.addAttribute("LoginId", user.getLoginId());
		model.addAttribute("viewName", "user/showId");
		return "template/layout";
	}
	
	@RequestMapping("/reset_pw")
	public String resetPw(Model model) {
		model.addAttribute("viewName", "user/resetPw");
		return "template/layout";
	}
}
