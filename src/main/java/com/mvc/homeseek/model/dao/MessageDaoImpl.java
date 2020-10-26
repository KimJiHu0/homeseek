package com.mvc.homeseek.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvc.homeseek.model.dto.MessageDto;

@Repository
public class MessageDaoImpl implements MessageDao {

	private Logger logger = LoggerFactory.getLogger(MessageDaoImpl.class);
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	// 쪽지 insert
	@Override
	public int insertMessage(MessageDto messagedto) {
		
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE + "insertMessage", messagedto);
		} catch (Exception e) {
			logger.info(" [ Error ] insertMessage ");
			e.printStackTrace();
		}
		return res;
	}

}
