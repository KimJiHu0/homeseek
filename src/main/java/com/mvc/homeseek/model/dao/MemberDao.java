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
}