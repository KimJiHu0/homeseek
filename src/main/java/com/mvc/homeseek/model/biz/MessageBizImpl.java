package com.mvc.homeseek.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvc.homeseek.model.dao.MessageDao;
import com.mvc.homeseek.model.dto.MessageDto;

@Service
public class MessageBizImpl implements MessageBiz {

	@Autowired
	private MessageDao messagedao;
	
	@Override
	public int insertMessage(MessageDto messagedto) {
		return messagedao.insertMessage(messagedto);
	}

	@Override
	public List<MessageDto> selectMySenMsgList(String message_senid) {
		return messagedao.selectMySenMsgList(message_senid);
	}

	@Override
	public int muldelMyReMsgList(int message_no) {
		return messagedao.muldelMyReMsgList(message_no);
	}
	
	@Override
	public int muldelMySenMsgList(int message_no) {
		return messagedao.muldelMySenMsgList(message_no);
	}

	@Override
	public List<MessageDto> selectMyReMsgList(String message_reid) {
		return messagedao.selectMyReMsgList(message_reid);
	}

	@Override
	public MessageDto selectMyMsgDetail(int message_no) {
		return messagedao.selectMyMsgDetail(message_no);
	}
}
