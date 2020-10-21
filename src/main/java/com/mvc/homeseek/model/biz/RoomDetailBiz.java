package com.mvc.homeseek.model.biz;

import java.util.List;

import com.mvc.homeseek.model.dto.MemberDto;
import com.mvc.homeseek.model.dto.RoomDto;

public interface RoomDetailBiz {
	
	// List에서 사진 클릭 시 넘오는 room_no로 상세보기
	public RoomDto selectRoomOne(int room_no);

}
