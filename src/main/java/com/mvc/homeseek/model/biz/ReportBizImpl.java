package com.mvc.homeseek.model.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvc.homeseek.model.dao.ReportDao;
import com.mvc.homeseek.model.dto.ReportDto;

@Service
public class ReportBizImpl implements ReportBiz {
	
	@Autowired
	private ReportDao reportdao;

	@Override
	public int insertReport(ReportDto dto) {
		return reportdao.insertReport(dto);
	}

}
