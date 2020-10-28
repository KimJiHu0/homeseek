package com.mvc.homeseek.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mvc.homeseek.model.biz.RoomListBiz;
import com.mvc.homeseek.model.dto.RoomDto;


@Controller
public class RoomListController {
	
	private Logger logger = LoggerFactory.getLogger(RoomListController.class);
	
	@Autowired
	private RoomListBiz roomlistbiz;
	
	// 전체 조회
	@RequestMapping("listroom.do")
	public String roomList(@RequestParam(value="page",defaultValue="1")int page, Model model, String searchContent) {
		logger.info("[ Room List ]");
		
		Map<String,Object> pagingMap = roomlistbiz.selectRoomList(page);
		
		model.addAttribute("list",pagingMap.get("list"));
		model.addAttribute("pageBean",pagingMap.get("pageBean"));
		model.addAttribute("searchContent",searchContent);
		
		return "roomList";
	}
	
	// 스크롤 페이징 확인위해서 
	@RequestMapping("listroom2.do")
	public String roomList2(Model model) {
		logger.info("[ Room List 2 ]");
		
		List<RoomDto> AllList = roomlistbiz.selectRoomList2();
		List<RoomDto> list = new ArrayList<>();
		
		
		for(int i=0; i<8; i++) {
			list.add(AllList.get(i));
		}
		
		model.addAttribute("list",list);
		
		return "roomList";
	}
	
	@RequestMapping("/appendList.do")
	@ResponseBody
	public Object appendList(String cnt) {
		//여기서 ES 써가지고 값을 다시 가져와야함..하..이게 되나?d
		
		int num = Integer.parseInt(cnt);
		
		List<RoomDto> AllList =  roomlistbiz.selectRoomList2();
		List<RoomDto> roomlist = new ArrayList<>();
		Map<String,Object> resMap = new HashMap<>();
		
		int index = num*8; // for문 시작할 숫자
		
		System.out.println("index : "+index);
		
		
		
		if(AllList.get(index) == null) {
			resMap.put("msg",true);
			return resMap;
		}
		else {
			if(index >= AllList.size() ||(index+8) >= AllList.size()) {
				for(int i=index; i<AllList.size(); i++) {
					roomlist.add(AllList.get(i));
				}
			}else {
				for(int i=index; i<index+8; i++) {
					roomlist.add(AllList.get(i));
				}
			}
		}
		
		resMap.put("roomlist",roomlist);
		
		return resMap;
	}
}
