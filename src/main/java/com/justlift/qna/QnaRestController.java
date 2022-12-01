package com.justlift.qna;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.justlift.qna.bo.QnaBO;

@RestController
@RequestMapping("/qna")
public class QnaRestController {
	@Autowired
	private QnaBO qnaBO;
	@RequestMapping("/insert_{type}")
	
	public Map<String, Object> insertQna(
			@PathVariable("type") String type,
			@RequestParam("title") String title,
			@RequestParam("content") String content,
			@RequestParam("workoutId") int workoutId,
			HttpSession session){
		Integer userId = (Integer) session.getAttribute("userId");
		qnaBO.insertQna(userId, workoutId, type, title, content);
		Map<String, Object> result = new HashMap<>();

		result.put("code", 100);
		return result;

	}
	@PostMapping("/delete")
	public Map<String, Object> delteQna(@RequestParam("id") int id){
		qnaBO.deleteQnaById(id);
		Map<String, Object> result = new HashMap<>();

		result.put("code", 100);
		return result;
	}
	@PostMapping("/update")
	public Map<String, Object> updateQna(@RequestParam("id") int id,
			@RequestParam("title") String title,
			@RequestParam("content") String content){
		qnaBO.updateQnaById(id, title, content);
		Map<String, Object> result = new HashMap<>();
		
		result.put("code", 100);
		return result;
	}
}
