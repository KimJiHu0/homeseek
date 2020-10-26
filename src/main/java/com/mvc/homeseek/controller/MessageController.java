package com.mvc.homeseek.controller;

import javax.servlet.http.HttpSession;

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
import com.mvc.homeseek.model.biz.MessageBiz;
import com.mvc.homeseek.model.dao.MemberDao;
import com.mvc.homeseek.model.dao.MessageDao;
import com.mvc.homeseek.model.dto.MemberDto;
import com.mvc.homeseek.model.dto.MessageDto;

@Controller
public class MessageController {
	
	private Logger logger = LoggerFactory.getLogger(MessageController.class);

	@Autowired
	private MessageBiz messagebiz;
	
	@Autowired
	private MemberBiz memberbiz;
	
	
	// 쪽지보내기 Form
	@RequestMapping("messagemember.do")
	public String insertMessageForm(@RequestParam("room_id") String message_reid, HttpSession session, Model model) {
		
		logger.info("[ MessageController ] insertMessageForm");
		
		// message_reid : 쪽지 받을 id
		// message_senid : 쪽지 보내는 id
		
		
		// 쪽지 받는 사람의 정보를 담을 dto
		MemberDto reuser = memberbiz.selectMemberById(message_reid);
		// 쪽지 보내는 사람의 정보를 담을 dto
		MemberDto senuser = (MemberDto) session.getAttribute("login");
		
		model.addAttribute("message_reuser", reuser);
		model.addAttribute("message_senuser", senuser);
		
		return "messageMemberForm";
	}
	
	// 쪽지보내기 처리하는 메소드
	@RequestMapping(value="messagememberres.do", method = RequestMethod.POST)
	public void insertMessageRes(MessageDto messagedto, RedirectAttributes msg) {
		
		logger.info("[ MessageController ] insertMessageRes");
		
		int res = messagebiz.insertMessage(messagedto);
		
		if(res > 0) {
			msg.addFlashAttribute("msg", "쪽지가 전송되었습니다.");
		} else {
			msg.addFlashAttribute("msg", "쪽지가 전송이 실패되었습니다.");
		}
	}
}
