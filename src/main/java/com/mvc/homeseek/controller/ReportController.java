package com.mvc.homeseek.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mvc.homeseek.model.biz.ReportBiz;

@Controller
public class ReportController {
	
	private Logger logger = LoggerFactory.getLogger(ReportController.class);
	
	@Autowired
	private ReportBiz reportbiz;
	
	@RequestMapping("")
	public String insertReportForm() {
		return "";
	}

}
