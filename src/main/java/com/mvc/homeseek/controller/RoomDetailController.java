package com.mvc.homeseek.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
		
		MemberDto member = memberbiz.selectMemberById(id);
		model.addAttribute("room", room);
		// roomDetail.jsp에서 room을 가져와 쓰기 위한 코드
		request.setAttribute("room", room);
		model.addAttribute("member", member);
		return "roomDetail";
	}
	
	// 방 수정 폼
	@RequestMapping("updateroom.do")
	public String roomUpdate(int room_no, Model model) {
		
		RoomDto room = roomdetailbiz.selectRoomOne(room_no);
		model.addAttribute("room", room);
		
		// yyyy-MM-dd형식으로 format해주겠다는 객체
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		
		// time이라는 변수에 ROOM테이블에 있는 room_regdate를 가져와서 format해준 후 담아준다.
		String regdatetime = format.format(room.getRoom_regdate());
		String cpdatetime = format.format(room.getRoom_cpdate());
		String avdatetime = format.format(room.getRoom_avdate());
		// 2020-10-22
		
		// regdatetime에 담긴 값을 -를 기준으로 짤라서 regdate라는 배열에 하나씩 넣어준다.
		// regdate[0] = 2020
		// regdate[1] = 10
		// regdate[2] = 22
		//String[] regdate = regdatetime.split("-");
		//String[] cpdate = cpdatetime.split("-");
		//String[] avdate = avdatetime.split("-");
		
		
		// room_regdate라는 Map객체를 생성해준다.
		//Map<String, String> room_date = new HashMap<String, String>();
		// room_regdate에 put해주는데 regdate_year이라는 이름으로 regdate에 0번지에 있는거 담아준다.
		//room_date.put("regdate_year", regdate[0]);
		//room_date.put("regdate_month", regdate[1]);
		//room_date.put("regdate_day", regdate[2]);
		// cpdate에 대한 year, month, day를 담아준다.
		//room_date.put("cpdate_year", cpdate[0]);
		//room_date.put("cpdate_month", cpdate[1]);
		//room_date.put("cpdate_day", cpdate[2]);
		// avdate에 대한 year, month, day를 담아준다.
		//room_date.put("avdate_year", avdate[0]);
		//room_date.put("avdate_month", avdate[1]);
		//room_date.put("avdate_day", avdate[2]);
		
		// model로 보내준다.
		model.addAttribute("room_regdate", regdatetime);
		model.addAttribute("room_cpdate", cpdatetime);
		model.addAttribute("room_avdate", avdatetime);
		
		return "roomDetailUpdateForm";
	}
	
	// 방 수정
	@RequestMapping(value="updateroomres.do", method = RequestMethod.POST)
	public String roomUpdateRes(@RequestParam("room_cpdate") String room_cpdate, @RequestParam("room_avdate") String room_avdate, RoomDto dto, Model model, RedirectAttributes msg) {
		
		logger.info("roomUpdateRes");
		System.out.println(room_cpdate);
		System.out.println(room_avdate);
		System.out.println(dto);
		
		
		return "roomList";
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
