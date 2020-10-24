package com.mvc.homeseek.model.biz;

import java.util.List;
import java.util.Map;

import com.mvc.homeseek.model.dto.RoomDto;

public interface RoomListBiz {

	
	// 방 전체보기 위한 메소드(페이징된거)
	public Map<String,Object> selectRoomList(int page);
	
}
