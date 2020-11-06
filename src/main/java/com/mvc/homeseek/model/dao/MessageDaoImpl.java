package com.mvc.homeseek.model.dao;

import java.util.List;

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
	
	// 다중삭제
	@Override
	public int muldelMyMsgList(int message_no) {
		
		logger.info(" [ MessageDaoImpl ] ");
		
		int res = 0;
		
		try {
			res = sqlSession.delete(NAMESPACE + "muldelMyMsgList", message_no);
		} catch (Exception e) {
			logger.info("[ Error ] muldelMyMsgList");
			e.printStackTrace();
		}
		return res;
	}
	
	// 보낸 쪽지함
	@Override
	public List<MessageDto> selectMySenMsgList(String message_senid) {

		logger.info("[ MessageDaoImpl ]");
		
		List<MessageDto> mysenmsglist = null;
		
		try {
			mysenmsglist = sqlSession.selectList(NAMESPACE + "selectMySenMsgList", message_senid);
		} catch (Exception e) {
			logger.info("[ Error ] selectMySenMsgList");
			e.printStackTrace();
		}
		return mysenmsglist;
	}

	@Override
	public List<MessageDto> selectMyReMsgList(String message_reid) {

		logger.info("[ MessageDaoImpl ]");
		
		List<MessageDto> myremsglist = null;
		
		try {
			myremsglist = sqlSession.selectList(NAMESPACE + "selectMyReMsgList", message_reid);
		} catch (Exception e) {
			logger.info("[ Error ] selectMyReMsglist");
			e.printStackTrace();
		}
		return myremsglist;
	}
}
