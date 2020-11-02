package com.mvc.homeseek.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DonationController {
	
	private Logger logger = LoggerFactory.getLogger(DonationController.class);
	
	@RequestMapping("donateform.do")
	public String donateForm() {
		
		
		
		
		
		
		
		
		return "donation";
	}
	
	@RequestMapping("donate.do")
	public String donateRes() {
		
		return "";
	}

}
