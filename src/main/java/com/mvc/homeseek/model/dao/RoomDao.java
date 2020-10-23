package com.mvc.homeseek.model.dao;

import com.mvc.homeseek.model.dto.RoomDto;

//매물페이지 Dao
public interface RoomDao {
	
	String NAMESPACE = "roomInsert.";

	public int selectRoomInsert(RoomDto room_dto);
	public int selectRoomUpdate(RoomDto room_dto);
	public int selectRoomDelete(int room_no);

}
