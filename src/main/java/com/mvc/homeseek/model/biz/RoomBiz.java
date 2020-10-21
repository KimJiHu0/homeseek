package com.mvc.homeseek.model.biz;

import java.util.List;

import com.mvc.homeseek.model.dto.RoomDto;

//매물 페이지 Biz
public interface RoomBiz {
	

	public int selectRoomInsert(RoomDto room_dto);
	public int selectRoomUpdate(RoomDto room_dto);
	public int selectRoomDelete(int room_no);
}
