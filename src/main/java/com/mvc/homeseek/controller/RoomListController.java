package com.mvc.homeseek.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RoomListController {
	
	private Logger logger = LoggerFactory.getLogger(RoomListController.class);
	
	@RequestMapping("listroom.do")
	public String detailRoom() {
		logger.info("[ Room List ]");
		return "roomList";
	}

}
