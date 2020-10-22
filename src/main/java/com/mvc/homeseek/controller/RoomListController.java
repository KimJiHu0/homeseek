package com.mvc.homeseek.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mvc.homeseek.model.biz.RoomListBiz;


@Controller
public class RoomListController {
	
	private Logger logger = LoggerFactory.getLogger(RoomListController.class);
	
	@Autowired
	private RoomListBiz roomlistbiz;
	
	// 전체 조회
	@RequestMapping("listroom.do")
	public String roomList(@RequestParam(value="page",defaultValue="1")int page, Model model) {
		logger.info("[ Room List ]");
		
		Map<String,Object> pagingMap = roomlistbiz.selectRoomList(page);
		
		model.addAttribute("list",pagingMap.get("list"));
		model.addAttribute("pageBean",pagingMap.get("pageBean"));
		
		
		return "roomList";
	}
}
