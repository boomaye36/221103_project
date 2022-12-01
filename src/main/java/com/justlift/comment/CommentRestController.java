package com.justlift.comment;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.justlift.comment.bo.CommentBO;

@RestController
@RequestMapping("/comment")

public class CommentRestController {
	@Autowired
	private CommentBO commentBO;
	@RequestMapping("/insert")
	public Map<String, Object> insertComment(@RequestParam("content") String content, @RequestParam("qnaId") int qnaId, @RequestParam("type") String type,
			HttpSession session){
		Integer userId = (Integer)session.getAttribute("userId");
		String userLoginId = (String)session.getAttribute("userLoginId");
		commentBO.putComment(qnaId, userId,userLoginId,type, content);
		Map<String, Object> result = new HashMap<>();
		
		result.put("code", 100);
		return result;
		
	}
	@RequestMapping("/delete")
	public Map<String, Object> insertComment( @RequestParam("id") int id
			){
		commentBO.deleteComment(id);
		Map<String, Object> result = new HashMap<>();
		
		result.put("code", 100);
		return result;
		
	}
}
