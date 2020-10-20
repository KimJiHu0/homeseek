package com.mvc.homeseek.model.biz;

import java.util.List;

import org.springframework.stereotype.Service;

import com.mvc.homeseek.model.dao.RoomDao;
import com.mvc.homeseek.model.dto.RoomDto;

@Service
public class RoomBizImpl implements RoomBiz {
	
	private RoomDao roomDao;

	@Override
	public List<RoomDto> selectRoomList() {
		return roomDao.selectRoomList();
	}

	@Override
	public RoomDto selectRoomOne(int room_no) {
		return roomDao.selectRoomOne(room_no);
	}

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
