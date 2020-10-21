package com.mvc.homeseek.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mvc.homeseek.model.biz.MemberBiz;
import com.mvc.homeseek.model.dto.MemberDto;

@Controller
public class MemberController {

	private Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	private MemberBiz memberBiz;

	@RequestMapping("loginform.do")
	public String loginForm() {
		logger.info("login.do");
		return "login";
	}

	@ResponseBody
	@RequestMapping(value = "/ajaxlogin.do", method = RequestMethod.POST)
	public Map<String, Boolean> login(@RequestBody MemberDto dto, HttpSession session) {
		logger.info("ajaxlogin.do");

		MemberDto res = memberBiz.login(dto);

		boolean check = false;

		if (res != null) {
			session.setAttribute("login", res);
			check = true;
		}

		Map<String, Boolean> map = new HashMap<String, Boolean>();
		map.put("check", check);

		return map;

	}

	@RequestMapping("logout.do")
	public String logout(HttpSession session) {
		logger.info("logout.do");
		session.invalidate();
		return "redirect:/main.do";
	}
	@RequestMapping("registform.do")
	public String registForm() {
		logger.info("registform.do");
		
		return "regist";
	}
	@RequestMapping("registres.do")
	public String registRes(MemberDto dto) {
		logger.info("registres.do");
		System.out.println("memberBiz.insert:" + memberBiz.insert(dto));
		
		
		if(memberBiz.insert(dto) > 0) {
			return "redirect:/main.do";
		}
		
		
		return "redirect:registform.do";
		
	}

}