package com.justlift.qna;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.justlift.answer.bo.AnswerBO;
import com.justlift.answer.model.Answer;
import com.justlift.answer.model.AnswerView;
import com.justlift.comment.bo.CommentBO;
import com.justlift.comment.model.Comment;
import com.justlift.gym.bo.GymBO;
import com.justlift.gym.model.Gym;
import com.justlift.qna.bo.QnaBO;
import com.justlift.qna.model.Qna;
import com.justlift.trainer.bo.TrainerBO;
import com.justlift.trainer.model.Trainer;

@Controller
@RequestMapping("/qna")
public class QnaController {
	@Autowired
	private QnaBO qnaBO;
	@Autowired
	private GymBO gymBO;
	@Autowired
	private TrainerBO trainerBO;
	@Autowired
	private CommentBO commentBO;
	@Autowired
	private AnswerBO answerBO;
	@RequestMapping("/qna_view")
	public String QnaView(HttpSession session, Model model){
		Integer userId = (Integer)session.getAttribute("userId");
		List<Qna> qnaList = qnaBO.getQnaListByUserId(userId);
		List <Gym> gymQnaList= gymBO.getGymListByUserIdAndFromQna(userId);
		List <Trainer> trainerQnaList= trainerBO.getTrainerListByUserIdAndFromQna(userId);
		model.addAttribute("gymQnaList", gymQnaList);
		model.addAttribute("trainerQnaList", trainerQnaList);
		model.addAttribute("qnaList", qnaList);
		model.addAttribute("viewName", "qna/qnaList");
		return "template/layout";
	}
	@GetMapping("/qna_detail_view")
	public String QnaDetailView( Model model,
			@RequestParam("id") int id, HttpSession session,
			@RequestParam(value="commentId", required = false) Integer commentId){
		Qna qna = qnaBO.getQnaDetailListById(id);
		Integer userId = (Integer)session.getAttribute("userId");
		List<Comment> commentList = commentBO.getCommentListByQnaIdAndUserid(id, userId);
		List<AnswerView> answerViewList = answerBO.getAnswerViewList(userId, commentId, id);
		//List<Answer>answerList = answerBO.getAnswerListByCommentIdAndUserId(commentId, userId);
		//model.addAttribute("answerList", answerList);
		model.addAttribute("answerViewList", answerViewList);
		model.addAttribute("commentList", commentList);
		model.addAttribute("content", qna.getContent());
		model.addAttribute("title", qna.getTitle());
		model.addAttribute("date", qna.getCreatedAt());
		model.addAttribute("id", id);
		
		model.addAttribute("viewName", "qna/qnaDetailList");
		return "template/layout";
	}
}
