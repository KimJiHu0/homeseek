package com.mvc.homeseek.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.mvc.homeseek.model.dto.NoticeDto;

@Repository
public class NoticeDaoImpl implements NoticeDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	private Logger logger = LoggerFactory.getLogger(NoticeDao.class);

	@Override
	public List<NoticeDto> selectList() {
		List<NoticeDto> list = new ArrayList<NoticeDto>();
		try {
			list = sqlSession.selectList(NAMESPACE + "selectList");

			
		} catch (DataAccessException e) {
			logger.info("[ERROR] select list");
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public NoticeDto selectOne(int notice_no) {
		NoticeDto dto = null;
		try {
			dto = sqlSession.selectOne(NAMESPACE + "selectOne", notice_no);
		} catch (DataAccessException e) {
			logger.info("[ERROR] select one - " + notice_no);
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public int insert(NoticeDto dto) {
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
	public int update(NoticeDto dto) {
		int res = 0;
		try {
			res = sqlSession.update(NAMESPACE + "update", dto);
		} catch (DataAccessException e) {
			logger.info("[ERROR] update - " + dto.getNotice_no());
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int delete(int notice_no) {
		int res = 0;
		try {
			res = sqlSession.delete(NAMESPACE + "delete", notice_no);
		} catch (DataAccessException e) {
			logger.info("[ERROR] delete - " + notice_no);
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public List<NoticeDto> selectList(String keyword) {
		List<NoticeDto> list = new ArrayList<NoticeDto>();
		try {
			list = sqlSession.selectList(NAMESPACE + "selectListSearch", keyword);

			
		} catch (DataAccessException e) {
			logger.info("[ERROR] NOTICE select list Search" + keyword);
			e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public int hit(int notice_no) {
		int res = 0;
		try {
			res = sqlSession.update(NAMESPACE + "hit", notice_no);
		} catch (DataAccessException e) {
			logger.info("[ERROR] update - " + notice_no);
			e.printStackTrace();
		}
		return res;
	}

}
