package com.mvc.homeseek.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvc.homeseek.model.dto.DonationDto;
import com.mvc.homeseek.model.dto.MemberDto;
import com.mvc.homeseek.model.dto.ReportDto;
import com.mvc.homseek.paging.Paging;

@Repository
public class AdminDaoImpl implements AdminDao {
	

	private Logger logger = LoggerFactory.getLogger(MemberDaoImpl.class);
	@Autowired
	private SqlSessionTemplate sqlSession;


	@Override
	public List<MemberDto> allMember(Paging vo) {
	List<MemberDto> res = new ArrayList<MemberDto>();
		
		try {
			res = sqlSession.selectList(NAMESPACE + "allMember",vo);
		} catch (Exception e) {
			logger.info("allMember error");
			e.printStackTrace();
		}
		return res;
	}
	
	@Override
	public List<ReportDto> allReport() {
		List<ReportDto> res = new ArrayList<ReportDto>();
		
		try {
			res = sqlSession.selectList(NAMESPACE + "allReport");
		} catch (Exception e) {
			logger.info("allMember error");
			e.printStackTrace();
		}
		return res;
	}
	
	@Override
	public ReportDto reportRes(int report_no) {
		ReportDto dto = null;
		
		try {
			dto = sqlSession.selectOne(NAMESPACE + "reportRes", report_no);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dto;
	}
	@Override
	public int countMember() {
		int res = 0;
		
		try {
			res = sqlSession.selectOne(NAMESPACE + "countMember");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	@Override
	public List<DonationDto> allDonation(Paging vo) {
		List<DonationDto> dto = new ArrayList<DonationDto>();
		
		try {
			dto = sqlSession.selectList(NAMESPACE+"allDonation",vo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dto;
	}
	@Override
	public int countDonation() {
		int res =0;
		
		try {
			res = sqlSession.selectOne(NAMESPACE+"countDonation");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}


}
