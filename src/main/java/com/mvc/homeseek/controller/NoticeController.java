package com.mvc.homeseek.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mvc.homeseek.model.biz.MemberBiz;
import com.mvc.homeseek.model.biz.NoticeBiz;
import com.mvc.homeseek.model.dto.MemberDto;
import com.mvc.homeseek.model.dto.NoticeDto;

@Controller
public class NoticeController {

	private Logger logger = LoggerFactory.getLogger(NoticeController.class);

	@Autowired
	private NoticeBiz noticeBiz;

	@Autowired
	private MemberBiz memberBiz;

	// 모든 글 리스트 보기
	@RequestMapping(value = "noticelist.do")
	public void selectList(Model model) {
		model.addAttribute("list", noticeBiz.selectList());
	}

	// 해당 번호 글 내용보기
	@RequestMapping(value = "/noticedetail.do")
	public String selectOne(int notice_no, NoticeDto dto, Model model, HttpServletRequest request) {
		System.out.println();
		logger.info("PAGE ## select one 하는중 ## : " + notice_no);
		model.addAttribute("dto", noticeBiz.selectOne(notice_no));
		request.setAttribute("dto", noticeBiz.selectOne(notice_no));// 흠...
		return "noticeDetail";
	}

	@RequestMapping(value = "/noticeinsertform.do")
	public String insertForm(Model model, HttpSession session) {// 체크 : 1.로그인상태가 아닐때 차단. 2.관리자일떄.

		MemberDto dto = (MemberDto) session.getAttribute("login");
		if(dto.getMember_role()=='A') {//관리자 입니다
			logger.info("| " + dto.getMember_id() + " 관리자(A)가 공지사항 올리는 중 |");
			logger.info("PAGE ##  insert 페이지로 이동   ##");
			return "noticeInsert";
		}else {//관리자가 아닙니다
			
			//alert 띄우고싶음 '관리자만 글작성할수있습니다' or 버튼 관리자만 보이게 -> noticelist.jsp 수정
			return "redirect:noticelist.do";
		}

	}

	

	// 등록
	@RequestMapping(value = "/noticeinsert.do", method = RequestMethod.POST)
	public String insert(NoticeDto dto, RedirectAttributes rttr, HttpSession session) {

		MemberDto member_dto = (MemberDto) session.getAttribute("login");
		dto.setNotice_id(member_dto.getMember_id());

		int res = 0;
		res = noticeBiz.insert(dto);
		if (res > 0) {
			logger.info("★★★★★★" + member_dto.getMember_id() + "★★★★★★ insert success");
			rttr.addFlashAttribute("result", dto);
			return "redirect:noticelist.do";
		} else {
			logger.info("★★★★★★" + member_dto.getMember_id() + "★★★★★★insert fail");
			return "redirect:noticeinsertform.do";
		}
	}

	@RequestMapping(value = "/noticeupdateform.do")
	public String updateForm(int notice_no, Model model) {
		model.addAttribute("dto", noticeBiz.selectOne(notice_no));
		return "noticeUpdate";
	}

	// 수정
	@RequestMapping(value = "/noticeupdate.do")
	public String update(NoticeDto dto, RedirectAttributes rttr) {
		int res = 0;
		res = noticeBiz.update(dto);
		if (res > 0) {
			logger.info("update success - " + dto.getNotice_no());
			rttr.addFlashAttribute("result", "success");
			return "redirect:noticelist.do";
		} else {
			logger.info("update fail - " + dto.getNotice_no());
			return "redirect:noticeupdateform.do?notice_no=" + dto.getNotice_no();
		}
	}

	// 삭제
	@RequestMapping(value = "/noticedelete.do")
	public String delete(int notice_no, RedirectAttributes rttr) {
		int res = 0;
		res = noticeBiz.delete(notice_no);
		if (res > 0) {
			logger.info("delete success - " + notice_no);
			rttr.addFlashAttribute("result", "success");
			return "redirect:noticelist.do";
		} else {
			logger.info("delete fail - " + notice_no);
			return "redirect:noticedetail?notice_no=" + notice_no;
		}
	}

	// ajax검색기능
	@GetMapping("/noticeSearch.do")
	@ResponseBody
	public Map<String, Object> noticeSearch(@RequestParam(value = "keyword") String Keyword) {
		Map<String, Object> map = new HashMap<>();
		Keyword = "%" + Keyword + "%";

		System.out.println(Keyword);

		List<NoticeDto> list = noticeBiz.selectList(Keyword);

		map.put("list", list);
		System.out.println("################################################################");
		System.out.println(list);
		return map;
	}

}
