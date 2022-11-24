package com.justlift.gym;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.justlift.gym.bo.GymBO;
import com.justlift.gym.model.Category;
import com.justlift.gym.model.Gym;
import com.justlift.like.bo.LikeBO;

@Controller
@RequestMapping("/gym")
public class GymController {
	@Autowired
	private GymBO gymBO;
@Autowired
private LikeBO likeBO;
	@GetMapping("/gym_view")
	public String gymView(Model model, HttpSession session,
			@RequestParam(value = "prevId", required = false) Integer prevIdParam,
			@RequestParam(value = "nextId", required = false) Integer nextIdParam,
			@RequestParam("categoryId") int categoryId,
			@RequestParam("location") String location) {
		// Integer categoryId = (Integer) session.getAttribute("categoryId");
		// String location = (String) session.getAttribute("location");
		List<Gym> gymList = gymBO.getGymListByLocationAndCategory(categoryId, location, prevIdParam, nextIdParam);
		// Map<String, Object> result = new HashMap<>();

		int prevId = 0;
		int nextId = 0;
		if (gymList.isEmpty() == false) { // gymList가 비어있을 때 에러 방지
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
		// Map<String, Object> result1 = new HashMap<>();
		Category category = gymBO.getCategoryNameByCategoryId(categoryId);
		//session.setAttribute("categoryName", category.getCategory());

		model.addAttribute("categoryName", category.getCategory()); // 가져온 포스트 중 가장 앞쪽(큰 id)
		model.addAttribute("prevId", prevId); // 가져온 포스트 중 가장 앞쪽(큰 id)
		model.addAttribute("nextId", nextId); // 가져온 포스트 중 가장 뒷쪽(작은 id)
		model.addAttribute("location", location); 
		model.addAttribute("categoryId", categoryId); 
		
		model.addAttribute("viewName", "gym/gymList");
		model.addAttribute("gymList", gymList);
		return "template/layout";
	}

	@GetMapping("/detail_view")
	public String gymDetailView(Model model, HttpSession session,
			@RequestParam ("gymId") int gymId,
			@RequestParam ("location") String location) {
		model.addAttribute("viewName", "gym/gymDetailList");
		Gym detailGym = gymBO.getGymDetailListByGymId(gymId);
		model.addAttribute("gymName", detailGym.getName());
		model.addAttribute("gymImage", detailGym.getImage());
		//session.setAttribute("gymId", detailGym.getId());
		Integer userId = (Integer) session.getAttribute("userId");
		//Integer gymId = (Integer)session.getAttribute("gymId");
		boolean like = likeBO.getHeart(userId, gymId);
		String type = "gym";
		int likeCount = likeBO.getLikeCountByGymIdAndType(gymId, type);
		model.addAttribute("isLike", like);
		model.addAttribute("likeCount", likeCount);
		model.addAttribute("gymIntroduce", detailGym.getIntroduce());
		model.addAttribute("gymPhoneNumber", detailGym.getPhoneNumber());
		model.addAttribute("gymLocation", detailGym.getLocation());
		model.addAttribute("categoryId",detailGym.getCategoryId());
		model.addAttribute("location", location);
		model.addAttribute("gymId", gymId);
		return "template/layout";
		
	}
}
