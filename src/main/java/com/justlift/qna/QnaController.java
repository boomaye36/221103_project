package com.justlift.qna;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.justlift.qna.bo.QnaBO;
import com.justlift.qna.model.Qna;

@Controller
@RequestMapping("/qna")
public class QnaController {
	@Autowired
	private QnaBO qnaBO;
	@RequestMapping("/qna_view")
	public String QnaView(HttpSession session, Model model){
		Integer userId = (Integer)session.getAttribute("userId");
		List<Qna> qnaList = qnaBO.getQnaListByUserId(userId);
		model.addAttribute("qnaList", qnaList);
		model.addAttribute("viewName", "qna/qnaList");
		return "template/layout";
	}
	@GetMapping("/qna_detail_view")
	public String QnaDetailView( Model model,
			@RequestParam("id") int id){
		Qna qna = qnaBO.getQnaDetailListById(id);
		model.addAttribute("content", qna.getContent());
		model.addAttribute("title", qna.getTitle());
		model.addAttribute("date", qna.getCreatedAt());
		
		model.addAttribute("viewName", "qna/qnaDetailList");
		return "template/layout";
	}
}
