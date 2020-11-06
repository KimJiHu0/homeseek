package com.mvc.homeseek.model.biz;

import java.util.List;
import java.util.Map;

import org.json.JSONObject;

import com.mvc.homeseek.model.dto.RoomDto;

public interface RoomListBiz {

	// 방 전체보기 위한 메소드(페이징된거)
	public Map<String, Object> selectRoomList(int page);

	public List<RoomDto> selectRoomList2();

	// 숫자를 한글로 바꿔서 리턴하기
	public String changToKorean(Object room_type);

	public List<RoomDto> searchToRoomList(JSONObject obj);

	// session에 담겨있는 사용자가 올린 roomList 뽑기
	public List<RoomDto> mypageMyRoomList(String room_id);

	// 다중삭제
	public int muldeleteMyRoomList(int room_no);
}
