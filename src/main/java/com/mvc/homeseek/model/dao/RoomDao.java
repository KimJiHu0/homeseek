package com.mvc.homeseek.model.dao;

import java.util.List;

import com.mvc.homeseek.model.dto.RoomDto;

//매물페이지 Dao
public interface RoomDao {
	
	String NAMESPACE = "com.mvc.homeseek.room.";
	public List<RoomDto> selectRoomList();
	public RoomDto selectRoomOne(int room_no);
	public int selectRoomInsert(RoomDto room_dto);
	public int selectRoomUpdate(RoomDto room_dto);
	public int selectRoomDelete(int room_no);

}
