package com.justlift.user;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.justlift.common.EncryptUtils;
import com.justlift.user.bo.UserBO;
import com.justlift.user.model.User;

@RestController
@RequestMapping("/user")
public class UserRestController {
	@Autowired
	private UserBO userBO;
	@RequestMapping("/is_duplicated_id")
	public Map<String, Object> isDuplicatedId(
			@RequestParam("userId") String userId){
		Map<String, Object> result = new HashMap<>();
		int existRowCount  = userBO.existingLoginId(userId);
		if (existRowCount > 0) {
			result.put("result", true);
			result.put("code", 100);
		}else {
			result.put("errorMessege", false);
			result.put("code", 100);
		}
		return result;
	}
	@PostMapping("/sign_up")
	public Map<String, Object> adduser(
			@RequestParam("userId") String userId,
			@RequestParam("userPw") String userPw,
			@RequestParam("name") String name,
			@RequestParam("email") String email,
			@RequestParam("phoneNumber") String phoneNumber){
		String encryptPassword = EncryptUtils.md5(userPw);
		userBO.addUser(userId, encryptPassword, name, email, phoneNumber);
		Map<String, Object>result = new HashMap<>();
		result.put("code", 100);
		result.put("result", "success");
		return result;
	}
	
	@PostMapping("sign_in")
	public Map<String, Object> signIn(
			@RequestParam("loginId") String loginId,
			@RequestParam("password") String password,
			HttpServletRequest request, Model model){
		String encryptPassword = EncryptUtils.md5(password);
		User user = userBO.getUserByUserIdandPassword(loginId, encryptPassword);
		Map<String, Object> result = new HashMap<>();

		
		if (user != null) { //?????????
			result.put("code", 100);
			result.put("result", "success");
			
			HttpSession session = request.getSession();
			session.setAttribute("userName", user.getName());
			session.setAttribute("userLoginId", user.getLoginId());
			session.setAttribute("userId", user.getId());
			//model.addAttribute("Ddays", Ddays);
		}else { 
			result.put("code", 400);// ??????
			result.put("errorMessage", "???????????? ?????? ??????????????????.");
		}
		return result;
		
	}
	@PostMapping("/pw_reset")
	public Map<String, Object> resetPw(@RequestParam("password") String password, @RequestParam("loginId") String loginId){
		String encryptPassword = EncryptUtils.md5(password);

		
		userBO.updateUserPw(loginId, encryptPassword);
		Map<String, Object> result = new HashMap<>();
		result.put("code", 100);
		return result;
		
	}
	
	
}
