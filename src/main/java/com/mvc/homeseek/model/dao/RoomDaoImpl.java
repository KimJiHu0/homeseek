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
	public List<RoomDto> selectList() {
		return null;
	}

	@Override
	public RoomDto selectOne(int room_no) {
		return null;
	}

	@Override
	public int insert(RoomDto room_dto) {
		return 0;
	}

	@Override
	public int update(RoomDto room_dto) {
		return 0;
	}

	@Override
	public int delete(int room_no) {
		return 0;
	}

}
