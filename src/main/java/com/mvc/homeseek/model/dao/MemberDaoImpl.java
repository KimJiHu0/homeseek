package com.mvc.homeseek.model.dao;

import javax.inject.Inject;

import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvc.homeseek.model.dto.MemberDto;

@Repository
public class MemberDaoImpl implements MemberDao {
	
	@Inject
	private SqlSession session;

	private Logger logger = LoggerFactory.getLogger(MemberDaoImpl.class);
	@Autowired
	private SqlSessionTemplate sqlSession;

	// 로그인
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

	// 회원 가입
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

	// 방 상세보기에서 유저 정보 뽑는 dao
	@Override
	public MemberDto selectMemberById(String id) {

		MemberDto dto = null;

		try {
			dto = sqlSession.selectOne(NAMESPACE + "selectMemberById", id);
		} catch (Exception e) {
			logger.info("[ Error ] selectMemberById");
			e.printStackTrace();
		}
		return dto;
	}

	// 회원가입 시 id 중복검사
	@Override
	public int checkId(String member_id) {

		int res = 0;

		try {
			res = sqlSession.selectOne(NAMESPACE + "checkId", member_id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return res;
	}

	// sns에서 snsid를 뽑는 dao
	@Override
	public MemberDto getBySns(MemberDto snsUser) {
		
		//네이버 아이디가 있으면,,,
		if (StringUtils.isNotEmpty(snsUser.getMember_naverid())) {
			System.out.println("!!!!!!!MemberDaoImpl입니다 :naver !!!!!!"+snsUser.getMember_id());
			return session.selectOne(NAMESPACE + "getBySnsNaver", snsUser.getMember_id());
		} else if(StringUtils.isNotEmpty(snsUser.getMember_kakaoid())){
			System.out.println("!!!!!!!MemberDaoImpl입니다 :kakao !!!!!!"+snsUser.getMember_id());
			return session.selectOne(NAMESPACE + "getBySnsKakao", snsUser.getMember_id());
		//구글아이디면,,,		
		} else {
			return session.selectOne(NAMESPACE + "getBySnsGoogle", snsUser.getMember_googleid());
		}
	}

	// 신고당하면 member의 enabled를 r로 변경하기 위한 메소드
	@Override
	public int updateMemberEnabled(String report_reid) {
		
		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE + "updateMemberEnabled", report_reid);
		} catch (Exception e) {
			logger.info("[ Error ] updateMemberEnabled");
			e.printStackTrace();
		}
		return res;
	}
}