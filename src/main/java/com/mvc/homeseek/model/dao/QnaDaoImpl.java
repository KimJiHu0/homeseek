package com.mvc.homeseek.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.mvc.homeseek.model.dto.QnaDto;

@Repository
public class QnaDaoImpl implements QnaDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private Logger logger = LoggerFactory.getLogger(QnaDaoImpl.class);
	
	@Override
	public List<QnaDto> selectList() {
		List<QnaDto> list = new ArrayList<QnaDto>();
		try {
			list = sqlSession.selectList(NAMESPACE + "selectList");

			
		} catch (DataAccessException e) {
			logger.info("[ERROR] select list");
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public QnaDto selectOne(int qna_no) {
		QnaDto dto = null;
		try {
			dto = sqlSession.selectOne(NAMESPACE + "selectOne", qna_no);
		} catch (DataAccessException e) {
			logger.info("[ERROR] select one - " + qna_no);
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public int insert(QnaDto dto) {
		int res = 0;
		try {
			// res = jdbcTemplate.update(INSERT, new Object[] {dto.getWriter() dto.getTitle(), dto.getContent()});
			res = sqlSession.insert(NAMESPACE + "insert", dto);
		} catch (DataAccessException e) {
			logger.info("[ERROR] insert");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int update(QnaDto dto) {
		int res = 0;
		try {
			res = sqlSession.update(NAMESPACE + "update", dto);
		} catch (DataAccessException e) {
			logger.info("[ERROR] update - " + dto.getQna_no());
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int delete(int qna_no) {
		int res = 0;
		try {
			res = sqlSession.delete(NAMESPACE + "delete", qna_no);
		} catch (DataAccessException e) {
			logger.info("[ERROR] delete - " + qna_no);
			e.printStackTrace();
		}
		return res;
	}
	
	@Override
	public List<QnaDto> selectList(String keyword) {
		List<QnaDto> list = new ArrayList<QnaDto>();
		try {
			list = sqlSession.selectList(NAMESPACE + "selectListSearch", keyword);

			
		} catch (DataAccessException e) {
			logger.info("[ERROR] QNA select list Search" + keyword);
			e.printStackTrace();
		}
		return list;
	}

}
