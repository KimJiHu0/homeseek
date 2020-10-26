package com.mvc.homeseek.model.biz;

import com.mvc.homeseek.model.dto.MessageDto;

public interface MessageBiz {
	
	// 쪽지 보내기
	public int insertMessage(MessageDto messagedto);

}
