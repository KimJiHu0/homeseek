package com.mvc.homeseek.model.biz;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvc.homeseek.model.dao.RoomListDao;
import com.mvc.homeseek.model.dto.RoomDto;
import com.mvc.homseek.paging.PagingBean;

@Service
public class RoomListBizImpl implements RoomListBiz {

	@Autowired
	private RoomListDao roomlistdao;
	

	// 페이징 된 방 리스트
	@Override
	public Map<String,Object> selectRoomList(int page) {
		Map<String,Object> map = new HashMap<>();
		
		int totalCount = roomlistdao.totalCountRoomList();
		PagingBean pageBean = new PagingBean(totalCount, page);
		List<RoomDto> list = roomlistdao.selectRoomlist(pageBean.getBeginItemInPage(), pageBean.getEndItemInPage());
		
		map.put("pageBean",pageBean);
		map.put("list",list);
		
		return map;
	}

	// 지워야돼
	@Override
	public List<RoomDto> selectRoomList() {
		return roomlistdao.selectRoomlist();
	}



}
