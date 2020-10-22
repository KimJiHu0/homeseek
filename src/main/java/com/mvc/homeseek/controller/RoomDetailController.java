package com.mvc.homeseek.controller;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mvc.homeseek.model.biz.MemberBiz;
import com.mvc.homeseek.model.biz.RoomDetailBiz;
import com.mvc.homeseek.model.dto.MemberDto;
import com.mvc.homeseek.model.dto.RoomDto;

@Controller
public class RoomDetailController {
	
	private Logger logger = LoggerFactory.getLogger(RoomDetailController.class);
	
	@Autowired
	private RoomDetailBiz roomdetailbiz;
	@Autowired
	private MemberBiz memberbiz;
	
	// 방 상세보기
	@RequestMapping("detailroom.do")
	public String roomDetail(int room_no, Model model, HttpServletRequest request) {
		
		logger.info(" RoomDetailController : roomDetail ");
		
		RoomDto room = roomdetailbiz.selectRoomOne(room_no);
		String id = room.getRoom_id();
		
		MemberDto member = memberbiz.selectMemberById(id);
		model.addAttribute("room", room);
		// roomDetail.jsp에서 room을 가져와 쓰기 위한 코드
		request.setAttribute("room", room);
		model.addAttribute("member", member);
		return "roomDetail";
	}
	
	// 방 수정
	@RequestMapping("updateroom.do")
	public String roomUpdate(RoomDto dto, Model model) {
		
		RoomDto room = roomdetailbiz.selectRoomOne(dto.getRoom_no());
		model.addAttribute("room", room);
		
		return "roomDetailUpdate";
	}
	
	// 방 삭제
	@RequestMapping("deleteroom.do")
	public String roomDelete(int room_no) {
		return "";
	}

}
