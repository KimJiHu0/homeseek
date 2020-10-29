package com.mvc.homeseek.model.biz;

import java.util.List;

import com.mvc.homeseek.model.dto.RoomDto;

//매물 페이지 Biz
public interface RoomBiz {
	

	public int selectRoomInsert(RoomDto room_dto);
	
	// 보증금이 없을때
	public int selectRoomInsert2(RoomDto room_dto);
	
	
}
