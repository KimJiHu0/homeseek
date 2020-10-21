package com.mvc.homeseek.model.biz;

import java.util.List;

import com.mvc.homeseek.model.dto.RoomDto;

public interface RoomListBiz {
	
	// 방 전체보기 위한 메소드
	public List<RoomDto> selectRoomList();

}
