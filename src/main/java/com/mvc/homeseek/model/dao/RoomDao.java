package com.mvc.homeseek.model.dao;

import com.mvc.homeseek.model.dto.RoomDto;

//매물페이지 Dao
public interface RoomDao {
	
	String NAMESPACE = "roomInsert.";

	public int selectRoomInsert(RoomDto room_dto);
	// 보증금이 없을때
	public int selectRoomInsert2(RoomDto room_dto);
	

}
