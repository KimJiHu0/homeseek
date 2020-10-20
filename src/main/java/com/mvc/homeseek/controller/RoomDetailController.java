package com.mvc.homeseek.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RoomDetailController {
	
	@RequestMapping("detailroom.do")
	public String roomDetail() {
		return "roomDetail";
	}

}
