package com.mvc.homeseek.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mvc.homeseek.model.dto.RoomDto;

@Controller
public class RoomController {
	
	private Logger logger = LoggerFactory.getLogger(RoomController.class);
	
	public String selectRoomList(Model model) {
		logger.info("[list.do]");
		
		return "";
	}
	
	@RequestMapping("insertroom.do")
	public String selectRoomInsertForm(RoomDto roomDto, Model model) {
		logger.info("[insert.do] jsp로이동");
		
		return "roomInsert";
	}
	
	@RequestMapping("insertres.do")
	public String selectRoomInsert(RoomDto roomDto, Model model) {
		logger.info("[inertres.do]");
		
		return "roomInsertRes";
	}

//	public String detail(Model model, @RequestParam("room_no") int room_no) {
//		
//		logger.info("[detail.do]");
//		
//		return "";
//	}
	
	public String selectRoomDelete(int room_no) {
		
		logger.info("[delete.do]");
		
		return "";
	}
	
	public String selectRoomUpdateForm(Model model, int room_no) {
		logger.info("[update.do] jsp로 이동");
		
		return "";
	}
	
	//@RequestMapping(value="/updateres.do", method=RequestMethod.POST)
	public String selectRoomUpdate(RoomDto roodDto) {
		logger.info("[updateres.do]");
		
		return "";

	}

}
