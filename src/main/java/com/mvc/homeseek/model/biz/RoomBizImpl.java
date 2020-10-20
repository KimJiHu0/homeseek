package com.mvc.homeseek.model.biz;

import java.util.List;

import org.springframework.stereotype.Service;

import com.mvc.homeseek.model.dao.RoomDao;
import com.mvc.homeseek.model.dto.RoomDto;

@Service
public class RoomBizImpl implements RoomBiz {
	
	private RoomDao roomDao;
	
	@Override
	public List<RoomDto> selectList() {
		
		return roomDao.selectList();
	}

	@Override
	public RoomDto selectOne(int room_no) {
		
		return roomDao.selectOne(room_no);
	}

	@Override
	public int insert(RoomDto room_dto) {
		
		return roomDao.insert(room_dto);
	}

	@Override
	public int update(RoomDto room_dto) {
		
		return roomDao.update(room_dto);
	}

	@Override
	public int delete(int room_no) {
		
		return roomDao.delete(room_no);
	}

}
