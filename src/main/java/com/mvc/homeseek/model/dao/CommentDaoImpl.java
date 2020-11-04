package com.mvc.homeseek.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.mvc.homeseek.model.dto.CommentDto;

@Repository
public class CommentDaoImpl implements CommentDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private Logger logger = LoggerFactory.getLogger(CommentDaoImpl.class);

	@Override
	public List<CommentDto> commentList(int qna_no) {
		List<CommentDto> list = new ArrayList<CommentDto>();
		try {
			list = sqlSession.selectList(NAMESPACE + "commentList", qna_no );

			
		} catch (DataAccessException e) {
			logger.info("[ERROR] Comment select list");
			e.printStackTrace();
		}
		return list;
		
	}

	@Override
	public int commentInsert(CommentDto comment) {
		int res = 0;
		try {
			res = sqlSession.insert(NAMESPACE + "commentInsert", comment);
		} catch (DataAccessException e) {
			logger.info("[ERROR] commentInsert");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int commentUpdate(CommentDto comment) {
		int res = 0;
		try {
			res = sqlSession.update(NAMESPACE + "commentUpdate", comment);
		} catch (DataAccessException e) {
			logger.info("[ERROR] commentUpdate - " + comment.getQna_no());
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int commentDelete(int comm_no) {
		int res = 0;
		try {
			res = sqlSession.delete(NAMESPACE + "commentDelete", comm_no);
		} catch (DataAccessException e) {
			logger.info("[ERROR] commentDelete - " + comm_no);
			e.printStackTrace();
		}
		return res;
	}
	

}
