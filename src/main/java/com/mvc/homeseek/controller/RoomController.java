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
	
	public String selectList(Model model) {
		logger.info("[list.do]");
		
		return "";
	}
	
	@RequestMapping("insertRoom.do")
	public String insertRoom(RoomDto roomDto, Model model) {
		logger.info("[insert.do] jsp로이동");
		
		return "RoomInsert";
	}
	
	@RequestMapping("insertRes.do")
	public String insertRes(RoomDto roomDto, Model model) {
		logger.info("[inertres.do]");
		
		return "RoomInsertRes";
	}

//	public String detail(Model model, @RequestParam("room_no") int room_no) {
//		
//		logger.info("[detail.do]");
//		
//		return "";
//	}
	
	public String delete(int room_no) {
		
		logger.info("[delete.do]");
		
		return "";
	}
	
	public String updateForm(Model model, int room_no) {
		logger.info("[update.do] jsp로 이동");
		
		return "";
	}
	
	//@RequestMapping(value="/updateres.do", method=RequestMethod.POST)
	public String updateRes(RoomDto roodDto) {
		logger.info("[updateres.do]");
		
		return "";

	}

}
