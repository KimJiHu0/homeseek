package com.mvc.homeseek.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CommentController {
	
	private Logger logger = LoggerFactory.getLogger(CommentController.class);
	
	
	@RequestMapping("commentmember.do")
	public String CommentPopup() {
		return "commentPop";
	}

}
