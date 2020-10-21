package com.mvc.homeseek.model.biz;

import com.mvc.homeseek.model.dto.MemberDto;

public interface MemberBiz {
	// 로그인
	public MemberDto login(MemberDto dto);
  // 
	public int insert(MemberDto dto);
	// id로 member객체 가져오기 / 방 상세보기에 적용
	public MemberDto selectMemberById(String id);

}
