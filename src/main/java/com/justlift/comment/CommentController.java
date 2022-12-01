package com.justlift.comment;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.justlift.comment.bo.CommentBO;
import com.justlift.comment.model.Comment;

@Controller 
@RequestMapping("/comment ")
public class CommentController {
	@Autowired
	private CommentBO commentBO;
//	@GetMapping("/comment_view")
//	public String commentView(@RequestParam("qnaId") int qnaId,
//			 HttpSession session, Model model) {
//		Integer userId = (Integer)session.getAttribute("userId");
//		List<Comment> commentList = commentBO.getCommentListByQnaIdAndUserid(qnaId, userId);
//		
//		model.addAttribute("commentList", commentList);
//		model.addAttribute("viewName", "qna/qnaDetailList");
//		return "template/layout";
// 
//	}
	
}
