package com.mvc.homeseek.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.util.WebUtils;

import com.mvc.homeseek.filevalidator.RoomInsertFileVali;
import com.mvc.homeseek.model.biz.RoomBiz;
import com.mvc.homeseek.model.biz.RoomListBiz;
import com.mvc.homeseek.model.dto.MemberDto;
import com.mvc.homeseek.model.dto.RoomDto;
import com.mvc.homeseek.model.dto.RoomFileDto;

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

		int res = roomBiz.selectRoomInsert(room_dto);

		if (res > 0) {
			model.addAttribute("list", roomListBiz.selectRoomList());
			return "roomList";
		}

		return "roomInsertRes";
	}

	// --- 파일 업로드 부분 ---
	@RequestMapping("fileupload.do")
	public String roomFileUpload() {

		return "roomInsertFile";
	}

	@RequestMapping("fileuploadres.do")
	public String roomFileUploaded(HttpServletRequest request, MultipartHttpServletRequest MultiRequest, Model model,
			RoomFileDto fileDto, BindingResult result) {

		validator.validate(fileDto, result);

		if (result.hasErrors()) {
			return "roomInsertFile";
		}


		
		List<MultipartFile> list = MultiRequest.getFiles("room_file");
		if (list.size() > 0) {
			for (int i = 0; i < list.size(); i++) {

				// 서버로 전송된 파일의 이름
				MultipartFile file = fileDto.getRoom_file();

				// 사용자의 컴퓨터에 저장되어있는 이름
				String name = file.getOriginalFilename();

				InputStream inputStream = null;
				OutputStream outputStream = null;

				try {
					inputStream = file.getInputStream();
					String path = WebUtils.getRealPath(request.getSession().getServletContext(),
							"/resources/uploadedFile");
					logger.info("업로드 경로 : " + path);
					File storage = new File(path);
					if (!storage.exists()) {
						storage.mkdir();
					}
					File newFile = new File(path + "/" + name);

					if (!newFile.exists()) {
						newFile.createNewFile();
					}

					outputStream = new FileOutputStream(newFile);

					int read = 0;
					byte[] b = new byte[(int) file.getSize()];
					while ((read = inputStream.read(b)) != -1) {
						outputStream.write(b, 0, read);
					}

				} catch (IOException e) {
					e.printStackTrace();
				} finally {
					try {
						inputStream.close();
						outputStream.close();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}

				model.addAllAttributes(list);

			}
		}

		return "roomInsert";
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
