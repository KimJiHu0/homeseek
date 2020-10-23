package com.mvc.homeseek.controller;


import java.text.SimpleDateFormat;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mvc.homeseek.filevalidator.RoomInsertFileVali;
import com.mvc.homeseek.model.biz.RoomBiz;
import com.mvc.homeseek.model.biz.RoomListBiz;
import com.mvc.homeseek.model.dto.MemberDto;
import com.mvc.homeseek.model.dto.RoomDto;

@Controller
public class RoomController {

	private Logger logger = LoggerFactory.getLogger(RoomController.class);

	@Autowired
	private RoomBiz roomBiz;

	@Autowired
	private RoomInsertFileVali validator;

	@Autowired
	private RoomListBiz roomListBiz;

	@RequestMapping("insertroom.do")
	public String selectRoomInsertForm(RoomDto room_dto, Model model, HttpSession session) {

		logger.info("[insert.do] jsp로이동");

		MemberDto dto = (MemberDto) (session.getAttribute("login"));
		logger.info("----------------------------------");
		logger.info("| " + dto.getMember_id() + " 사용자가 매물 올리는 중 |");
		logger.info("----------------------------------");
		return "roomInsert";
	}

	@RequestMapping("insertres.do")
	public String selectRoomInsert(RoomDto room_dto, Model model) {
		logger.info("[inertres.do] : 매물 올리기 제출중");

		
		String prv_room_cpdate = room_dto.getRoom_cpdate().substring(0,10);
		String prv_room_avdate = room_dto.getRoom_avdate().substring(0,10); 
		logger.info(prv_room_cpdate); 
		logger.info(prv_room_avdate);
		
		String new_room_avdate = prv_room_avdate.replaceAll("-", "/"); 
		String new_room_cpdate = prv_room_cpdate.replaceAll("-", "/");
		
		logger.info(new_room_avdate);
		logger.info(new_room_cpdate);
		
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		
		
//		room_dto.setRoom_cpdate(new_room_cpdate);
//		room_dto.setRoom_avdate(new_room_avdate);
		
		
		int res = roomBiz.selectRoomInsert(room_dto);

		if (res > 0) {
			logger.info("입력성공");
		}

		return "roomInsertRes";
	}
	
	
	

	//------------------Summernote Image Upload-------------------------------------
	
	
	
	
	
	
	
	//-------------------------------------------------------
	

	public String selectRoomDelete(int room_no) {

		logger.info("[delete.do]");

		return "";
	}

	public String selectRoomUpdateForm(Model model, int room_no) {
		logger.info("[update.do] jsp로 이동");

		return "";
	}

	// @RequestMapping(value="/updateres.do", method=RequestMethod.POST)
	public String selectRoomUpdate(RoomDto roodDto) {
		logger.info("[updateres.do]");

		return "";

	}

}
