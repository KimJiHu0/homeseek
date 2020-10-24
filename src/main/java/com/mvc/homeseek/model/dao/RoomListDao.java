package com.mvc.homeseek.model.dao;

import java.util.List;

import com.mvc.homeseek.model.dto.RoomDto;

public interface RoomListDao {
	
	// namespace
	String NAMESPACE = "room-list-mapper.";
	
	// 방 전체 조회하는 메소드
	public List<RoomDto> selectRoomlist(int beginItemNo, int endItemNo);
	// 전체 방 갯수
	public int totalCountRoomList();
 
	
}
