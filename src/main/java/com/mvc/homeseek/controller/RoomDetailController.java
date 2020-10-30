package com.mvc.homeseek.controller;


import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
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
	
			// ajax에서 넘겨주는 값은 multipart/form-data 타입이라고 enctype에 선언되어있다.
			// 그래서 controller에서 @RequestBody를 걸어주면 위의 타입을 자바객체로 바꿀 수 없기 떄문에
			// 415 미디어 타입 에러가난다. 그렇기 때문에 controller에서 @RequestBody를 뺴주거나
			// ajax에서 contentType = "application/json"을 추가해줘야한다.
	@RequestMapping("fileupload.do")
	public void profileUpload(int room_no, String room_id, MultipartFile file, HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		// 업로드할 폴더 경로
		String realFolder = request.getSession().getServletContext().getRealPath("/fileUpload");
		
		logger.info("\n -----------이미지 업로드중----------");
		/*
		 * int cnt = 1; for(int i = 0; i < file.getSize(); i++) { cnt++;
		 * System.out.println("숫자 올라가여? : " + cnt); }
		 */
		
		System.out.println("Controller에 들어오는 room_no의 값은 뭔데 ? : " + room_no);
		System.out.println("Controller에 들어오는 room_id의 값은 뭔데 ? : " + room_id);
		
		System.out.println("file.getSize() : " + file.getSize());
		System.out.println("file.getByte[]() : " + file.getBytes());
		// 업로드할 파일 이름
		String org_filename = file.getOriginalFilename(); // 이름.jpg 형식

		System.out.println("원본 파일명 : " + org_filename);
		
		// 확장자 자르기
		String back_FileName = org_filename.substring(org_filename.indexOf(".")); //.jpg 형식
		logger.info("\n 자른 확장자명 : " + back_FileName);
					
		// 확장자를 자른 파일 이름
		String front_FileName = org_filename.substring(0, org_filename.indexOf(".")); // 확장자 앞 이름
		logger.info("\n 확장자를 자른 진짜 파일 이름 : " + front_FileName);

		// 파일 경로
		String filepath = realFolder + "\\" + front_FileName + "_" + room_no + back_FileName;
		System.out.println("\n 파일경로 : " + filepath);
		
		// 위에서 뽑은 파일 경로를 ROOM_PHOTO에 저장해야됌.
		// 이곳에서 BIZ실행해서 파일의 이름만 UPDATE하게끔 만들어주기?
		
		//int updatePhoto = roomdetailbiz.updateRoomOnePhoto(new RoomDto(room_no, room_id, filepath));
		//if(updatePhoto > 0) {
		//	System.out.println("RoomDetailController : Success UpdatePhoto");
		//} else {
		//	System.out.println("RoomDetailController : Error UpdatePhoto");
		//}
		
		// 파일 진짜 이름
		String realFileName = front_FileName + "_" + room_no + back_FileName;
		

		File f = new File(filepath);
		if (!f.exists()) {
			logger.info("디렉토티 생성!");
			f.mkdirs();
		}
		file.transferTo(f);
		out.println("fileUpload/"+realFileName);
		out.close();
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
