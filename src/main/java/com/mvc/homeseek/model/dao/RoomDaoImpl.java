package com.mvc.homeseek.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvc.homeseek.model.dto.RoomDto;

@Repository
public class RoomDaoImpl implements RoomDao {
	
	//@Autowired
	//private SqlSessionTemplate sqlSession;
	

	@Override
	public List<RoomDto> selectRoomList() {
		return null;
	}

	@Override
	public RoomDto selectRoomOne(int room_no) {
		return null;
	}

	@Override
	public int selectRoomInsert(RoomDto room_dto) {
		return 0;
	}

	@Override
	public int selectRoomUpdate(RoomDto room_dto) {
		return 0;
	}

	@Override
	public int selectRoomDelete(int room_no) {
		return 0;
	}

}
