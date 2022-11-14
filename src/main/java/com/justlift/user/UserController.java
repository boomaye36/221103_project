package com.justlift.user;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserController {
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
}
