package com.mvc.homeseek.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mvc.homeseek.model.biz.AdminBiz;
import com.mvc.homseek.paging.Paging;

@Controller
public class AdminController {
	
	Logger logger  = LoggerFactory.getLogger(AdminController.class);
	@Autowired
	private AdminBiz adminBiz;
	
	@GetMapping("/admin.do")
	public String boardList(Paging page, Model model
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		
		int total = adminBiz.countMember();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "5";
		}
		page = new Paging(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", page);
		model.addAttribute("list", adminBiz.allMember(page));
		return "adminPage";
	}
	@GetMapping("/normal.do")
	public String normalList(Paging page, Model model
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		
		int total = adminBiz.countNormal();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "5";
		}
		page = new Paging(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", page);
		model.addAttribute("list", adminBiz.NormalMember(page));
		return "adminPage";
	}
	@GetMapping("/ban.do")
	public String banList(Paging page, Model model
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		
		int total = adminBiz.countBan();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "5";
		}
		page = new Paging(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", page);
		model.addAttribute("list", adminBiz.BanMember(page));
		return "adminPage";
	}
	@GetMapping("/withdrawal.do")
	public String withdrawalList(Paging page, Model model
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		
		int total = adminBiz.countWithdrawal();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "5";
		}
		page = new Paging(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", page);
		model.addAttribute("list", adminBiz.WithdrawalMember(page));
		return "adminPage";
	}
	
	@GetMapping("/admindona.do")
	public String donaList(Paging page, Model model
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		
		int total = adminBiz.countDonation();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "5";
		}
		page = new Paging(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", page);
		model.addAttribute("list", adminBiz.allDonation(page));
		return "adminDonation";
		}

		@RequestMapping("/enableupdateform.do")
		public String reportList(Model model) {
			
			model.addAttribute("list", adminBiz.allReport());
			
			return "adminReport";
		}
		@RequestMapping("/enableupdate.do")
		public String reportUpdate(int report_no, Model model) {
			
			
			model.addAttribute("dto",adminBiz.reportRes(report_no));
			
			
			return "adminReportUpdate";
		}
		@RequestMapping("/rejectreport.do")
		public String rejectReport(int report_no) {
			
			
			int res = adminBiz.rejectReport(report_no);
			
			if(res > 0) {
				return "redirect:enableupdateform.do";
			}
			
			
			return "redirect:adminReportUpdate?report_no=" + report_no;
		}
		@RequestMapping("/acceptreport.do")
		public String acceptReport(String report_reid, int report_no) {
			
			logger.info("report_reid:::::" + report_reid);
			
			int res = adminBiz.acceptReport(report_reid);
			
			if(res > 0) {
				adminBiz.acceptDelete(report_reid);
				return "redirect:enableupdateform.do";
			}
			
			
			return "redirect:adminReportUpdate?report_no=" + report_no;
		}
		
		
}
