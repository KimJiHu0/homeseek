package com.mvc.homeseek.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvc.homeseek.model.dto.ReportDto;

@Repository
public class ReportDaoImpl implements ReportDao {

	private Logger logger = LoggerFactory.getLogger(ReportDaoImpl.class);
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insertReport(ReportDto dto) {
		
		logger.info("[ ReportDao ] insertReport");
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE + "insertReport", dto);
		} catch (Exception e) {
			logger.info("[ Error ] insertReport");
			e.printStackTrace();
		}
		return res;
	}
}
