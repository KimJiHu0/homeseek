package com.mvc.homeseek.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.mvc.homeseek.model.dto.CommentDto;

public class CommentDaoImpl implements CommentDao {
	
	private Logger logger = LoggerFactory.getLogger(CommentDaoImpl.class);
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	// 쪽지 insert
	@Override
	public int insertComment(CommentDto commentdto) {
		
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE + "insertComment", commentdto);
		} catch (Exception e) {
			logger.info(" [ Error ] insertComment ");
			e.printStackTrace();
		}
		
		return res;
	}

}
