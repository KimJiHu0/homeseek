package com.mvc.homeseek.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mvc.homeseek.model.biz.MemberBiz;
import com.mvc.homeseek.model.biz.ReportBiz;
import com.mvc.homeseek.model.dto.MemberDto;
import com.mvc.homeseek.model.dto.ReportDto;

@Controller
public class ReportController {
	
	private Logger logger = LoggerFactory.getLogger(ReportController.class);
	
	@Autowired
	private ReportBiz reportbiz;
	
	@Autowired
	private MemberBiz memberbiz;
	
	
	@RequestMapping("reportmember.do")
	public String insertReportForm(@RequestParam("room_id") String report_reid,Model model, HttpSession session) {
		
		logger.info("[ ReportController ] insertReportform");
		
		// report_reid : 신고받는사람(매물올린사람)
		// report_senid : 신고하는사람(session값에 있는사람)
		
		// 신고받는 id의 dto선언
		MemberDto report_reuser = new MemberDto();
		// 신고하는 id의 dto선언
		MemberDto report_senuser = new MemberDto();
		
		// 새로운 memberdto에서 session에 담겨져있는 애를 memberdto타입으로 변환 후
		// report_senuserdto에 담아준다.
		MemberDto report_senuserdto = (MemberDto) session.getAttribute("login");
		// 그 report_senuserdto에 있는 member_id값을 report_senid에 담아준다.
		// session값에 담겨져있는 id를 추출했다.
		String report_senid = report_senuserdto.getMember_id();
		
		report_reuser = memberbiz.selectMemberById(report_reid);
		report_senuser = memberbiz.selectMemberById(report_senid);
		model.addAttribute("report_reuser", report_reuser);
		model.addAttribute("report_senuser", report_senuser);
		
		return "reportMemberForm";
	}
	
	@RequestMapping("reportmemberres.do")
	public void reportMemberRes(ReportDto report_dto, RedirectAttributes msg) {
		logger.info("[ ReportController ] ReportmMember");
		
		int res = reportbiz.insertReport(report_dto);
		// report_dto에 신고받는 id인 report_reid를 뽑아서 String에 담아준다.
		// 그리고 
		
		if(res > 0) {
			// 신고에 성공하면 member의 enabled를 R로 update
			memberbiz.updateMemberEnabled(report_dto.getReport_reid());
			msg.addFlashAttribute("msg", "신고가 처리되었습니다.");
			// 그 후에 DETAIL로 가야함. 그러기 위해서는 ROOM_NO가 필요함
		} else {
			msg.addFlashAttribute("msg", "신고가 실패되었습니다.");
		}
	}

}
