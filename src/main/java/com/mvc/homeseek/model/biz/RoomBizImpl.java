package com.mvc.homeseek.model.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvc.homeseek.model.dao.RoomDao;
import com.mvc.homeseek.model.dto.RoomDto;

@Service
public class RoomBizImpl implements RoomBiz {
	
	@Autowired
	private RoomDao roomDao;


	@Override
	public int selectRoomInsert(RoomDto room_dto) {
		return roomDao.selectRoomInsert(room_dto);
	}

	// 보증금이 없을때
	@Override
	public int selectRoomInsert2(RoomDto room_dto) {
		
		return roomDao.selectRoomInsert2(room_dto);
	}

}
