package com.mvc.homeseek.model.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvc.homeseek.model.dao.RoomDetailDao;
import com.mvc.homeseek.model.dto.RoomDto;

@Service
public class RoomDetailBizImpl implements RoomDetailBiz {

	@Autowired
	private RoomDetailDao roomdetaildao;

	// 방 상세보기
	@Override
	public RoomDto selectRoomOne(int room_no) {
		return roomdetaildao.selectRoomOne(room_no);
	}

	@Override
	public int updateRoomOne(RoomDto dto) {
		return roomdetaildao.updateRoomOne(dto);
	}

	@Override
	public int deleteRoomOne(int room_no) {
		return roomdetaildao.deleteRoomOne(room_no);
	}

	@Override
	public int updateRoomOnePhoto(RoomDto dto) {
		return roomdetaildao.updateRoomOnePhoto(dto);
	}
}
