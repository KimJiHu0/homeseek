package com.mvc.homeseek.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvc.homeseek.model.dto.DonationDto;

@Repository
public class DonationDaoImpl implements DonationDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private Logger logger = LoggerFactory.getLogger(DonationDao.class);
	
	@Override
	public int donationInsert(DonationDto dona_dto) {
		
		int res = 0;
		try {
			res = sqlSession.insert(NAMESPACE+"donationInsert",dona_dto);
		} catch (Exception e) {
			logger.info("[ERROR] : donationInsert");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public List<DonationDto> mypageMyDonaList(String dona_id) {

		logger.info(" [ DonationDaoImpl ] ");
		
		List<DonationDto> donalist = null;
		
		try {
			donalist = sqlSession.selectList(NAMESPACE + "selectMyDonaList", dona_id);
		} catch (Exception e) {
			logger.info(" [ Error ] mypageMyDonaList ");
			e.printStackTrace();
		}
		return donalist;
	}

}
