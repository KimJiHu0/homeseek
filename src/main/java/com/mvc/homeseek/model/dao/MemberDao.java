package com.mvc.homeseek.model.dao;

import com.mvc.homeseek.model.dto.MemberDto;

public interface MemberDao {
	
	String NAMESPACE = "member.";
	
	// 로그인
	public MemberDto login(MemberDto dto);
	// 회원가입
	public int insert(MemberDto dto);
	// id로 member객체 가져오기 / 방 상세보기에 적용
	public MemberDto selectMemberById(String id);
	// id 중복체크 검사
	public int checkId(String member_id);
	// sns멤버 정보를 DB에 가져오기
	public MemberDto getBySns(MemberDto snsUser);
	// 신고당하면 member의 enabled를 r로 변경하는 메소드
	public int updateMemberEnabled(String report_reid);
}