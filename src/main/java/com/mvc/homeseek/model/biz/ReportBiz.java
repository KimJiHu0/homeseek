package com.mvc.homeseek.model.biz;

import com.mvc.homeseek.model.dto.ReportDto;

public interface ReportBiz {
	
	// 신고하는 메소드
	public int insertReport(ReportDto dto);

}
