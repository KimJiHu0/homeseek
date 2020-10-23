package com.mvc.homeseek.model.biz;



import com.mvc.homeseek.model.dto.MemberDto;

public interface MemberBiz {
	// 로그인
	public MemberDto login(MemberDto dto);
	//회원가입 
	public int insert(MemberDto dto);
	// id로 member객체 가져오기 / 방 상세보기에 적용
	public MemberDto selectMemberById(String id);
	//회원가입 시 id 중복검사
	public int checkId(String member_id);
	//sns로그인 정보를 DB에 넣기위해
	public MemberDto getBySns(MemberDto snsUser);

}
