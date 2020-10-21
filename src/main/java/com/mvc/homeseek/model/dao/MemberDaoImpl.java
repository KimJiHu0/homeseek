package com.mvc.homeseek.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvc.homeseek.model.dto.MemberDto;

@Repository
public class MemberDaoImpl implements MemberDao {
	
	private Logger logger = LoggerFactory.getLogger(MemberDaoImpl.class);
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public MemberDto login(MemberDto dto) {
		MemberDto res = null;
		
		try {
			res = sqlSession.selectOne(NAMESPACE + "login", dto);
		} catch (Exception e) {
			logger.info("error login");
			e.printStackTrace();
		} 
		
		return res;
	}
	
	@Override
	public int insert(MemberDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE + "insert", dto);
		} catch (Exception e) {
			logger.info("error insert");
			e.printStackTrace();
		}
		
		return res;
	}
}