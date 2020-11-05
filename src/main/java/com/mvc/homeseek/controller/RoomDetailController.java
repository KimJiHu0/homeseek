package com.mvc.homeseek.controller;


import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mvc.homeseek.model.biz.MemberBiz;
import com.mvc.homeseek.model.biz.RoomDetailBiz;
import com.mvc.homeseek.model.biz.WishBiz;
import com.mvc.homeseek.model.dto.MemberDto;
import com.mvc.homeseek.model.dto.RoomDto;
import com.mvc.homeseek.model.dto.WishDto;

@Controller
public class RoomDetailController {
	
	private Logger logger = LoggerFactory.getLogger(RoomDetailController.class);
	
	@Autowired
	private RoomDetailBiz roomdetailbiz;
	@Autowired
	private MemberBiz memberbiz;
	@Autowired
	private WishBiz wishbiz;
	
	// 방 상세보기
	@RequestMapping("detailroom.do")
	public String roomDetail(int room_no, Model model, HttpServletRequest request, HttpSession session) {
		
		logger.info(" RoomDetailController : roomDetail ");
		
		RoomDto room = roomdetailbiz.selectRoomOne(room_no);
		// 글 올린 사람의 id
		String id = room.getRoom_id();
		// member = 매물 올린사람
		MemberDto member = memberbiz.selectMemberById(id);
		
		// 로그인되어있는 아이디를 가져오기 위해
		MemberDto wish = (MemberDto) session.getAttribute("login");
		String wish_id = wish.getMember_id();
		
		// 체크가 되어있는지 아닌지 판별
		int wishcheck = wishbiz.selectWishCheck(new WishDto(wish_id, id, room_no));
		
		// 2020-10-23 ??:??:??:? 식으로 나온거 물음표 부분 잘라주기
		String sub_room_regdate = room.getRoom_regdate().substring(0,10);
		String sub_room_cpdate = room.getRoom_cpdate().substring(0,10);
		String sub_room_avdate = room.getRoom_avdate().substring(0,10);
		
		// 자른거 RoomDto에 담아주기
		room.setRoom_regdate(sub_room_regdate);
		room.setRoom_cpdate(sub_room_cpdate);
		room.setRoom_avdate(sub_room_avdate);
		
		model.addAttribute("room", room);
		// roomDetail.jsp에서 room을 가져와 쓰기 위한 코드
		request.setAttribute("room", room);
		model.addAttribute("member", member);
		request.setAttribute("member", member);
		request.setAttribute("wishcheck", wishcheck);
		return "roomDetail";
	}
	
	// 방 수정 폼
	@RequestMapping("updateroom.do")
	public String roomUpdate(int room_no, Model model, HttpServletRequest request) {
		
		RoomDto room = roomdetailbiz.selectRoomOne(room_no);
		String sub_room_regdate = room.getRoom_regdate().substring(0,10);
		String sub_room_cpdate = room.getRoom_cpdate().substring(0,10);
		String sub_room_avdate = room.getRoom_avdate().substring(0,10);
		
		room.setRoom_regdate(sub_room_regdate);
		room.setRoom_cpdate(sub_room_cpdate);
		room.setRoom_avdate(sub_room_avdate);
		
		model.addAttribute("room", room);
		request.setAttribute("room", room);
		
		return "roomDetailUpdateForm";
	}
	
	// 방 수정
	@RequestMapping(value="updateroomres.do", method = RequestMethod.POST)
	public String roomUpdateRes(RoomDto dto, Model model, RedirectAttributes msg) {
		
		logger.info("\n roomDetailController : roomUpdateRes");
		
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
	public void fileUpload(String room_id, MultipartFile file, HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		
		PrintWriter out = response.getWriter();
		// 업로드할 폴더 경로
		String realFolder = request.getSession().getServletContext().getRealPath("resources/" + room_id + "/");
		
		logger.info(" \n fileUpload 사용자 : " + room_id);
		
		// 사용자가 올리고자 하는 파일 이름
		String org_filename = file.getOriginalFilename();
		
		logger.info(" \n 사용자가 올리고자 하는 파일 이름 : " + org_filename);
		
		String uploadFileName = fileChangeName(org_filename, realFolder, room_id);
		
		logger.info(" \n fileChangeName메소드를 통해 변경된 이름 : " + uploadFileName);
		
		file.transferTo(new File(realFolder + uploadFileName));
		
		
		out.print("resources/" + room_id + "/" + uploadFileName);
		out.close();
	}
	
	// 업로드 될 이미지의 이름을 바꾸는 메소드
	private String fileChangeName(String org_filename, String realFolder, String room_id) {
		
		// org_filename : fileupload 메소드에서 뽑은 원본 파일명 => 사진.jpg
		// realFolder : fileupload 메소드에서 뽑은 realpath => homeseek/rgusqls@naver.com 식으로 이곳에 파일업로드
		
		Random r = new Random();
        int random = r.nextInt(100000000); 
		
		Calendar c = Calendar.getInstance();
		int year = c.get(Calendar.YEAR);
		int month = c.get(Calendar.MONTH) + 1;
		int date = c.get(Calendar.DATE);
		int sec = c.get(Calendar.MILLISECOND);
		
		String timetamp = year + "_" + month + "_" + date + "_" + sec;
		
		// 파일이 업로드 될 경로 : /homeseek/rgsqls@naver.com/ 
		String filePath = realFolder;
		
		logger.info(" \n fileChangeName Method의 filePath :  " + filePath);
		
		File f = new File(filePath);
		if(!f.exists()) {
			f.mkdirs();
		}
		
		// 확장자 자르기
		String back_FileName = org_filename.substring(org_filename.indexOf(".")); //.jpg 형식
		logger.info("\n 자른 확장자명 : " + back_FileName);
		
		// DB에 저장될 이름
		String front_FileName = "homeseekimage";
		
		String realFileName = front_FileName + "_" + timetamp + "_" + random + back_FileName;
		
		logger.info(" DB에 저장될 파일 이름 : " + realFileName);
		
		return realFileName;
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
	
	@RequestMapping("wishdetailroom.do")
	public String wishListDetailRoom(int room_no, String room_id, Model model, HttpServletRequest request) {
		
		logger.info("[ roomDetail ]");
		
		RoomDto roomdto = roomdetailbiz.selectRoomOne(room_no);
		MemberDto memberdto = memberbiz.selectMemberById(room_id);
		
		model.addAttribute("room", roomdto);
		model.addAttribute("member", memberdto);
		request.setAttribute("room", roomdto);
		request.setAttribute("member", memberdto);
		
		return "roomDetail";
	}
}
