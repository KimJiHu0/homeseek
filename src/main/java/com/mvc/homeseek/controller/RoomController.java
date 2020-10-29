package com.mvc.homeseek.controller;

import java.io.File;
import java.io.IOException;
import java.util.Calendar;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.util.WebUtils;

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

		MemberDto dto = (MemberDto) session.getAttribute("login");
		logger.info("| " + dto.getMember_id() + " 사용자가 매물 올리는 중 |");
		return "roomInsert";
	}

	@RequestMapping("insertres.do")
	public String selectRoomInsert(RoomDto room_dto, Model model) {
		logger.info("[inertres.do] : 매물 올리기 제출중");

		System.out.println("현재 작성하는 사용자 : " + room_dto.getRoom_id());

		// 1.
		String new_room_avdate = room_dto.getRoom_avdate().replaceAll("-", "");
		String new_room_cpdate = room_dto.getRoom_cpdate().replaceAll("-", "");
		logger.info(new_room_avdate);
		logger.info(new_room_cpdate);
		room_dto.setRoom_avdate(new_room_avdate);
		room_dto.setRoom_cpdate(new_room_cpdate);

		int res = roomBiz.selectRoomInsert(room_dto);

		if (res > 0) {
			logger.info("입력성공");
		}
		return "roomList";

	}
	
	@RequestMapping("insertres2.do")
	public String selectRoomInsert2(RoomDto room_dto, Model model) {
		
		logger.info("[inertres.do] : 매매 매물 올리기 제출중");

		System.out.println("현재 작성하는 사용자 : " + room_dto.getRoom_id());

		// 1.
		String new_room_avdate = room_dto.getRoom_avdate().replaceAll("-", "");
		String new_room_cpdate = room_dto.getRoom_cpdate().replaceAll("-", "");
		logger.info(new_room_avdate);
		logger.info(new_room_cpdate);
		room_dto.setRoom_avdate(new_room_avdate);
		room_dto.setRoom_cpdate(new_room_cpdate);

		int res = roomBiz.selectRoomInsert2(room_dto);

		if (res > 0) {
			logger.info("입력성공");
		}
		return "roomList";
	}
	

	// ------------------Summernote Image Upload-------------------------------------

	@ResponseBody
	@PostMapping("/summer_image.do")
	public String summer_image2(MultipartFile file, HttpServletResponse response, HttpSession session, MultipartHttpServletRequest mRequest)
			throws Exception {
		response.setContentType("text/html;charset=utf-8");
		MemberDto dto = (MemberDto) session.getAttribute("login");
		
		String save_folder = WebUtils.getRealPath(mRequest.getSession().getServletContext(), "/resources/storage");
		String user = dto.getMember_id();
		logger.info(user);
		String file_name = file.getOriginalFilename();
		
		List<MultipartFile> list = mRequest.getFiles(file_name);
		System.out.println(list.size());
		
		String server_file_name = fileDBName(file_name, save_folder, user);
		System.out.println("server file : " + server_file_name);

		file.transferTo(new File(save_folder + server_file_name));

		System.out.println(WebUtils.getRealPath(mRequest.getSession().getServletContext(), "/resources/storage"));
		
		System.out.println("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
		return "resources/storage" + server_file_name;
	}
	
//	@ResponseBody
//	@PostMapping("/summer_image")
//	public String summer_image2(HttpServletRequest request, HttpServletResponse response, MultipartHttpServletRequest mRequest, MultipartFile file)
//			throws Exception {
//		response.setContentType("text/html;charset=utf-8");
//		
//		List<MultipartFile> fileList = mRequest.getFiles("img_name");
//		
//		//경로
//		String path = WebUtils.getRealPath(request.getSession().getServletContext(), "/resources/storage");
//		
//		for(MultipartFile mf : fileList) {
//			
//			int i = 0;
//			
//			String oriName = mf.getOriginalFilename()+ "(" + i + ")";
//			String server_file_name = fileDBName(oriName, path);
//			System.out.println("server file : " + server_file_name);
//			file.transferTo(new File(path + server_file_name));
//			System.out.println(WebUtils.getRealPath(request.getSession().getServletContext(), "/resources/storage"));
//			
//			i++;
//			return "resources/storage" + server_file_name;
//		}
//
//		
////		String file_name = file.getOriginalFilename();
////		String server_file_name = fileDBName(file_name, save_folder);
////		System.out.println("server file : " + server_file_name);
////
////		file.transferTo(new File(save_folder + server_file_name));
////
////		System.out.println(WebUtils.getRealPath(request.getSession().getServletContext(), "/resources/storage"));
////		
////		return "resources/storage" + server_file_name;
//		
//		return "";
//	}
	
	
	
	private String fileDBName(String fileName, String saveFolder, String user) {
		Calendar c = Calendar.getInstance();
		int year = c.get(Calendar.YEAR);
		int month = c.get(Calendar.MONTH);
		int date = c.get(Calendar.DATE);
		int sec = c.get(Calendar.MILLISECOND);
		String timestamp = year + "-" + month + "-" + date + "-" + sec;
		
		String homedir = saveFolder + "/" + year + "-" + month + "-" + date;

		System.out.println(homedir);
		File path1 = new File(homedir);
		if (!(path1.exists())) {
			path1.mkdir();
		}
		Random r = new Random();
		int random = r.nextInt(100000000);

		int index = fileName.lastIndexOf(".");

		String fileExtension = fileName.substring(index + 1);
		System.out.println("fileExtension = " + fileExtension);

		String refileName = "homeseek" + "-" + timestamp + "-" + user + "-" + random + "." + fileExtension;
		System.out.println("refileName = " + refileName);

		String fileDBName = "/" + timestamp + "/" + refileName;
		System.out.println("fileDBName = " + fileDBName);

		return fileDBName;
		
	}

	// -------------------------------------------------------

	@RequestMapping("insertpopup.do")
	public String addrPopup() {
		return "roomInsertPopup";
	}

	@RequestMapping("popupres.do")
	public String addrPopupRes(HttpSession session) {

		return "";
	}

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
