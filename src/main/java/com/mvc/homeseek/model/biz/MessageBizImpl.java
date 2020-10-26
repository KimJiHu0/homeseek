package com.mvc.homeseek.model.biz;

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

}
