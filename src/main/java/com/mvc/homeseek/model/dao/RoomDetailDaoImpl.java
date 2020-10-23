package com.mvc.homeseek.model.dao;


import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvc.homeseek.model.dto.RoomDto;

@Repository
public class RoomDetailDaoImpl implements RoomDetailDao {

	private Logger logger = LoggerFactory.getLogger(RoomDetailDaoImpl.class);
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 방 상세보기
	@Override
	public RoomDto selectRoomOne(int room_no) {
		
		logger.info("[ RoomDetailDao ] selectRoomOne");
		
		RoomDto dto = null;
		
		try {
			dto = sqlSession.selectOne(NAMESPACE + "selectRoomOne", room_no);
		} catch (Exception e) {
			logger.info("[ Error ] selectRoomOne");
			e.printStackTrace();
		}
		return dto;
	}

	// 방 수정하기
	@Override
	public int updateRoomOne(RoomDto dto) {
		
		logger.info("[ RoomDetailDao ] updateRoomOne");
		
		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE + "updateRoomOne", dto);
		} catch (Exception e) {
			logger.info("[ Error ] updateRoomOne");
			e.printStackTrace();
		}
		return res;
	}

	// 방 삭제하기
	@Override
	public int deleteRoomOne(int room_no) {
		
		logger.info("[ RoomDetailDao ] deleteRoomOne");
		
		int res = 0;
		
		try {
			res = sqlSession.delete(NAMESPACE + "deleteRoomOne", room_no);
		} catch (Exception e) {
			logger.info("[ Error ] deleteRoomOne");
			e.printStackTrace();
		}
		return res;
	}

}
