package com.mvc.homeseek.model.biz;

import java.util.List;

import com.mvc.homeseek.model.dto.RoomDto;

//매물 페이지 Biz
public interface RoomBiz {
	
	public List<RoomDto> selectList();
	public RoomDto selectOne(int room_no);
	public int insert(RoomDto room_dto);
	public int update(RoomDto room_dto);
	public int delete(int room_no);
}
