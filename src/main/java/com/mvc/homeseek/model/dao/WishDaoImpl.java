package com.mvc.homeseek.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvc.homeseek.model.dto.RoomDto;
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
		
		int res = 0;
		
		try {
			res = sqlSession.selectOne(NAMESPACE + "selectWish", dto);
			
		} catch (Exception e) {
			logger.info("[ Error ] selectWish");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public List<WishDto> selectWishList(String wish_id) {
		
		logger.info("[ WishDaoImpl ] selectWishList");
		
		List<WishDto> wishlist = new ArrayList<WishDto>();
		
		try {
			wishlist = sqlSession.selectList(NAMESPACE + "selectWishList", wish_id);
		} catch (Exception e) {
			logger.info("[ Error ] selectWishList");
			e.printStackTrace();
		}
		return wishlist;
	}
}
