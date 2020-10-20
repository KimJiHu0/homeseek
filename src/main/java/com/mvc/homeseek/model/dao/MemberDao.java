package com.mvc.homeseek.model.dao;

import com.mvc.homeseek.model.dto.MemberDto;

public interface MemberDao {
	
	String NAMESPACE = "member.";
	
	public MemberDto login(MemberDto dto);
}
