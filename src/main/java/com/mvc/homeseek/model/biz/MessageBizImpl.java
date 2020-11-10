package com.mvc.homeseek.model.biz;

import java.util.List;
import java.util.Map;

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

	@Override
	public int countMsgBySenid(String message_senid) {
		return messagedao.countMsgBySenid(message_senid);
	}
	
	@Override
	public List<MessageDto> MsgBySenid(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return messagedao.MsgBySenid(map);
	}
	@Override
	public int countMsgByReid(String message_reid) {
		// TODO Auto-generated method stub
		return messagedao.countMsgByReid(message_reid);
	}
	@Override
	public List<MessageDto> MsgByReid(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return messagedao.MsgByReid(map);
	}
}
