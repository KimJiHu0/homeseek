package com.mvc.homeseek.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvc.homeseek.model.dto.WishDto;

@Repository
public class WishDaoImpl implements WishDao {
	
	private Logger logger = LoggerFactory.getLogger(WishDaoImpl.class);
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	// wish에 insert
	@Override
	public int insertWish(WishDto dto) {
		
		logger.info("[ WishDaoImpl ] insertWish");
		
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE + "insertWish", dto);
		} catch (Exception e) {
			logger.info("[ Error ] insertWish");
			e.printStackTrace();
		}
		return res;
	}

	// wish에서 delete
	@Override
	public int deleteWish(WishDto dto) {

		logger.info("[ WishDaoImpl ] deleteWish");
		
		int res = 0;
		
		try {
			res = sqlSession.delete(NAMESPACE + "deleteWish", dto);
		} catch (Exception e) {
			logger.info("[ Error ] deleteWish");
			e.printStackTrace();
		}
		
		return res;
	}

	// wish에 있나 없나 확인
	@Override
	public int selectWishCheck(WishDto dto) {

		logger.info("[ WishDaoImpl ] selectWish");
		
		System.out.println("다오에서 번호" + dto.getWish_no());
		System.out.println("다오에서 아이디" + dto.getWish_id());
		System.out.println("다오에서 판매자" + dto.getWish_sell_id());
		System.out.println("다오에서 방번호" + dto.getRoom_no());
		
		
		int res = 0;
		
		try {
			res = sqlSession.selectOne(NAMESPACE + "selectWish", dto);
			
		} catch (Exception e) {
			logger.info("[ Error ] selectWish");
			e.printStackTrace();
		}
		
		System.out.println("asdasdasf여기역 : " + res);
		
		return res;
	}

}
