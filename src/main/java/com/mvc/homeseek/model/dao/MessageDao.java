package com.mvc.homeseek.model.dao;

import com.mvc.homeseek.model.dto.MessageDto;

public interface MessageDao {
	
	String NAMESPACE = "message-mapper.";
	
	// 쪽지 보내기
	public int insertMessage(MessageDto messagedto);
}
