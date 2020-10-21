package com.mvc.homeseek.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvc.homeseek.model.dto.MemberDto;
import com.mvc.homeseek.model.dto.RoomDto;

@Repository
public class RoomDetailDaoImpl implements RoomDetailDao {

	private Logger logger = LoggerFactory.getLogger(RoomDetailDaoImpl.class);
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 방 상세보기
	@Override
	public RoomDto selectRoomOne(int room_no) {
		
		RoomDto dto = null;
		
		try {
			dto = sqlSession.selectOne(NAMESPACE + "selectRoomOne", room_no);
		} catch (Exception e) {
			logger.info("[ Error ] selectRoomOne");
			e.printStackTrace();
		}
		return dto;
	}

}
