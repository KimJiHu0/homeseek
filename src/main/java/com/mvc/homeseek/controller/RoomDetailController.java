package com.mvc.homeseek.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
		
		// 2020-10-23 ??:??:??:? 식으로 나온거 물음표 부분 잘라주기
		String sub_room_regdate = room.getRoom_regdate().substring(0,10);
		String sub_room_cpdate = room.getRoom_cpdate().substring(0,10);
		String sub_room_avdate = room.getRoom_avdate().substring(0,10);
		
		// 자른거 RoomDto에 담아주기
		room.setRoom_regdate(sub_room_regdate);
		room.setRoom_cpdate(sub_room_cpdate);
		room.setRoom_avdate(sub_room_avdate);
		
		// member = 매물 올린사람
		MemberDto member = memberbiz.selectMemberById(id);
		model.addAttribute("room", room);
		// roomDetail.jsp에서 room을 가져와 쓰기 위한 코드
		request.setAttribute("room", room);
		model.addAttribute("member", member);
		request.setAttribute("member", member);
		return "roomDetail";
	}
	
	// 방 수정 폼
	@RequestMapping("updateroom.do")
	public String roomUpdate(int room_no, Model model) {
		
		RoomDto room = roomdetailbiz.selectRoomOne(room_no);
		String sub_room_regdate = room.getRoom_regdate().substring(0,10);
		String sub_room_cpdate = room.getRoom_cpdate().substring(0,10);
		String sub_room_avdate = room.getRoom_avdate().substring(0,10);
		
		room.setRoom_regdate(sub_room_regdate);
		room.setRoom_cpdate(sub_room_cpdate);
		room.setRoom_avdate(sub_room_avdate);
		
		model.addAttribute("room", room);
		
		return "roomDetailUpdateForm";
	}
	
	// 방 수정
	@RequestMapping(value="updateroomres.do", method = RequestMethod.POST)
	public String roomUpdateRes(RoomDto dto, Model model, RedirectAttributes msg) {
		
		logger.info("roomUpdateRes");
		
		String[] cpdate = dto.getRoom_cpdate().split("-");
		String[] avdate = dto.getRoom_avdate().split("-");
		
		String cpdatetime = cpdate[0] + cpdate[1] + cpdate[2];
		String avdatetime = avdate[0] + avdate[1] + avdate[2];
		
		dto.setRoom_cpdate(cpdatetime);
		dto.setRoom_avdate(avdatetime);
		
		int res = 0;
		
		res = roomdetailbiz.updateRoomOne(dto);
		
		if(res > 0) {
			msg.addFlashAttribute("room", roomdetailbiz.selectRoomOne(dto.getRoom_no()));
			msg.addFlashAttribute("msg", "수정이 성공적으로 완료되었습니다.");
			return "redirect:/detailroom.do?room_no=" + dto.getRoom_no();
		} else {
			msg.addFlashAttribute("room", roomdetailbiz.selectRoomOne(dto.getRoom_no()));
			msg.addFlashAttribute("msg", "수정이 실패하였습니다. 다시 시도해주세요.");
			return "redirect:/updateroom.do?room_no=" + dto.getRoom_no();
		}
	}
	
	// 방 삭제
	@RequestMapping("deleteroom.do")
	public String roomDelete(int room_no, RedirectAttributes msg) {
		
		int res = roomdetailbiz.deleteRoomOne(room_no);
		// 삭제 성공 시
		if(res > 0) {
			msg.addFlashAttribute("msg", "삭제가 성공적으로 완료되었습니다.");
			return "redirect:/listroom.do";
		} else {
			msg.addFlashAttribute("msg", "삭제가 실패되었습니다. 다시 시도해주세요.");
			return "redirect:/detailroom.do?" + room_no;
		}
	}

}
