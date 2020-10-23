package com.mvc.homeseek.model.dao;

import com.mvc.homeseek.model.dto.ReportDto;

public interface ReportDao {
	
	String NAMESPACE = "report-mapper.";
	
	// 신고하는 메소드
	public int insertReport(ReportDto dto);

}
