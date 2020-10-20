package com.mvc.homeseek.model.dao;

import java.util.List;

import com.mvc.homeseek.model.dto.RoomDto;

//매물페이지 Dao
public interface RoomDao {
	
	String NAMESPACE = "com.mvc.homeseek.room.";
	public List<RoomDto> selectList();
	public RoomDto selectOne(int room_no);
	public int insert(RoomDto room_dto);
	public int update(RoomDto room_dto);
	public int delete(int room_no);

}
