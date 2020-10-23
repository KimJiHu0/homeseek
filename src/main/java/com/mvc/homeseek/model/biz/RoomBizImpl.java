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

	@Override
	public int selectRoomUpdate(RoomDto room_dto) {
		return roomDao.selectRoomUpdate(room_dto);
	}

	@Override
	public int selectRoomDelete(int room_no) {
		return roomDao.selectRoomDelete(room_no);
	}

}
