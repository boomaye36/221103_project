package com.justlift.timeline;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/timeline")
public class TimelineController {
	@RequestMapping("/timeline_view")
	public String timelineView(Model model, HttpSession session) {
		model.addAttribute("viewName", "timeline/timeline");
		return "template/layout";
	}
}
