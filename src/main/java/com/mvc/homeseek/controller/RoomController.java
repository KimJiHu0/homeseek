package com.mvc.homeseek.controller;

import java.io.File;
import java.io.PrintWriter;
import java.util.Calendar;
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
		logger.info("----------------------------------");
		logger.info("| " + dto.getMember_id() + " 사용자가 매물 올리는 중 |");
		logger.info("----------------------------------");
		return "roomInsert";
	}

	@RequestMapping("insertres.do")
	public String selectRoomInsert(RoomDto room_dto, Model model) {
		logger.info("[inertres.do] : 매물 올리기 제출중");

		System.out.println("123sda ::::::: " + room_dto.getRoom_id());

		// 1.
		String new_room_avdate = room_dto.getRoom_avdate().replaceAll("-", "");
		String new_room_cpdate = room_dto.getRoom_cpdate().replaceAll("-", "");
		logger.info(new_room_avdate);
		logger.info(new_room_cpdate);
		room_dto.setRoom_avdate(new_room_avdate);
		room_dto.setRoom_cpdate(new_room_cpdate);

		// 2.
//		String[] cpdate = room_dto.getRoom_cpdate().split("-");
//		String[] avdate = room_dto.getRoom_avdate().split("-");
//		String final_cpdate = cpdate[0] +cpdate[1] +cpdate[2];
//		String final_avdate = avdate[0] +avdate[1] +avdate[2];
//			logger.info(final_avdate);
//			logger.info(final_cpdate);
//		room_dto.setRoom_cpdate(final_cpdate);
//		room_dto.setRoom_avdate(final_avdate);

		int res = roomBiz.selectRoomInsert(room_dto);

		if (res > 0) {
			logger.info("입력성공");
		}
		return "redirect:/insertroom.do";

	}

	// ------------------Summernote Image Upload-------------------------------------

	@ResponseBody
	@PostMapping("/summer_image")
	public String summer_image2(MultipartFile file, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		response.setContentType("text/html;charset=utf-8");
		String save_folder = WebUtils.getRealPath(request.getSession().getServletContext(), "/resources/storage");

//		PrintWriter out = response.getWriter();
		String file_name = file.getOriginalFilename();
		String server_file_name = fileDBName(file_name, save_folder);
		System.out.println("server file : " + server_file_name);

		file.transferTo(new File(save_folder + server_file_name));

		System.out.println(WebUtils.getRealPath(request.getSession().getServletContext(), "/resources/storage"));
		
//		// 서머노트에 띄워줄 이미지출력하는 코드
//		out.println("resources/upload" + server_file_name);
//		out.close();
		
		return "resources/storage" + server_file_name;
	}

	private String fileDBName(String fileName, String saveFolder) {
		Calendar c = Calendar.getInstance();
		int year = c.get(Calendar.YEAR);
		int month = c.get(Calendar.MONTH);
		int date = c.get(Calendar.DATE);

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

		String refileName = "homeseek" + "-" + year + "-" + month + "-" + date + "-" + random + "." + fileExtension;
		System.out.println("refileName = " + refileName);

		String fileDBName = "/" + year + "-" + month + "-" + date + "/" + refileName;
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
