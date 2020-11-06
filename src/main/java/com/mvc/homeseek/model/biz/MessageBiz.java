package com.mvc.homeseek.model.biz;

import java.util.List;

import com.mvc.homeseek.model.dto.MessageDto;

public interface MessageBiz {

	// 쪽지 보내기
	public int insertMessage(MessageDto messagedto);

	// 보낸/받은 쪽지 다중삭제
	public int muldelMyMsgList(int message_no);

	// 보낸 쪽지함 list
	public List<MessageDto> selectMySenMsgList(String message_senid);

	// 받은 쪽지함 list
	public List<MessageDto> selectMyReMsgList(String message_reid);
}
