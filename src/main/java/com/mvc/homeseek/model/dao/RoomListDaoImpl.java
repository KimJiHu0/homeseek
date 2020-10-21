package com.mvc.homeseek.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvc.homeseek.model.dto.RoomDto;

@Repository
public class RoomListDaoImpl implements RoomListDao {

	private Logger logger = LoggerFactory.getLogger(RoomListDaoImpl.class);
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<RoomDto> selectRoomList() {
		
		List<RoomDto> list = null;
		
		try {
			list = sqlSession.selectList(NAMESPACE + "selectRoomList");
		} catch (Exception e) {
			logger.info("[ Error ] selectRoomList");
			e.printStackTrace();
		}
		return list;
	}

}
