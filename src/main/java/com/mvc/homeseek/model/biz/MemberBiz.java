package com.mvc.homeseek.model.biz;

import com.mvc.homeseek.model.dto.MemberDto;

public interface MemberBiz {
	// 로그인
	public MemberDto login(MemberDto dto);

	// 회원가입
	public int insert(MemberDto dto);

	// id로 member객체 가져오기 / 방 상세보기에 적용
	public MemberDto selectMemberById(String id);

	// 회원가입 시 id 중복검사
	public int checkId(String member_id);

	// 회원가입 시 phone 중복검사
	public int checkPhone(MemberDto dto);

	// sns로그인 정보를 DB에 넣기위해
	public MemberDto getBySns(MemberDto snsUser);

	// 신고당하면 member의 enabled를 r로 변경하는 메소드
	public int updateMemberEnabled(String report_reid);

	// id 존재유무 찾기 메소드
	public int findId(MemberDto dto);

	// 찾은 아이디 뽑아주는 메소드
	public String selectId(MemberDto dto);

	// PW 존재유무 찾기 메소드
	public int findPw(MemberDto dto);

	// 찾은 비밀번호 뽑아주는 메소드
	public int searchPassword(MemberDto dto);

}
