package com.justlift.gym;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.justlift.gym.bo.GymBO;
import com.justlift.gym.model.Gym;

@Controller
@RequestMapping("/gym")
public class GymController {
	@Autowired
	private GymBO gymBO;
	@RequestMapping("/gym_view")
	public String gymView(Model model, HttpSession session,
			@RequestParam(value="prevId", required=false) Integer prevIdParam,
			@RequestParam(value="nextId", required=false) Integer nextIdParam
			//@RequestParam(value="categoryId") int categoryId,
			//@RequestParam(value="location", required=false) String location
			) {
		Integer categoryId = (Integer) session.getAttribute("categoryId");
		String location = (String) session.getAttribute("location");
		List<Gym> gymList = gymBO.getGymListByLocationAndCategory(categoryId, location, prevIdParam, nextIdParam);
		int prevId = 0;
		int nextId = 0;
		if (gymList.isEmpty() == false) { //gymList가 비어있을 때 에러 방지
			prevId = gymList.get(0).getId();
			nextId = gymList.get(gymList.size() - 1).getId();
			
			// 마지막 페이지 (next g방향의 끝)인가?
			// 제일 작은 숫자(categoryId)와 nextId가 같으면 마지막 페이지이다.
			if (gymBO.isLastPage(nextId, categoryId)) {
				nextId = 0;
			}
			// 앞 페이지 (prev 방향의 끝)인가?
			// 제일 큰 숫자 (categoryId)와 prevId가 같으면 앞페이지이다.
			if (gymBO.isLastPage(prevId, categoryId)) {
				prevId = 0;
			}
		} 
		model.addAttribute("prevId", prevId); // 가져온 포스트 중 가장 앞쪽(큰 id)
		model.addAttribute("nextId", nextId); // 가져온 포스트 중 가장 뒷쪽(작은 id)
		model.addAttribute("viewName", "gym/gymList");
		model.addAttribute("gymList", gymList);
		return "template/layout";
	}
}
