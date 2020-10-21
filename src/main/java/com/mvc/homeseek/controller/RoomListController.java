package com.mvc.homeseek.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mvc.homeseek.model.biz.RoomListBiz;
import com.mvc.homeseek.model.dto.RoomDto;

@Controller
public class RoomListController {
	
	private Logger logger = LoggerFactory.getLogger(RoomListController.class);
	
	@Autowired
	private RoomListBiz roomlistbiz;
	
	@RequestMapping("listroom.do")
	public String roomList(Model model) {
		logger.info("[ Room List ]");
		
		List<RoomDto> list = roomlistbiz.selectRoomList();
		model.addAttribute("list", list);
		
		return "roomList";
	}
}
