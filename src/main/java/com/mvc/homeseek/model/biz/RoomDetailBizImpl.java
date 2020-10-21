package com.mvc.homeseek.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvc.homeseek.model.dao.RoomDetailDao;
import com.mvc.homeseek.model.dto.MemberDto;
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

}
