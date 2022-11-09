package com.justlift.admin;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.justlift.admin.bo.AdminBO;

@Controller
@RequestMapping("/admin")
public class AdminRestController {
	@Autowired
	private AdminBO adminBO;
	@PostMapping("/admin_gym")
	
	public Map<String, Object> addGym(
			@RequestParam("name") String name,
			@RequestParam("categoryId") int categoryId,
			@RequestParam("location") String location,
			@RequestParam("phoneNumber") String phoneNumber,
			@RequestParam("introduce") String introduce,
			@RequestParam("rank") double rank,
			@RequestParam(value="file", required=false) MultipartFile file,
			HttpSession session){
		String userLoginId = (String)session.getAttribute("userLoginId");
		Map<String, Object> result = new HashMap<>();
		
		int row = adminBO.addGym(userLoginId, name, categoryId, location, phoneNumber, introduce, rank, file);
		if (row > 0) {
			result.put("code", 100); // 성공
			result.put("result", "success");
		}else {
			result.put("code", 400);
			result.put("errorMessage", "체육관 저장에 실패했습니다. 관리자에게 문의하세요.");
		}
	return result;
	}
	
}
