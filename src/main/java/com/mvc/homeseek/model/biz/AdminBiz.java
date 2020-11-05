package com.mvc.homeseek.model.biz;

import java.util.List;

import com.mvc.homeseek.model.dto.MemberDto;
import com.mvc.homeseek.model.dto.ReportDto;
import com.mvc.homseek.paging.Paging;

public interface AdminBiz {
	//관리자 페이지 전체 회원 조회
	public List<MemberDto> allMember(Paging vo);
	//관리자 페이지 전체 회원 조회
	public List<ReportDto> allReport();
	//신고 승인 여부
	public ReportDto reportRes(int report_no);
	//총 게시글 수
	public int countMember();

}
