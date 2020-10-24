package com.mvc.homeseek.model.dao;


import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvc.homeseek.model.dto.RoomDto;

@Repository
public class RoomDaoImpl implements RoomDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private Logger logger = LoggerFactory.getLogger(RoomDao.class);
	
	@Override
	public int selectRoomInsert(RoomDto room_dto) {
		
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE+"selectRoomInsert");
		} catch (Exception e) {
			logger.info("[ERROR] : selectRoomInsert");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int selectRoomUpdate(RoomDto room_dto) {
		
		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE+"selectRoomUpdate");
		} catch (Exception e) {
			logger.info("[ERROR] : selectRoomUpdate");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int selectRoomDelete(int room_no) {
		
		int res = 0;
		
		try {
			res = sqlSession.delete(NAMESPACE+"selectRoomDelete");
		} catch (Exception e) {
			logger.info("[ERROR] : selectRoomDelete");
			e.printStackTrace();
		}
		
		return res;
	}

}








