package com.mvc.homeseek.model.biz;

import com.mvc.homeseek.model.dto.RoomDto;

public interface RoomDetailBiz {

	// List에서 사진 클릭 시 넘오는 room_no로 상세보기
	public RoomDto selectRoomOne(int room_no);

	// Detail에서 room_no를 받아서 update하기
	public int updateRoomOne(RoomDto dto);

	// Delete에서 room_no를 받아서 delete하기
	public int deleteRoomOne(int room_no);
	

}
