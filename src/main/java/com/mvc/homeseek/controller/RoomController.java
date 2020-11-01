package com.mvc.homeseek.controller;

import java.io.File;
import java.util.Calendar;
import java.util.Random;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

import com.mvc.homeseek.model.biz.RoomBiz;
import com.mvc.homeseek.model.dto.MemberDto;
import com.mvc.homeseek.model.dto.RoomDto;

@Controller
public class RoomController {

	private Logger logger = LoggerFactory.getLogger(RoomController.class);

	@Autowired
	private RoomBiz roomBiz;


	@RequestMapping("insertroom.do")
	public String selectRoomInsertForm(RoomDto room_dto, Model model, HttpSession session) {

		logger.info("[insert.do] jsp로이동");

		MemberDto dto = (MemberDto) session.getAttribute("login");
		logger.info("| " + dto.getMember_id() + " 사용자가 매물 올리는 중 |");
		return "roomInsert";
	}

	@RequestMapping("insertres.do")
	public String selectRoomInsert(RoomDto room_dto, Model model, RedirectAttributes redirect) {
		
		logger.info("[inertres.do] : 매물 올리기 제출중");
		logger.info("업로드하는 사진 : " + room_dto.getRoom_photo());
		
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
			redirect.addFlashAttribute("msg", "매물등록을 성공했습니다.");
			return "redirect:/listroom.do";
		} else {	
			redirect.addFlashAttribute("msg", "매물등록을 실패했습니다.");
			return "redirect:/insertroom.do";
		}


	}
	
	//보증금 없이 insert	
	@RequestMapping("insertres2.do")
	public String selectRoomInsert2(RoomDto room_dto, Model model,  RedirectAttributes redirect) {
		
		logger.info("[inertres.do] : 매매 매물 올리기 제출중");
		logger.info("업로드하는 사진 : " + room_dto.getRoom_photo());

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
			redirect.addFlashAttribute("msg", "매물등록을 성공했습니다.");
			return "redirect:/listroom.do";
		} else {
			redirect.addFlashAttribute("msg", "매물등록을 실패했습니다.");
			return "redirect:/insertroom.do";
		}
	}
	

	// ------------------Summernote Image Upload-------------------------------------

	@ResponseBody
	@PostMapping("/summer_image.do")
	public String summer_image2(MultipartFile file, HttpServletResponse response, HttpSession session, MultipartHttpServletRequest mRequest)
			throws Exception {
		response.setContentType("text/html;charset=utf-8");
		MemberDto dto = (MemberDto) session.getAttribute("login");
		String user = dto.getMember_id();
		logger.info("파일을 올리는 사용자 : " + user);
		String save_folder = WebUtils.getRealPath(mRequest.getSession().getServletContext(), user);
		
		String file_name = file.getOriginalFilename();
		
		
		String server_file_name = fileDBName(file_name, save_folder, user);
		System.out.println("server file : " + server_file_name);

		file.transferTo(new File(save_folder + server_file_name));

		
		return  user + "/" + server_file_name;
	}
	
	
	private String fileDBName(String fileName, String saveFolder, String user) {
		Calendar c = Calendar.getInstance();
		int year = c.get(Calendar.YEAR);
		int month = c.get(Calendar.MONTH);
		int date = c.get(Calendar.DATE);
		int sec = c.get(Calendar.MILLISECOND);
		
		String timestamp = year + "_" + month + "_" + date + "_" + sec;
		
		String homedir = saveFolder;
		System.out.println(homedir);
		
		File path1 = new File(homedir);
		if (!(path1.exists())) {
			path1.mkdir();
		}

		int index = fileName.lastIndexOf(".");
		
		Random r = new Random();
		int random = r.nextInt(100000000);
		
		String extName = fileName.substring(0, index);
		System.out.println(extName);
		
		
		String fileExtension = fileName.substring(index + 1);
		System.out.println("fileExtension = " + fileExtension);

		String refileName = extName + "_" + timestamp + "_" + random + "." + fileExtension;
		System.out.println("refileName = " + refileName);

		String fileDBName = "/" + refileName;
		System.out.println("fileDBName = " + fileDBName);

		return  fileDBName;
		
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