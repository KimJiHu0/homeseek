package com.mvc.homeseek.model.biz;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvc.homeseek.controller.RoomListController;
import com.mvc.homeseek.model.dao.RoomListDao;
import com.mvc.homeseek.model.dto.RoomDto;
import com.mvc.homseek.paging.PagingBean;

@Service
public class RoomListBizImpl implements RoomListBiz {

	@Autowired
	private RoomListDao roomlistdao;
	
	private Logger logger = LoggerFactory.getLogger(RoomListBizImpl.class);

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


	@Override
	public List<RoomDto> selectRoomList2() {
		return roomlistdao.selectRoomList2();
	}


	@Override
	public String changToKorean(Object room_type) {
		if(room_type == "1") {
			return "월세";
		}else if(room_type =="2") {
			return "전세";
		}else if(room_type=="3") {
			return "매매";
		}else if(room_type=="4") {
			return "반전세";
		}else {
			return "단기임대";
		}
	}


	@Override
	public List<RoomDto> searchToRoomList(JSONObject obj) {
		List<RoomDto> list = new ArrayList<RoomDto>();
		int result = obj.getJSONObject("hits").getJSONObject("total").getInt("value");
		
		if(result != 0) {
			JSONArray arr = obj.getJSONObject("hits").getJSONArray("hits");
			
			
			for(int i=0; i<arr.length(); i++) {
				int room_no = arr.getJSONObject(i).getJSONObject("_source").getInt("room_no");
				String room_photo = arr.getJSONObject(i).getJSONObject("_source").getString("room_photo");
				String room_type = arr.getJSONObject(i).getJSONObject("_source").getString("room_type");
				int room_price = arr.getJSONObject(i).getJSONObject("_source").getInt("room_price");
				
				RoomDto dto = new RoomDto();
				dto.setRoom_no(room_no);
				dto.setRoom_photo(room_photo);
				dto.setRoom_type(room_type);
				dto.setRoom_price(room_price);

				
				list.add(dto);
			}
			
		}
		
		return list;
	}


	@Override
	public List<RoomDto> mypageMyRoomList(String room_id) {
		return roomlistdao.mypageMyRoomList(room_id);
	}




}
