package com.justlift.answer;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.justlift.answer.bo.AnswerBO;

@RestController
@RequestMapping("/answer")
public class AnswerRestController {
	@Autowired
	private AnswerBO answerBO;
	@RequestMapping("/insert")
	public Map<String, Object> InsertAnswer(@RequestParam("qnaId") int qnaId, @RequestParam("commentId") int commentId,
			@RequestParam("content") String content, HttpSession session) {
		Integer userId = (Integer)session.getAttribute("userId");
		String userLoginId = (String)session.getAttribute("userLoginId");
		answerBO.putAnswer(qnaId, commentId, userId, userLoginId, content);
		Map<String, Object> result = new HashMap<>();

		result.put("code", 100);
		return result;
	}
	@RequestMapping("/delete")
	public Map<String, Object> deleteAnswer(@RequestParam("id") int id){
		
		answerBO.deleteAnswer(id);
		Map<String, Object> result = new HashMap<>();

		result.put("code", 100);
		return result;
	}
}
