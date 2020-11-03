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

import com.mvc.homeseek.model.biz.QnaBiz;
import com.mvc.homeseek.model.dto.MemberDto;
import com.mvc.homeseek.model.dto.NoticeDto;
import com.mvc.homeseek.model.dto.QnaDto;

@Controller
public class QnaController {
	
	private Logger logger = LoggerFactory.getLogger(QnaController.class);
	
	@Autowired
	private QnaBiz QnaBiz;
	
	//모든 글 리스트 보기
	@RequestMapping(value="qnalist.do")
	public void selectList(Model model) {
		model.addAttribute("list", QnaBiz.selectList());
	}	
	
	
	//해당 번호 글 내용보기
	@RequestMapping(value="/qnadetail.do")
	public String selectOne(int qna_no,QnaDto dto, Model model,HttpServletRequest request) {
		System.out.println();
		logger.info("PAGE ## select one 하는중 ## : " + qna_no);
		model.addAttribute("dto", QnaBiz.selectOne(qna_no));
		request.setAttribute("dto", QnaBiz.selectOne(qna_no));//흠...
		return "qnaDetail";
	}
	
	@RequestMapping(value="/qnainsertform.do")
	public String insertForm() {
		logger.info("PAGE ## insert 하는중 ##");
		return "qnaInsert";
	}
	
	//등록
	@RequestMapping(value="/qnainsert.do", method=RequestMethod.POST)
	public String insert(QnaDto dto, RedirectAttributes rttr, HttpSession session) {
		MemberDto member_dto = (MemberDto) session.getAttribute("login");
		dto.setQna_id(member_dto.getMember_id());
		int res = 0;
		res = QnaBiz.insert(dto);
		if (res > 0) {
			logger.info("insert success");
			rttr.addFlashAttribute("result", dto);
			return "redirect:qnalist.do";
		} else {
			logger.info("insert fail");
			return "redirect:qnainsertform.do";
		}
	}
	
	@RequestMapping(value="/qnaupdateform.do")
	public String updateForm(int qna_no, Model model) {
		model.addAttribute("dto", QnaBiz.selectOne(qna_no));
		return "qnaUpdate";
	}
	
	//수정
	@RequestMapping(value="/qnaupdate.do")
	public String update(QnaDto dto, RedirectAttributes rttr) {
		int res = 0;
		res = QnaBiz.update(dto);
		if (res > 0) {
			logger.info("update success - " + dto.getQna_no());
			rttr.addFlashAttribute("result", "success");
			return "redirect:qnalist.do";
		} else {
			logger.info("update fail - " + dto.getQna_no());
			return "redirect:qnaupdateform.do?qna_no="+dto.getQna_no();
		}
	}
	
	//삭제
	@RequestMapping(value="/qnadelete.do")
	public String delete(int qna_no,RedirectAttributes rttr) {
		int res = 0;
		res = QnaBiz.delete(qna_no);
		if (res > 0){
			logger.info("delete success - " + qna_no);
			rttr.addFlashAttribute("result", "success");
			return "redirect:qnalist.do";
		} else {
			logger.info("delete fail - " + qna_no);
			return "redirect:qnadetail?qna_no="+qna_no;
		}
	}
	
	//ajax검색기능
	@GetMapping("/qnaSearch.do")
	@ResponseBody
	public Map<String,Object> qnaSearch(@RequestParam(value="keyword") String Keyword){
		Map<String, Object> map = new HashMap<>();
		Keyword = "%"+Keyword+"%";
		
		System.out.println(Keyword);
		
		List<QnaDto> list = QnaBiz.selectList(Keyword);
		
		map.put("list", list);
		System.out.println("################################################################");
		System.out.println(list);
		return map;
	}

}
