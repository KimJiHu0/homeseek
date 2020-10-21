package com.mvc.homeseek.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvc.homeseek.model.dao.RoomListDao;
import com.mvc.homeseek.model.dto.RoomDto;

@Service
public class RoomListBizImpl implements RoomListBiz {

	@Autowired
	private RoomListDao roomlistdao;
	
	// 방 전체보기
	@Override
	public List<RoomDto> selectRoomList() {
		return roomlistdao.selectRoomList();
	}

}
